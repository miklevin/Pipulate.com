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

2. **Customize the Step Methods:**
   * Modify the input form in `step_02` to collect the specific data you need
   * Update the display logic in both methods to show the data appropriately
   * Add any validation or processing logic in `step_02_submit`

3. **Update UI Messages:**
   * Make the messages more specific to your step's purpose
   * Consider adding helpful instructions or examples

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

**Next Steps:**

With the multi-step structure in place, the subsequent phase of development involves populating the `step_XX` (GET) and `step_XX_submit` (POST) methods with the actual logic, input fields, data processing, and widget displays specific to what each step needs to accomplish. This is where you'll integrate the various widget patterns (Markdown, Pandas, Matplotlib, etc.) that you've previously extracted or will develop from scratch.

