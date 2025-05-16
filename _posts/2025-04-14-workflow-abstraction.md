---
layout: post
title: Pipulate Workflow Abstraction
description: "Chapter 0 of the Pipulate dev guide: Learn core workflow concepts, plugin system, step anatomy, & the HTMX chain reaction pattern for local-first apps."
group: guide
---

## Pipulate Workflow Development Guide

### Chapter 0: Understanding Pipulate Workflow Concepts

**0.1 Introduction: Beyond Jupyter Notebooks**

Pipulate aims to simplify complex processes, making them accessible much like Jupyter Notebooks do, but often without exposing end-users (like SEO practitioners) to the underlying Python code. While Pipulate is designed for ease of use, it also provides a powerful framework for developers to create these "no-code" experiences.

If you're looking to build these next-generation tools, this guide is for you. Pipulate runs locally, leveraging a Python web framework pattern (akin to Flask/FastAPI) but with a unique, deep integration of HTMX for dynamic, server-rendered user interfaces. Workflows are the heart of Pipulate's custom tooling, allowing you to sequence operations step-by-step.

Before diving into the code, remember:

  * **Local First:** Everything runs on your machine.
  * **Nix Environment:** `nix develop` is your entry point, setting up both Pipulate and an integrated JupyterLab environment.
  * **JupyterLab for Prototyping:** JupyterLab is included side-by-side, serving as an excellent scratchpad for mocking up logic before porting it into a structured Pipulate workflow.
  * **Chain Reaction Pattern:** Each step explicitly triggers the next, creating a reliable and predictable flow of execution.

**0.2 The Pipulate Plugin System**

Pipulate features an automatic plugin registration system centered around the `plugins/` directory.

  * **Simple CRUD Apps (DRY):** For straightforward data management (Create, Read, Update, Delete), you can quickly create new applications. A good starting point is to copy `plugins/010_tasks.py`, rename it (e.g., `015_competitors.py`), and it will auto-register. These CRUD apps are built on "Don't Repeat Yourself" (DRY) principles and are highly reusable.
  * **Flexible Workflows (WET):** For more complex, multi-step processes, Pipulate uses "Workflows." These are intentionally "Write Everything Twice/We Enjoy Typing" (WET), prioritizing explicitness and customizability over strict DRY-ness. This flexibility is where Pipulate's unique power lies, allowing you to encapsulate almost any process you might script in a Jupyter Notebook.

**0.3 Anatomy of a Workflow File: The Blueprint**

At its core, a Pipulate workflow is a Python class within a `.py` file in the `plugins/` directory. Here's a high-level schematic:

```python
# -------------------
# IMPORTS
# -------------------
# (e.g., asyncio, json, namedtuple, fasthtml.common, logger, etc.)
# For specific widgets: pandas, matplotlib, webbrowser, selenium, etc.

# -------------------
# STEP DEFINITION
# -------------------
# Typically a namedtuple for defining workflow steps
Step = namedtuple('Step', ['id', 'done', 'show', 'refill', 'transform'], defaults=(None,))

# -------------------
# WORKFLOW CLASS
# -------------------
class YourWorkflowName:
    # --- Static Configuration ---
    APP_NAME = "internal_workflow_slug"  # Private for routes & DB, different from filename
    DISPLAY_NAME = "User-Friendly Workflow Name" # For UI menus
    ENDPOINT_MESSAGE = "Welcome message for this workflow's landing page." # For chat UI
    TRAINING_PROMPT = "your_workflow_training.md" # Context for the local LLM

    # --- Initialization ---
    def __init__(self, app, pipulate, pipeline, db, app_name=APP_NAME):
        # Store injected dependencies (app, pipulate instances, pipeline & db table objects)
        # Define self.steps (list of Step namedtuples)
        # Define self.step_messages (dict of UI messages for steps)
        # Register routes (standard workflow routes + routes for each step)

    # --- Core Workflow Engine Methods ---
    async def landing(self, request):
        # Renders the initial page for this workflow (usually key input form)
        pass # ... implementation ...

    async def init(self, request):
        # Processes key from landing page, initializes state, starts chain reaction
        pass # ... implementation ...
        # CRITICAL: Returns HTML that triggers loading the first step via hx_trigger="load"

    async def finalize(self, request):
        # Handles GET (show finalize button) and POST (lock workflow)
        pass # ... implementation ...

    async def unfinalize(self, request):
        # Handles POST to unlock a finalized workflow
        pass # ... implementation ...

    async def get_suggestion(self, step_id, state):
        # Provides default/suggested values for step inputs (can use previous step data)
        pass # ... implementation ...

    async def handle_revert(self, request):
        # Clears data from subsequent steps and re-renders UI from the revert point
        pass # ... implementation ...

    # --- Step-Specific Methods (Example for one step) ---
    async def step_01(self, request): # Corresponds to Step(id='step_01', ...)
        # Renders the UI for step_01 based on current state (finalized, completed, or input)
        pass # ... implementation ...
        # If rendering input form, it includes an EMPTY Div for the next step.
        # If rendering completed/finalized, includes Div for next step WITH hx_trigger="load"

    async def step_01_submit(self, request): # Corresponds to Step(id='step_01', ...)
        # Processes form submission for step_01, updates state
        pass # ... implementation ...
        # CRITICAL: Returns HTML for completed step_01 AND the Div for step_02 WITH hx_trigger="load"
    
    # ... (methods for step_02, step_03, etc.) ...

    # --- Helper Methods (Optional) ---
    # (e.g., self._create_custom_widget_display(), self._process_data())
```

**Key Configuration Constants (explained in more detail in Chapter 1.2.2):**

  * `APP_NAME`: The internal routing and database key for the workflow. **Must be unique and different from the filename.**
  * `DISPLAY_NAME`: How the workflow appears in the UI.
  * `ENDPOINT_MESSAGE`: Initial guidance text shown in the chat interface when the user navigates to this workflow.
  * `TRAINING_PROMPT`: Context provided to the local LLM to help it understand and assist with this specific workflow. Can be a string or a filename (e.g., "my\_workflow.md" in the `training/` directory).

**0.4 The Heart of a Workflow: Steps**

A Pipulate workflow progresses through a series of defined "steps." Each step conceptually mirrors a cell in a Jupyter Notebook – it has an input phase (where the user provides data or configuration) and an execution/output phase.

Because of the web UI, each step typically involves two key methods in your workflow class:

1.  **`async def step_XX(self, request)` (GET request):**
    This method is responsible for *rendering the UI* for a specific step. It checks the current state of the workflow and the step to decide what to display. There are generally three main UI states a step can be in:

      * **Finalized State:** If the entire workflow has been marked as "finalized" (locked) and this step has completed data, it shows a read-only view of the step's output or result. Even in this state, it includes an HTMX trigger to load the *next* finalized step, ensuring the "Run All Cells" feel is maintained.
      * **Completed/Revertable State:** If the step has been completed (data is saved for it) but the workflow is not yet finalized (or the user is not trying to revert to this step's input form), it typically displays the step's result along with a "Revert" button. This button allows the user to go back and change the input for this step. This view also includes an HTMX trigger to load the *next* step.
      * **Data Collection State (Input Form):** If the step has not yet been completed, or if the user has explicitly reverted to this step, this method renders the input form for the user. This form will POST to the `step_XX_submit` method. Crucially, when rendering the input form, the placeholder for the next step *does not* yet have the `hx_trigger="load"` attribute.

2.  **`async def step_XX_submit(self, request)` (POST request):**
    This method *processes the data* submitted from the step's input form. Its key responsibilities are:

      * Retrieving and validating the submitted data.
      * Updating the workflow's persistent state with the new data (using `self.pipulate.update_step_state()`).
      * Performing any actions associated with the step (e.g., opening a URL, generating an image, calling an API).
      * Informing the user and the LLM about the outcome.
      * **Returning an HTML response that shows the "Completed State" UI for the current step AND explicitly includes the HTMX trigger (`hx_trigger="load"`) for the *next* step.** This is what propels the workflow forward.

**0.5 The Chain Reaction: Seamless Workflow Progression**

Pipulate workflows aim to emulate the "Run All Cells" experience of a Jupyter Notebook. If a workflow instance has all its necessary data filled in, navigating to it will cause all steps to execute and display their outputs sequentially, down to the final step or the first incomplete one.

This is achieved through a carefully orchestrated **chain reaction** pattern using HTMX:

1.  **Initialization (`init` method):** After the user selects or creates a workflow `pipeline_id`, the `init` method returns an HTML snippet. This snippet contains a `Div` placeholder for the *first step*, and this `Div` has the attribute `hx_trigger="load"`.
2.  **First Step Loads:** When this `Div` is injected into the page, HTMX sees `hx_trigger="load"` and immediately makes a GET request to the URL specified in `hx-get` (e.g., `/{app_name}/step_01`). This calls the `step_01` method, which renders the UI for the first step.
3.  **Step Submission and Next Step Triggering:**
      * If `step_01` renders an input form, the user fills it and submits. This POSTs to `step_01_submit`.
      * The `step_01_submit` method processes the data, saves the state, and then returns an HTML snippet. This snippet shows the *completed view* of `step_01` AND, critically, includes a new `Div` placeholder for `step_02` (or `finalize`) which *also* has `hx_trigger="load"`.
4.  **Continuation:** HTMX swaps in the response from `step_01_submit`. The `Div` for `step_02` is now in the DOM with `hx_trigger="load"`, causing an immediate GET request to `/{app_name}/step_02`, and the process repeats.

This explicit, step-by-step triggering ensures reliable progression and makes the workflow's flow easy to follow in the HTMX requests and responses. The `pipulate.rebuild(app_name, steps)` method is a related utility that reconstructs the entire UI container for a workflow, typically used after major state changes like `finalize`, `unfinalize`, or `handle_revert`, effectively restarting the chain reaction from the current state.

**0.6 State Management and Data Flow**

The workflow's state is managed through several key components:

1. **Pipeline Table:**
   * Stores workflow instance data in a JSON blob
   * Keyed by `pipeline_id` (e.g., "MyProfile-MyWorkflow-01")
   * Each step's data is stored under its `step.id` key
   * The `app_name` field links the data to the correct workflow class

2. **Store Table:**
   * Global application state via `DictLikeDB`
   * Tracks current `pipeline_id` and `profile`
   * Persists user preferences and settings

3. **LLM Context:**
   * Managed through `message_queue` and `append_to_history`
   * Ensures the LLM has context for each step
   * Helps maintain conversation continuity

**0.7 Best Practices for Workflow Development**

1. **State Management:**
   * Use descriptive keys in `step.done`
   * Keep state updates atomic
   * Use `pipulate` helper methods
   * Consider data dependencies

2. **UI/UX:**
   * Maintain consistent styling
   * Provide clear feedback
   * Use appropriate validation
   * Consider accessibility

3. **Error Handling:**
   * Validate inputs before state updates
   * Handle edge cases gracefully
   * Provide meaningful error messages
   * Log issues for debugging

4. **Code Organization:**
   * Keep step logic focused
   * Document complex transformations
   * Use consistent naming
   * Extract common patterns

**0.8 Preparing for the Deep Dive**

With this high-level understanding of workflow structure, the dual nature of steps, and the chain reaction pattern, you are now better prepared to delve into the detailed anatomy of a workflow. The next chapter will dissect the `700_widget_shim.py` file, line by line, to solidify these concepts and show how they are implemented in the most basic Pipulate workflow. This foundation will be essential as we then explore how to build upon this shim to create complex, interactive widgets.

Remember to follow the chain reaction pattern consistently, ensuring each step explicitly triggers the next one only after successful completion. This creates a reliable and predictable flow of execution through your workflow.

