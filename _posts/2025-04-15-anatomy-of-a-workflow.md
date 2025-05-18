---
layout: post
title: Anatomy of a Minimal Pipulate Workflow
description: "Pipulate Dev Guide (Ch. 1): Anatomy of a minimal workflow. Deep dive into the 'shim' template's class structure, step logic, core methods, & HTMX patterns."
group: guide
---

Here's the first "chapter" of the guide, focusing on the foundational anatomy of a minimal Pipulate workflow, using the "widget shim" (`700_widget_shim.py`) as the primary example. This lays the groundwork for understanding how more complex widgets are built upon this core structure.

## Pipulate Workflow Development Guide

### Chapter 1: The Anatomy of a Minimal Pipulate Workflow – The "Shim"

**1.1 Introduction to Pipulate Workflows**

Pipulate workflows are designed as linear, step-by-step processes, often intended for end-users who interact with a web interface without needing to see or modify the underlying Python code. The core philosophy emphasizes:

  * **Local-First Operation:** Workflows run entirely on the user's machine, ensuring data privacy and control.
  * **Server-Side State:** All workflow state is managed on the server, simplifying the client-side and making state changes observable.
  * **FastHTML & HTMX:** The user interface is built using FastHTML for Python-centric HTML generation and HTMX for dynamic, server-rendered updates with minimal client-side JavaScript.
  * **Explicit Processes:** Workflows are "WET" (Write Everything Twice/Explicit), making them easy to understand, debug, and port from experimental scripts or Jupyter Notebooks.
  * **Chain Reaction Pattern:** Each step explicitly triggers the next, creating a reliable and predictable flow of execution.

The `plugins/700_widget_shim.py` file serves as the most basic template—a "blank canvas"—for creating new workflows. Understanding its structure is key to developing any Pipulate widget or multi-step process.

**1.2 Core Components of a Workflow Class**

Let's dissect the `WidgetDesigner` class within `700_widget_shim.py` (or a similarly structured minimal workflow).

**1.2.1 File Naming and Discovery**

  * **Location:** Workflow plugin files reside in the `plugins/` directory.
  * **Naming Convention:** Files typically start with a numeric prefix (e.g., `700_widget_shim.py`). This prefix dictates the order in which workflows appear in the UI menu.
  * **Automatic Registration:** `server.py` automatically discovers and registers Python files in the `plugins/` directory. The numeric prefix is stripped to form the internal `APP_NAME` for the workflow (e.g., `700_widget_shim.py` becomes `widget_shim`). Files starting with `xx_` or containing parentheses are typically skipped, allowing for in-progress or experimental work.

**1.2.2 Class Definition and Configuration Constants**

Every workflow is encapsulated within a Python class. This class contains several key configuration constants:

  * `APP_NAME` (e.g., `design_widget` in the shim, though for a real plugin it would match the filename like `widget_shim`):
      * This is the **internal identifier** for the workflow.
      * It's crucial for constructing URL routes (`/{APP_NAME}/...`) and for namespacing data in the `pipeline` database table.
      * **Convention:** This should match the filename after stripping the numeric prefix and `.py` extension.
      * **Important:** The `APP_NAME` must be different from the public endpoint derived from the filename to avoid conflicts.
  * `DISPLAY_NAME` (e.g., `"Widget Shim"`):
      * The **user-friendly name** displayed in the Pipulate UI (e.g., in the "App" dropdown menu).
  * `ENDPOINT_MESSAGE` (e.g., `"Welcome to the Widget Shim! ..."`):
      * Informational text displayed on the workflow's initial landing page, guiding the user.
  * `TRAINING_PROMPT` (e.g., `"This is a specialized workflow for designing..."`):
      * Context provided to the integrated LLM (Ollama) when this workflow is active.
      * It can be a direct string or a filename (e.g., `"my_widget_training.md"`) pointing to a Markdown file in the `training/` directory. This allows for more extensive context for the LLM.

**1.2.3 The `__init__` Constructor**

The constructor `__init__(self, app, pipulate, pipeline, db, app_name=APP_NAME)` is standard:

  * `app`: The FastHTML application instance.
  * `pipulate`: An instance of the core `Pipulate` helper class from `server.py`. This provides essential methods for state management, UI generation, and LLM interaction.
  * `pipeline`: A reference to the `pipeline` database table object (managed by MiniDataAPI via `fast_app` in `server.py`). This table stores the state of all workflow instances.
  * `db`: An instance of `DictLikeDB` from `server.py`, a key-value store (backed by the `store` SQLite table) for global application settings (like last selected profile, current workflow ID).
  * `app_name=APP_NAME`: Sets the internal `self.app_name` attribute, usually defaulting to the class's `APP_NAME` constant.
  * `self.message_queue = pip.message_queue`: A queue for sending messages to the user/LLM chat interface in an ordered fashion.

**Key Structures Initialized in `__init__`:**

1.  **`steps` List and `Step` NamedTuple:**
    This list defines the sequence of operations in the workflow. Each element is a `Step` namedtuple:

    ```python
    Step = namedtuple('Step', ['id', 'done', 'show', 'refill', 'transform'], defaults=(None,))
    ```

      * `id` (str): A unique identifier for the step, e.g., `'step_01'`. Used in URL routes (`/{app_name}/{step_id}`), DOM element IDs, and for internal state tracking.
      * `done` (str): The key used to store this step's primary output or result within the workflow's JSON state blob in the `pipeline` table. This is a critical convention. For example, if `done='user_input'`, then after this step completes, the state might look like: `{"step_01": {"user_input": "some value"}}`.
      * `show` (str): A user-friendly name for the step. Often used in UI messages or for the label on a "revert" button.
      * `refill` (bool): If `True`, the input form for this step will attempt to pre-fill with existing data when the step is revisited (e.g., after a revert or if the workflow is reloaded). If `False`, the form will typically show default/suggested values.
      * `transform` (function, optional): A lambda or function that can process data from a *previous* step to suggest an input for the *current* step. Not used in the simplest shim.

    In `700_widget_shim.py`, a single placeholder step is defined:

    ```python
    steps = [
        Step(
            id='step_01',
            done='placeholder', # This step stores a value under the key 'placeholder'
            show='Step 1 Placeholder',
            refill=False,
        ),
    ]
    ```

2.  **Route Registration:**
    The `__init__` method dynamically registers URL routes for the workflow:

      * **Standard Workflow Routes:**
          * `/{app_name}` (GET): Calls `self.landing()` to show the initial page.
          * `/{app_name}/init` (POST): Calls `self.init()` to process the `pipeline_id` and start the workflow.
          * `/{app_name}/revert` (POST): Calls `self.handle_revert()` to go back to a previous step.
          * `/{app_name}/finalize` (GET, POST): Calls `self.finalize()` to display the finalize button or process finalization.
          * `/{app_name}/unfinalize` (POST): Calls `self.unfinalize()` to unlock a finalized workflow.
      * **Step-Specific Routes:** For each `Step` in `self.steps`:
          * `/{app_name}/{step.id}` (GET): Calls the method named after the step's ID (e.g., `self.step_01()`). This method displays the current state or input form for that step.
          * `/{app_name}/{step.id}_submit` (POST): Calls the method named `f"{step.id}_submit"` (e.g., `self.step_01_submit()`). This method processes the form submission for that step.

3.  **`self.step_messages` Dictionary:**
    A dictionary holding user-facing messages for various workflow states, keyed by `step.id`. Each step typically has an "input" message (when the user needs to provide data) and a "complete" message. There's also a standard "finalize" key.

    ```python
    self.step_messages = {
        "finalize": {
            "ready": "All steps complete. Ready to finalize workflow.",
            "complete": f"Workflow finalized. Use {pip.UNLOCK_BUTTON_LABEL} to make changes."
        },
        "step_01": { # Matches step.id
            "input": f"{pip.fmt('step_01')}: Please complete {steps[0].show}.", # Using step.show
            "complete": f"{steps[0].show} complete. Continue to next step."
        }
    }
    ```

4.  **Internal `finalize` Step and `self.steps_indices`:**
    A special `Step` tuple for "finalize" is typically appended to the `self.steps` list *after* the plugin-defined steps. This allows the finalization process to be handled consistently with other steps in terms of UI and state.

    ```python
    steps.append(Step(id='finalize', done='finalized', show='Finalize', refill=False))
    self.steps_indices = {step.id: i for i, step in enumerate(steps)}
    ```

    `self.steps_indices` creates a lookup for finding a step's position in the list by its ID.

**1.3 Core Workflow Engine Methods (The "Shim" Foundation)**

These asynchronous methods define the behavior of the workflow.

  * **`async def landing(self, request)`:**

      * Renders the workflow's initial entry page.
      * Displays `self.DISPLAY_NAME` and `self.ENDPOINT_MESSAGE`.
      * Presents a `Form` where the user can:
          * Enter a new `pipeline_id` (a unique key for this run of the workflow).
          * Select an existing `pipeline_id` from a `datalist` populated with previous runs of this specific workflow (`app_name` is used for filtering).
      * `pip.generate_pipeline_key(self)` suggests a default new key (e.g., `DefaultProfile-WidgetShim-01`).
      * The form POSTs to `/{self.app_name}/init`.
      * Crucially, it includes a target `Div` (e.g., `Div(id=f"{self.app_name}-container")`) where the HTMX responses from subsequent steps will be rendered.

  * **`async def init(self, request)`:**

      * Triggered by submitting the `pipeline_id` form on the `landing` page.
      * Retrieves or generates the final `pipeline_id`. It validates the input: if a user provides an ID that doesn't match the expected prefix for the current profile and plugin, it assumes the user is creating a new ID and correctly formats it with the current profile/plugin prefix.
      * Stores this `pipeline_id` in the global `db` store: `db["pipeline_id"] = pipeline_id`.
      * Initializes the workflow's state in the `pipeline` table if it doesn't exist for this `pipeline_id`, associating it with `self.app_name`: `state, error = pip.initialize_if_missing(pipeline_id, {"app_name": self.app_name})`.
      * Sends confirmation messages to the user via `self.message_queue.add(...)`.
      * **Initiates the Chain Reaction:** This is a cornerstone of Pipulate workflows. `init` returns an HTMX response that loads the *first step* of the workflow:
        ```python
        # Simplified from the shim, which uses pip.rebuild for a single step
        # For a multi-step workflow, pip.rebuild would be more common here.
        # The shim directly loads step_01.
        Div(
            Div(id="step_01", hx_get=f"/{self.app_name}/step_01", hx_trigger="load"),
            id=f"{self.app_name}-container" # This outer Div replaces the target from landing.
        )
        ```
        When this HTML is swapped into the target `Div` from `landing`, the inner `Div` for `step_01` immediately triggers an HTMX GET request to its own URL (`/{app_name}/step_01`), thus loading the first step's UI.

  * **Step Handler - GET (e.g., `async def step_01(self, request)`)**

      * This method is called when a step needs to be displayed (either initially or after a revert).
      * It retrieves the current `pipeline_id` from `db`, reads the workflow `state` using `pip.read_state()`, and gets specific `step_data` using `pip.get_step_data(pipeline_id, step.id, {})`.
      * It determines the `next_step_id` (e.g., `step_02` or `finalize`).
      * **View Logic:**
        1.  **Finalized View:** If `pip.get_step_data(pipeline_id, "finalize", {}).get("finalized")` is true and this step has data (`user_val = step_data.get(step.done)`), it displays a "locked" view of the step's content. This view *must* still include the trigger for the `next_step_id`: `Div(id=next_step_id, hx_get=f"/{self.app_name}/{next_step_id}", hx_trigger="load")`.
        2.  **Completed View (Not Reverting):** If `user_val` exists (meaning the step was previously completed) and `state.get("_revert_target") != step.id` (meaning we are not explicitly trying to revert *to this specific step's input form*), it displays the completed view. This often involves `self.pipulate.display_revert_header()` to show the stored data and offer a "Revert" button. This view also *must* include the `Div` to trigger the `next_step_id`.
        3.  **Input Form View (Default/Reverting):** If the step is not complete, or if `state.get("_revert_target") == step.id`, it displays the input form.
              * It sends an appropriate message from `self.step_messages` to the `self.message_queue`.
              * The `Form` will POST to `/{self.app_name}/{step.id}_submit`.
              * Input fields in the form should be named according to the `step.done` attribute for this step, so their values are correctly picked up by the submit handler.
              * It includes an *empty placeholder `Div(id=next_step_id)` for the next step.* This placeholder is crucial: it **does not have `hx_trigger="load"` at this stage.** The trigger is added by the corresponding `_submit` handler to ensure the chain reaction proceeds only after successful submission.

  * **Step Submit Handler - POST (e.g., `async def step_01_submit(self, request)`)**

      * This method processes the data submitted from the step's input form.
      * It retrieves form data: `form = await request.form()`, then `user_val = form.get(step.done, "")`.
      * It should validate the input (e.g., using `pip.validate_step_input()`).
      * It updates the workflow's state: `await pip.update_step_state(pipeline_id, step_id, user_val, self.steps)`. This saves `user_val` into the JSON blob in the `pipeline` table, associated with `pipeline_id`, under the key `step_id`, and within that, under the key defined by `step.done`.
      * It updates the LLM's context with the submitted data: `pip.append_to_history(f"[WIDGET CONTENT] {step.show}:\n{user_val}")`.
      * It sends a confirmation message to the user via `self.message_queue.add(...)`.
      * **Continues the Chain Reaction:** This is a critical part. The method returns an HTML response that typically includes:
          * The "completed" view of the current step (often using `pip.chain_reverter()`).
          * **The explicit trigger for the next step:** `Div(id=next_step_id, hx_get=f"/{self.app_name}/{next_step_id}", hx_trigger="load")`.
          * The entire response is wrapped in a `Div` with `id=step_id`, which matches the `hx-target` of the form, causing this new content to replace the input form.

  * **`async def finalize(self, request)` (GET/POST)**

      * **GET Request:**
          * If the workflow is already finalized (checked via `pip.get_step_data(pipeline_id, "finalize", {}).get("finalized")`): Shows a "Workflow is locked" message and a `Form` with an "Unlock 🔓" button that POSTs to `/{self.app_name}/unfinalize`.
          * If not finalized but all data-input steps are complete: Shows a `Form` with a "Finalize 🔒" button that POSTs to `/{self.app_name}/finalize`.
          * If not finalized and steps are incomplete: Returns an empty `Div(id="finalize")` (or similar placeholder), effectively showing nothing until prior steps are done.
      * **POST Request:**
          * Calls `await pip.finalize_workflow(pipeline_id)` which sets the `{"finalized": True}` flag in the "finalize" step's data in the `pipeline` table.
          * Sends a confirmation message.
          * Calls `pip.rebuild(self.app_name, self.steps)` to re-render the entire workflow UI, now reflecting the locked state.

  * **`async def unfinalize(self, request)` (POST)**

      * Calls `await pip.unfinalize_workflow(pipeline_id)` which removes the `{"finalized": True}` flag.
      * Sends a confirmation message.
      * Calls `pip.rebuild(self.app_name, self.steps)` to re-render the UI in an unlocked state.

  * **`async def handle_revert(self, request)` (POST)**

      * Called when a user clicks a "Revert" button generated by `pip.display_revert_header()`.
      * The form submission includes the `step_id` to revert to.
      * Calls `await pip.clear_steps_from(pipeline_id, step_id, self.steps)`: This crucial method removes data for all steps *after* the target `step_id` from the workflow's state (respecting the `refill` attribute of those subsequent steps via `pip.PRESERVE_REFILL` logic in `server.py`).
      * Sets a temporary flag in the state: `state["_revert_target"] = step_id`. The GET handler for `step_id` uses this flag to know it should display its input form rather than its completed view.
      * Sends a status message.
      * Calls `pip.rebuild(self.app_name, self.steps)` to re-render the entire workflow from the specified revert point.

  * **`async def get_suggestion(self, step_id, state)`**

      * This method is called by step GET handlers to pre-fill input forms.
      * In the basic shim, it typically returns an empty string: `return ""`.
      * For more complex workflows, it might implement logic based on `step.transform` or provide hardcoded examples.

**1.4 The Chain Reaction Pattern - Explicit Triggering**

The progression through a Pipulate workflow relies on a carefully orchestrated "chain reaction" of HTMX partial page updates:

1.  `landing` page has a form that POSTs to `init`.
2.  `init` returns HTML that includes a `Div` with `hx-get` for `step_01` and `hx_trigger="load"`. This immediately loads the first step.
3.  The `step_01` GET handler displays an input form.
4.  The form POSTs to `step_01_submit`.
5.  `step_01_submit` returns HTML that shows the completed view of `step_01` AND includes a new `Div` with `hx-get` for `step_02` (or `finalize`) and, crucially, `hx_trigger="load"`.
6.  This pattern repeats for each step.

The **explicit inclusion of the next step's loading `Div` with `hx_trigger="load"` in the response of the *current step's submit handler*** is vital. It ensures that the next part of the workflow loads only after the current step has been successfully processed and its state saved. This is preferred over relying on event bubbling from a common parent container, as it's more direct and reliable.

**1.5 State Management Recap**

  * **Workflow Instance State:** Stored in the `pipeline` table, keyed by `pipeline_id`. The `data` column holds a JSON blob. Each step's output (using `step.done` as the key) is an entry within this JSON.
    ```json
    // Example for pipeline_id = "MyProfile-MyWorkflow-01"
    // In 'pipeline' table, 'data' column:
    {
      "created": "2025-05-14T...",
      "updated": "2025-05-14T...",
      "app_name": "my_workflow", // Added by initialize_if_missing
      "step_01": {
        "user_input_for_step1": "some data" // 'user_input_for_step1' is step_01.done
      },
      "step_02": {
        "another_field": 123 // 'another_field' is step_02.done
      },
      "finalize": {
        "finalized": true // Set by finalize_workflow
      }
    }
    ```

  * **Global Application State:** Stored in the `store` table via the `DictLikeDB` instance (`self.db`). This includes:
      * `pipeline_id`: The currently active workflow instance.
      * `profile`: The currently selected profile.
      * Other global settings.

  * **LLM Context:** Managed through the `message_queue` and `append_to_history` methods, ensuring the LLM has the necessary context for each step of the workflow.

**1.6 Best Practices for Workflow Development**

1. **State Management:**
   * Always use `pip.update_step_state` to modify workflow state.
   * Use `pip.get_step_data` to read state, providing a default empty dict.
   * Keep state updates atomic and predictable.

2. **UI/UX:**
   * Use `pip.display_revert_header` for consistent "completed step" views.
   * Include clear messages via `self.message_queue`.
   * Follow the chain reaction pattern for reliable step progression.

3. **Error Handling:**
   * Validate inputs using `pip.validate_step_input`.
   * Use `pip.logger` for debugging and error tracking.
   * Handle edge cases gracefully (e.g., missing state, invalid inputs).

4. **Code Organization:**
   * Keep step logic focused and single-purpose.
   * Use descriptive names for `step.done` keys.
   * Document complex transformations or state dependencies.

5. **Testing:**
   * Test each step's GET and POST handlers independently.
   * Verify state updates and UI updates match expectations.
   * Test the revert and finalize flows thoroughly.

This concludes the first "chapter." I've tried to be detailed and reference the existing codebase conventions. Please let me know if this is the right level of detail and if you'd like to proceed to the next part, which would likely cover adding actual input fields to the shim and displaying their values, forming the basis of a very simple custom widget. We can then iterate towards more complex examples like the Markdown widget, incorporating its specific helper methods and client-side JS triggering.

