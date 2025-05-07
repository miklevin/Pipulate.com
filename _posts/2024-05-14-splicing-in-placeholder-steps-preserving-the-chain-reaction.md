---
title: "Splicing in Placeholder Steps: Preserving the Chain Reaction"
description: "Learn how to safely add new steps to your Pipulate workflows while maintaining the crucial HTMX chain reaction pattern that keeps everything flowing smoothly."
date: 2024-05-14
author: Mike Levin
group: blog
---

When building Pipulate workflows, one of the most common tasks is adding new steps between existing ones. This process, which we call "splicing," starts with a placeholder step - a minimal implementation that maintains workflow progression while you plan the full feature. Let's dive into how to do this safely and effectively.

## The Chain Reaction: Pipulate's Secret Sauce

At the heart of every Pipulate workflow is a critical pattern we call the "chain reaction." This pattern ensures that each step automatically triggers the next when completed. It looks deceptively simple:

```python
return Div(
    Card(...),  # Your step's content
    Div(id=next_step_id, hx_get=f"/{app_name}/{next_step_id}", hx_trigger="load"),
    id=step_id
)
```

This pattern is **absolutely critical** and must be preserved at all costs. Each component serves a vital purpose:
- `id=next_step_id`: Identifies where the next step's content will go
- `hx_get`: Specifies what content to load
- `hx_trigger="load"`: The magic that makes it all happen automatically

## Adding a Placeholder Step: The Safe Way

A placeholder step is like a "coming soon" sign in your workflow. It maintains the proper flow while giving you space to plan and implement the real functionality. Here's how to add one:

1. **Define Your Step**
```python
Step(
    id='step_02',            # Use sequential numbering
    done='placeholder',      # Simple state field name
    show='Coming Soon',      # User-friendly name
    refill=False,           # Usually False for placeholders
),
```

2. **Create the GET Handler**
```python
async def step_02(self, request):
    """Handles GET request for placeholder step."""
    pip, db, steps, app_name = self.pipulate, self.db, self.steps, self.app_name
    step_id = "step_02"
    step_index = self.steps_indices[step_id]
    step = steps[step_index]
    next_step_id = steps[step_index + 1].id if step_index < len(steps) - 1 else 'finalize'
    pipeline_id = db.get("pipeline_id", "unknown")
    state = pip.read_state(pipeline_id)
    step_data = pip.get_step_data(pipeline_id, step_id, {})
    placeholder_value = step_data.get(step.done, "")

    # Check if workflow is finalized
    finalize_data = pip.get_step_data(pipeline_id, "finalize", {})
    if "finalized" in finalize_data and placeholder_value:
        return Div(
            Card(
                H3(f"🔒 {step.show}: Completed")
            ),
            Div(id=next_step_id, hx_get=f"/{app_name}/{next_step_id}", hx_trigger="load"),
            id=step_id
        )
        
    # Check if step is complete and not being reverted to
    if placeholder_value and state.get("_revert_target") != step_id:
        return Div(
            pip.revert_control(step_id=step_id, app_name=app_name, message=f"{step.show}: Complete", steps=steps),
            Div(id=next_step_id, hx_get=f"/{app_name}/{next_step_id}", hx_trigger="load"),
            id=step_id
        )
    else:
        await self.message_queue.add(pip, "This is a placeholder step.", verbatim=True)
        
        return Div(
            Card(
                H3(f"{step.show}"),
                P("This step will be implemented soon. Click Proceed to continue."),
                Form(
                    Button("Proceed ▸", type="submit", cls="primary"),
                    hx_post=f"/{app_name}/{step_id}_submit", 
                    hx_target=f"#{step_id}"
                )
            ),
            Div(id=next_step_id),  # No trigger here - it comes after submit
            id=step_id
        )
```

3. **Create the Submit Handler**
```python
async def step_02_submit(self, request):
    """Process the submission for placeholder step."""
    pip, db, steps, app_name = self.pipulate, self.db, self.steps, self.app_name
    step_id = "step_02"
    step_index = self.steps_indices[step_id]
    step = steps[step_index]
    next_step_id = steps[step_index + 1].id if step_index < len(steps) - 1 else 'finalize'
    pipeline_id = db.get("pipeline_id", "unknown")
    
    # Just mark as completed - real functionality comes later
    placeholder_value = "completed"
    await pip.update_step_state(pipeline_id, step_id, placeholder_value, steps)
    await self.message_queue.add(pip, f"{step.show} complete.", verbatim=True)
    
    # Return with chain reaction to next step
    return Div(
        pip.revert_control(step_id=step_id, app_name=app_name, message=f"{step.show}: Complete", steps=steps),
        Div(id=next_step_id, hx_get=f"/{app_name}/{next_step_id}", hx_trigger="load"),
        id=step_id
    )
```

## Common Pitfalls to Avoid

1. **NEVER Remove `hx_trigger="load"`**
   ```python
   # ❌ WRONG - Will break the chain reaction
   Div(id=next_step_id, hx_get=f"/{app_name}/{next_step_id}")
   
   # ✅ RIGHT - Maintains the chain reaction
   Div(id=next_step_id, hx_get=f"/{app_name}/{next_step_id}", hx_trigger="load")
   ```

2. **NEVER Rely on Event Bubbling**
   ```python
   # ❌ WRONG - Implicit triggering is unreliable
   Div(id=next_step_id, _="on load trigger next")
   
   # ✅ RIGHT - Explicit HTMX triggering
   Div(id=next_step_id, hx_get=f"/{app_name}/{next_step_id}", hx_trigger="load")
   ```

3. **NEVER Skip the Chain in Completed States**
   ```python
   # ❌ WRONG - Missing chain reaction in completed state
   return Div(
       Card(H3("Step Complete")),
       id=step_id
   )
   
   # ✅ RIGHT - Maintains chain reaction
   return Div(
       Card(H3("Step Complete")),
       Div(id=next_step_id, hx_get=f"/{app_name}/{next_step_id}", hx_trigger="load"),
       id=step_id
   )
   ```

## Why Placeholders Matter

Placeholder steps serve several important purposes:
1. They let you plan your workflow structure before implementing complex functionality
2. They provide a safe way to test workflow progression
3. They maintain a consistent user experience while you develop
4. They make it easier to iterate on your workflow design

## Best Practices for Splicing

1. **Always Update Step Indices**
   ```python
   steps.append(Step(...))  # Add your new step
   self.steps_indices = {step.id: i for i, step in enumerate(steps)}  # Update indices
   ```

2. **Maintain Clear Step Numbering**
   ```python
   # Good step numbering
   step_01 -> step_02 -> step_03
   
   # Avoid confusing numbering
   step_1 -> step_2a -> step_2b
   ```

3. **Keep the Chain Reaction Visible**
   ```python
   # Make the chain reaction obvious with comments
   return Div(
       Card(...),
       # CRITICAL: Chain reaction to next step
       Div(id=next_step_id, hx_get=f"/{app_name}/{next_step_id}", hx_trigger="load"),
       id=step_id
   )
   ```

## Testing Your Splice

After adding a placeholder step:
1. Test the forward progression through all steps
2. Test reverting to previous steps
3. Verify the chain reaction continues properly
4. Check that finalization still works correctly

## Conclusion

The placeholder pattern is your first step in extending a workflow. It's like sketching before painting - it lets you ensure your workflow's structure is solid before adding complex functionality. In our next article, we'll explore how to evolve a placeholder into a fully functional step, using a real-world URL opener workflow as our example.

Remember: The chain reaction is not just a pattern - it's a promise to your users that your workflow will progress reliably and predictably. Guard it well! 