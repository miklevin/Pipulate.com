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

**3.2 Using `splice_workflow_step.py`**

Just as `create_workflow.py` automated the initial bootstrapping process, we now use `splice_workflow_step.py` to automate the addition of new steps to your workflow. This script is already part of your Pipulate installation, ready to help you expand your workflows.

**Command-Line Arguments:**

  * `target_filename`: (Required) The filename of the workflow to modify in the `plugins/` directory (e.g., `035_kungfu_workflow.py`).

**Example Usage: Adding a "Choose Your Weapon" Step to "Kung Fu Download"**

Let's add a second step to our "Kung Fu Download" workflow. From your `pipulate/helpers` folder, you would run:

```bash
python splice_workflow_step.py 035_kungfu_workflow.py
```

The script will:
1. Analyze your workflow file to determine the next step number
2. Add a new `Step` tuple to the `steps` list in `__init__`
3. Generate the corresponding `step_XX` and `step_XX_submit` methods
4. Update the UI messages in `step_messages`
5. Ensure proper HTMX chain reaction between steps

**3.3 Understanding the Generated Changes**

When you run `splice_workflow_step.py`, it makes several coordinated changes to your workflow file:

1. **Step Definition:**
```python
            Step(
                id='step_02',
                done='placeholder_02',  # Unique key for step data
                show='Step 02 Placeholder',  # UI name
                refill=False,  # Whether step can be edited after completion
            )
```

2. **Step Handler Methods:**
   * Generates `async def step_02(self, request):` for GET requests
   * Generates `async def step_02_submit(self, request):` for POST requests
   * Both methods include proper HTMX chain reaction handling
   * The GET handler includes proper state management:
     ```python
     async def step_02(self, request):
         pipeline_id = self.db["pipeline_id"]
         state = await self.pipulate.read_state(pipeline_id)
         step_data = await self.pipulate.get_step_data(pipeline_id, "step_02", {})
         next_step_id = "finalize"  # Or next step if more exist
         
         # View logic based on state
         if await self.pipulate.is_finalized(pipeline_id):
             # Show locked view
             return Div(
                 # Locked content
                 Div(id=next_step_id, hx_get=f"/{self.app_name}/{next_step_id}", hx_trigger="load")
             )
         elif step_data.get(self.steps[1].done) and state.get("_revert_target") != "step_02":
             # Show completed view
             return Div(
                 self.pipulate.revert_control("step_02"),
                 Div(id=next_step_id, hx_get=f"/{self.app_name}/{next_step_id}", hx_trigger="load")
             )
         else:
             # Show input form
             return Div(
                 Form(
                     # Input fields
                     method="POST",
                     action=f"/{self.app_name}/step_02_submit",
                     hx_post=f"/{self.app_name}/step_02_submit",
                     hx_target="#step_02"
                 ),
                 Div(id=next_step_id)  # Empty placeholder
             )
     ```
   * The POST handler ensures proper state updates and chain reaction:
     ```python
     async def step_02_submit(self, request):
         pipeline_id = self.db["pipeline_id"]
         form = await request.form()
         user_val = form.get(self.steps[1].done, "")
         
         # Validate and update state
         await self.pipulate.update_step_state(pipeline_id, "step_02", user_val, self.steps)
         
         # Update LLM context
         self.pipulate.append_to_history(f"[WIDGET CONTENT] {self.steps[1].show}:\n{user_val}")
         
         # Return completed view with next step trigger
         return Div(
             self.pipulate.revert_control("step_02"),
             Div(id="finalize", hx_get=f"/{self.app_name}/finalize", hx_trigger="load")
         )
     ```

3. **UI Messages:**
   ```python
   "step_02": {
       "input": "Step 02: Step 02 Placeholder. Customize this message.",
       "complete": "Step 02 Placeholder complete."
   }
   ```

**3.4 Customizing Your New Step**

After running `splice_workflow_step.py`, you'll need to customize the generated code:

1. **Update the Step Definition:**
   * Change `done` to a meaningful key (e.g., `'chosen_weapon'`)
   * Change `show` to a user-friendly name (e.g., `'Choose Your Weapon'`)
   * Set `refill` based on whether users should be able to modify their choice
   * Consider adding a `transform` function if the step should process data from previous steps

2. **Customize the Step Methods:**
   * Modify the input form in `step_02` to collect the specific data you need
   * Update the display logic in both methods to show the data appropriately
   * Add any validation or processing logic in `step_02_submit`
   * Ensure proper state management using `pipulate` helper methods
   * Maintain the chain reaction pattern for reliable step progression

3. **Update UI Messages:**
   * Make the messages more specific to your step's purpose
   * Consider adding helpful instructions or examples
   * Use consistent formatting with `pip.fmt()` for step references

**3.5 Testing Your Expanded Structure**

After making these customizations:

1. Save your workflow file. `server.py` should auto-restart.
2. Navigate to your workflow in the Pipulate UI.
3. Enter or select a `pipeline_id` and click "Enter 🔑".
4. **Verify `step_01` loads:** You should see the UI for your first step.
5. **Submit `step_01`:** Click its proceed/submit button.
6. **Verify `step_02` loads:** The UI should now show your new step's input form.
7. **Submit `step_02`:** Enter data and submit.
8. **Verify `finalize` loads:** You should see the "All steps complete. Finalize?" UI.
9. Test the **Revert** functionality for both steps.
10. Test **Finalize** and **Unfinalize**.

**3.6 Another "Git Commit" Checkpoint**

Once you've successfully added and customized your new step and verified that the navigation and data submission flow correctly through all steps (including to the finalize step), you've reached another excellent point for a `git commit`. You've expanded the functionality of your workflow.

**3.7 Best Practices for Multi-Step Workflows**

1. **State Management:**
   * Use descriptive keys in `step.done` that reflect the data being stored
   * Keep state updates atomic and predictable
   * Use `pipulate` helper methods for all state operations
   * Consider data dependencies between steps

2. **UI/UX:**
   * Maintain consistent styling across steps
   * Provide clear feedback for user actions
   * Use appropriate input validation
   * Consider accessibility in form design

3. **Error Handling:**
   * Validate inputs before state updates
   * Handle edge cases gracefully
   * Provide meaningful error messages
   * Log issues for debugging

4. **Code Organization:**
   * Keep step logic focused and single-purpose
   * Document complex transformations
   * Use consistent naming conventions
   * Consider extracting common patterns

**Next Steps:**

With the multi-step structure in place, the subsequent phase of development involves populating the `step_XX` (GET) and `step_XX_submit` (POST) methods with the actual logic, input fields, data processing, and widget displays specific to what each step needs to accomplish. This is where you'll integrate the various widget patterns (Markdown, Pandas, Matplotlib, etc.) that you've previously extracted or will develop from scratch.

Remember to follow the chain reaction pattern consistently, ensuring each step explicitly triggers the next one only after successful completion. This creates a reliable and predictable flow of execution through your workflow.

