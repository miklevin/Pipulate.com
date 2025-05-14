---
layout: post
title: Expanding Your Pipulate Workflow
description: "Expand Pipulate workflows: Learn to add steps, define handlers, update UI messages, and manage the HTMX chain reaction for multi-step processes."
group: guide
---

## Pipulate Workflow Development Guide

### Chapter 3: Expanding Your Workflow – Adding and Structuring New Steps

**3.1 Beyond the Bootstrap: Building Multi-Step Processes**

You've successfully bootstrapped your new workflow using `create_workflow.py` (as detailed in Chapter 2). Your workflow (e.g., `plugins/035_kungfu_workflow.py`) currently exists with a single placeholder step, correctly registered and interactive. The next stage is to transform this minimal shell into a meaningful, multi-step process.

This chapter focuses on the **structural additions** required to add new steps. We'll prioritize getting the sequence, routing, and basic display of these new steps correct before diving into their specific internal logic or complex widget integration. This adheres to our "baby steps" philosophy, allowing for incremental development and testing.

**3.2 The Anatomy of Adding a New Step**

Adding a new step to your workflow involves a few coordinated changes primarily within your workflow's Python class:

1.  **Define the Step in `__init__`:**

      * Locate the `self.steps` list in your workflow's `__init__` method.
      * Add a new `Step` namedtuple entry for your new step. Remember the `Step` definition:
        ```python
        Step = namedtuple('Step', ['id', 'done', 'show', 'refill', 'transform'], defaults=(None,))
        ```
      * Choose a unique `id` (e.g., `'step_02'`), a `done` key for its primary data, a `show` name for the UI, and appropriate `refill` and `transform` values.

2.  **Create Step Handler Methods:**

      * For each new step (e.g., with `id='step_02'`), you need to create two corresponding asynchronous methods in your class:
          * `async def step_02(self, request):` This will handle GET requests and render the UI for `step_02`.
          * `async def step_02_submit(self, request):` This will handle POST requests from `step_02`'s form submission.
      * **Template for New Step Methods:** The easiest way to create these is to copy the existing `step_01` and `step_01_submit` methods (which came from `710_blank_placeholder.py`) and adapt them for your new step number and logic.

3.  **Update UI Messages in `__init__`:**

      * Add a new entry to the `self.step_messages` dictionary for your new step's `id`, providing "input" and "complete" messages.

4.  **Route Registration (Usually Automatic):**

      * The route registration loop in `__init__` is designed to automatically create routes for any step defined in `self.steps` as long as you follow the naming convention (`step.id` for the GET handler method and `f"{step.id}_submit"` for the POST handler method). You typically won't need to modify this loop.

5.  **Adjusting the Chain Reaction:**

      * The `_submit` method of the step *preceding* your new step will need its "next step trigger" `Div` updated to point to your new step's `id` instead of directly to `'finalize'` (if it was previously the last data step).

**3.3 Example: Adding a "Choose Your Weapon" Step to "Kung Fu Download"**

Let's take our `KungfuWorkflow` (from `plugins/035_kungfu_workflow.py`) and add a second step where the user "chooses their weapon."

**Current `__init__` (simplified):**

```python
# In plugins/035_kungfu_workflow.py (class KungfuWorkflow)
# ...
    def __init__(self, app, pipulate, pipeline, db, app_name=APP_NAME):
        # ... (initial setup) ...
        steps = [
            Step(
                id='step_01',
                done='placeholder', # Currently just a placeholder
                show='Initiate Kung Fu', 
                refill=False,
            ),
            # Finalize step is added after this list by the template
        ]
        self.steps = steps # Store original user-defined steps
        # ... (message setup for step_01 and finalize) ...
        # The template appends a 'finalize' Step object to the steps list here for internal processing
        # self.steps_indices is then created based on this augmented list.
```

**Modifications for `step_02`:**

**1. Update `self.steps` in `__init__`:**

```python
# In plugins/035_kungfu_workflow.py (class KungfuWorkflow)
    def __init__(self, app, pipulate, pipeline, db, app_name=APP_NAME):
        self.app = app
        self.app_name = app_name # Use the class constant
        self.pipulate = pipulate
        self.pipeline = pipeline
        self.steps_indices = {} # Will be populated later
        self.db = db
        pip = self.pipulate
        self.message_queue = pip.message_queue

        # Define workflow steps
        defined_steps = [ # Changed variable name to avoid conflict with self.steps
            Step(
                id='step_01',
                done='initiation_acknowledged', # More meaningful 'done' key
                show='Initiate Kung Fu', 
                refill=False, # Perhaps this step just needs a button press
            ),
            Step(
                id='step_02',
                done='chosen_weapon',      # Data key for step 02
                show='Choose Your Weapon', # UI name for step 02
                refill=True,              # Let's say they can change their mind
            )
            # Finalize step will be added after this by the template logic
        ]
        
        self.steps = defined_steps # Store user-defined steps BEFORE finalize is added by template logic
        
        # Register standard workflow routes (these are generic)
        routes = [
            (f"/{self.app_name}", self.landing), # Use self.app_name
            (f"/{self.app_name}/init", self.init, ["POST"]),
            (f"/{self.app_name}/revert", self.handle_revert, ["POST"]),
            (f"/{self.app_name}/finalize", self.finalize, ["GET", "POST"]),
            (f"/{self.app_name}/unfinalize", self.unfinalize, ["POST"]),
        ]
        # Register routes for each defined step
        for step_obj in self.steps: # Iterate over the steps we just defined
            step_id = step_obj.id
            routes.append((f"/{self.app_name}/{step_id}", getattr(self, step_id)))
            routes.append((f"/{self.app_name}/{step_id}_submit", getattr(self, f"{step_id}_submit"), ["POST"]))
        
        # Register all routes with the FastHTML app
        for path, handler, *methods in routes:
            method_list = methods[0] if methods else ["GET"]
            app.route(path, methods=method_list)(handler)
            
        # Define UI messages
        self.step_messages = {
            "finalize": {
                "ready": "All steps complete. Ready to finalize workflow.",
                "complete": f"Workflow finalized. Use {pip.UNLOCK_BUTTON_LABEL} to make changes."
            },
            "step_01": {
                "input": f"{pip.fmt(defined_steps[0].id)}: {defined_steps[0].show}. Acknowledge to proceed.",
                "complete": f"{defined_steps[0].show} acknowledged. The path is open."
            },
            "step_02": { # New messages for step_02
                "input": f"{pip.fmt(defined_steps[1].id)}: {defined_steps[1].show}. What is your tool of choice?",
                "complete": f"{defined_steps[1].show} selected. A wise decision."
            }
        }
        
        # The template usually appends the 'finalize' step to a mutable copy of steps
        # For clarity, let's manage self.steps and self.steps_indices carefully.
        # Create a temporary list for index creation that includes 'finalize'.
        all_processing_steps = list(self.steps) # Start with a copy of user-defined steps
        all_processing_steps.append(Step(id='finalize', done='finalized', show='Finalize', refill=False))
        self.steps_indices = {s.id: i for i, s in enumerate(all_processing_steps)}
```

**2. Add Skeletal Methods for `step_02` and `step_02_submit`:**
(You can copy `step_01` and `step_01_submit`, then adapt.)

```python
# In plugins/035_kungfu_workflow.py (class KungfuWorkflow)

    # --- Step Methods ---
    # (step_01 and step_01_submit are already here from the template)
    # For step_01, ensure `done` key is now 'initiation_acknowledged'
    # and its `_submit` method's next_step_id points to 'step_02'

    async def step_01_submit(self, request): # Modified from placeholder
        pip, db, steps, app_name = self.pipulate, self.db, self.steps, self.app_name
        step_id = "step_01"
        step_index = self.steps_indices[step_id]
        step = steps[step_index] # Get the Step tuple for current step
        next_step_id = steps[step_index + 1].id if step_index + 1 < len(steps) else 'finalize'
        # ^^^ This line now correctly resolves to 'step_02'

        pipeline_id = db.get("pipeline_id", "unknown")
        
        # For this simple acknowledgment step, we just record its completion.
        # The placeholder value from the form doesn't matter as much.
        form_data = await request.form()
        # Even if no specific input, we save something to mark completion
        acknowledged_value = form_data.get(step.done, "Acknowledged") 
        
        await pip.update_step_state(pipeline_id, step_id, acknowledged_value, steps)
        
        pip.append_to_history(f"[WIDGET CONTENT] {step.show}:\n{acknowledged_value}")
        pip.append_to_history(f"[WIDGET STATE] {step.show}: Step acknowledged")
        
        await self.message_queue.add(pip, self.step_messages[step_id]["complete"], verbatim=True)
        
        if pip.check_finalize_needed(step_index, steps):
             await self.message_queue.add(pip, self.step_messages["finalize"]["ready"], verbatim=True)

        return Div(
            pip.revert_control(step_id=step_id, app_name=app_name, message=f"{step.show}: {acknowledged_value}", steps=steps),
            Div(id=next_step_id, hx_get=f"/{app_name}/{next_step_id}", hx_trigger="load"), # Triggers step_02
            id=step_id
        )

    async def step_02(self, request):
        pip, db, steps, app_name = self.pipulate, self.db, self.steps, self.app_name
        step_id = "step_02"
        step_index = self.steps_indices[step_id]
        step = steps[step_index] # Get the Step tuple for current step
        # The next step after step_02 will be 'finalize' in this 2-data-step example
        next_step_id = steps[step_index + 1].id if step_index + 1 < len(steps) else 'finalize'

        pipeline_id = db.get("pipeline_id", "unknown")
        state = pip.read_state(pipeline_id)
        step_data = pip.get_step_data(pipeline_id, step_id, {})
        user_val = step_data.get(step.done, "") # 'chosen_weapon'

        finalize_data = pip.get_step_data(pipeline_id, "finalize", {})
        if "finalized" in finalize_data and user_val:
            pip.append_to_history(f"[WIDGET CONTENT] {step.show} (Finalized):\n{user_val}")
            return Div(
                Card(
                    H3(f"🔒 {step.show}: Your Choice"),
                    P(f"Weapon selected: {user_val}")
                ),
                Div(id=next_step_id, hx_get=f"/{app_name}/{next_step_id}", hx_trigger="load"),
                id=step_id
            )
        
        elif user_val and state.get("_revert_target") != step_id:
            pip.append_to_history(f"[WIDGET CONTENT] {step.show} (Completed):\n{user_val}")
            # Simple display of chosen weapon for completed state
            completed_widget = P(f"Your chosen weapon: {user_val}")
            return Div(
                pip.widget_container(step_id=step_id, app_name=app_name, message=f"{step.show}: {user_val}", widget=completed_widget, steps=steps),
                Div(id=next_step_id, hx_get=f"/{app_name}/{next_step_id}", hx_trigger="load"),
                id=step_id
            )
        else: # Input form
            pip.append_to_history(f"[WIDGET STATE] {step.show}: Awaiting weapon choice")
            await self.message_queue.add(pip, self.step_messages[step_id]["input"], verbatim=True)
            display_value = user_val if step.refill and user_val else await self.get_suggestion(step_id, state)
            
            return Div(
                Card(
                    H3(f"{pip.fmt(step_id)}: {step.show}"),
                    P("Choose your instrument of focus. Examples: 'Bo Staff', 'Nunchaku', 'Empty Hand'."),
                    Form(
                        Input(name=step.done, type="text", placeholder="e.g., Bo Staff", value=display_value, required=True, cls="contrast"),
                        Button("Select Weapon ▸", type="submit", cls="primary"),
                        hx_post=f"/{app_name}/{step_id}_submit", hx_target=f"#{step_id}"
                    )
                ),
                Div(id=next_step_id), # Placeholder for finalize, no trigger="load" here
                id=step_id
            )

    async def step_02_submit(self, request):
        pip, db, steps, app_name = self.pipulate, self.db, self.steps, self.app_name
        step_id = "step_02"
        step_index = self.steps_indices[step_id]
        step = steps[step_index] # Get the Step tuple for current step
        next_step_id = steps[step_index + 1].id if step_index + 1 < len(steps) else 'finalize'
        # ^^^ This line now correctly resolves to 'finalize'

        pipeline_id = db.get("pipeline_id", "unknown")
        form = await request.form()
        chosen_weapon = form.get(step.done, "Undecided").strip()

        is_valid, error_msg, error_component = pip.validate_step_input(chosen_weapon, step.show)
        if not is_valid:
            # Re-render the input form with the error
            # (Simplified: for a real app, you'd reconstruct the form from step_02 GET)
            return Div(
                Card(
                    H3(f"{pip.fmt(step_id)}: {step.show}"),
                    P("Choose your instrument of focus. Examples: 'Bo Staff', 'Nunchaku', 'Empty Hand'."),
                    Form(
                        Input(name=step.done, type="text", placeholder="e.g., Bo Staff", value=chosen_weapon, required=True, cls="contrast" ),
                        Button("Select Weapon ▸", type="submit", cls="primary"),
                        hx_post=f"/{app_name}/{step_id}_submit", hx_target=f"#{step_id}"
                    ),
                    error_component # Display the validation error
                ),
                Div(id=next_step_id),
                id=step_id
            )

        await pip.update_step_state(pipeline_id, step_id, chosen_weapon, steps)
        
        pip.append_to_history(f"[WIDGET CONTENT] {step.show}:\n{chosen_weapon}")
        pip.append_to_history(f"[WIDGET STATE] {step.show}: Weapon selected")
        
        await self.message_queue.add(pip, self.step_messages[step_id]["complete"], verbatim=True)
        
        if pip.check_finalize_needed(step_index, steps): # Will be true if step_02 is last data step
             await self.message_queue.add(pip, self.step_messages["finalize"]["ready"], verbatim=True)

        # Display completed view for step_02
        completed_widget = P(f"Your chosen weapon: {chosen_weapon}")
        return Div(
            pip.widget_container(step_id=step_id, app_name=app_name, message=f"{step.show}: {chosen_weapon}", widget=completed_widget, steps=steps),
            Div(id=next_step_id, hx_get=f"/{app_name}/{next_step_id}", hx_trigger="load"), # Triggers finalize
            id=step_id
        )

    async def get_suggestion(self, step_id, state): # Updated
        if step_id == 'step_01':
            return "" # No suggestion needed for a simple acknowledgement
        if step_id == 'step_02':
            return "Bo Staff" # Suggest a default weapon
        return ""
```

**Important Notes for this Modification:**

  * The `APP_NAME` in the example `__init__` should be the one you set (e.g., `"kungfu"`).
  * The `step_01_submit` method's `next_step_id` calculation will now naturally point to `step_02` because `step_02` is the next item in `self.steps`. Its `Div(id=next_step_id, ...)` will correctly load `step_02`.
  * The `step_02_submit` method's `next_step_id` will then point to `finalize` (as it's the last in `all_processing_steps`).

**3.4 Testing Your Expanded Structure**

After making these structural changes:

1.  Save your workflow file (e.g., `035_kungfu_workflow.py`). `server.py` should auto-restart.
2.  Navigate to your workflow in the Pipulate UI.
3.  Enter or select a `pipeline_id` and click "Enter 🔑" (or your equivalent).
4.  **Verify `step_01` loads:** You should see the UI for "Initiate Kung Fu".
5.  **Submit `step_01`:** Click its proceed/submit button.
6.  **Verify `step_02` loads:** The UI should now show "Choose Your Weapon" input form.
7.  **Submit `step_02`:** Enter a weapon and submit.
8.  **Verify `finalize` loads:** You should see the "All steps complete. Finalize?" UI.
9.  Test the **Revert** functionality for both `step_01` and `step_02`.
10. Test **Finalize** and **Unfinalize**.

Even if the steps don't do much complex processing yet, confirming this sequence and UI flow is a crucial validation of your workflow's structure.

**3.5 Another "Git Commit" Checkpoint**

Once you've successfully added the structural placeholders for your new steps and verified that the navigation and basic data submission flow correctly through them (including to the finalize step), you've reached another excellent point for a `git commit`. You've expanded the skeleton of your workflow.

**Next Steps:**

With the multi-step structure in place, the subsequent phase of development involves populating the `step_XX` (GET) and `step_XX_submit` (POST) methods with the actual logic, input fields, data processing, and widget displays specific to what each step needs to accomplish. This is where you'll integrate the various widget patterns (Markdown, Pandas, Matplotlib, etc.) that you've previously extracted or will develop from scratch.

