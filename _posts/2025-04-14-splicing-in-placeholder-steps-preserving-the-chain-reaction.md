---
title: "Splicing in Placeholder Steps: Preserving the Chain Reaction"
description: "Learn how to safely add new steps to your Pipulate workflows while maintaining the crucial HTMX chain reaction pattern that keeps everything flowing smoothly."
author: Mike Levin
group: blog
---

When building Pipulate workflows, one of the most common tasks is adding new steps between existing ones. This process, which we call "splicing," starts with a placeholder step - a minimal implementation that maintains workflow progression while you plan the full feature. If you're familiar with Jupyter notebooks, think of it like inserting a new cell between existing ones. Or, for Unix veterans, imagine adding a new command to a pipeline with `|` - each step takes input, processes it, and passes it along.

## The Chain Reaction: Pipulate's Secret Sauce

At the heart of every Pipulate workflow is a critical pattern we call the "chain reaction." Like Jupyter's "Run All Cells" feature or Unix's pipe operator (`|`), this pattern ensures that each step automatically triggers the next when completed. Just as Unix commands chain together (`cat file.txt | grep "pattern" | sort`), our steps form a seamless progression. It looks deceptively simple:

```python
return Div(
    Card(...),  # Your step's content
    Div(id=next_step_id, hx_get=f"/{app_name}/{next_step_id}", hx_trigger="load"),
    id=step_id
)
```

This pattern is **absolutely critical** and must be preserved at all costs. Each component serves a vital purpose:
- `id=next_step_id`: Like a Jupyter cell's position or a Unix pipe's next command, identifies where output should flow
- `hx_get`: Similar to Jupyter's cell execution or Unix's command invocation, specifies what to run next
- `hx_trigger="load"`: The magic that makes it all happen automatically, like Unix's pipe operator connecting commands

## Adding a Placeholder Step: The Safe Way

A placeholder step is like adding an empty Jupyter cell or a simple `cat` in a Unix pipeline - it maintains the flow while you plan more complex operations. Think of it as `command1 | cat | command3` - the `cat` does nothing but preserve the pipeline. Here's how to add one:

1. **Define Your Step**
```python
Step(
    id='step_02',            # Like Jupyter's cell numbering
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

Just as Jupyter notebooks can break when cell dependencies are mishandled, or Unix pipes fail when connections are broken, Pipulate workflows can break if the chain reaction pattern isn't maintained:

1. **NEVER Remove `hx_trigger="load"`**
   ```python
   # ❌ WRONG - Will break the chain reaction (like forgetting the | in Unix)
   Div(id=next_step_id, hx_get=f"/{app_name}/{next_step_id}")
   
   # ✅ RIGHT - Maintains the chain reaction (like proper piping)
   Div(id=next_step_id, hx_get=f"/{app_name}/{next_step_id}", hx_trigger="load")
   ```

2. **NEVER Rely on Event Bubbling**
   ```python
   # ❌ WRONG - Implicit triggering is unreliable (like assuming command order)
   Div(id=next_step_id, _="on load trigger next")
   
   # ✅ RIGHT - Explicit HTMX triggering (like explicit pipe connections)
   Div(id=next_step_id, hx_get=f"/{app_name}/{next_step_id}", hx_trigger="load")
   ```

3. **NEVER Skip the Chain in Completed States**
   ```python
   # ❌ WRONG - Missing chain reaction (like a broken pipe)
   return Div(
       Card(H3("Step Complete")),
       id=step_id
   )
   
   # ✅ RIGHT - Maintains chain reaction (like a complete pipeline)
   return Div(
       Card(H3("Step Complete")),
       Div(id=next_step_id, hx_get=f"/{app_name}/{next_step_id}", hx_trigger="load"),
       id=step_id
   )
   ```

## Why Placeholders Matter

Like Jupyter notebook cells or Unix's `tee` command (which preserves pipeline flow while letting you inspect data), placeholder steps serve several important purposes:
1. They let you plan your workflow structure before implementing complex functionality
2. They provide a safe way to test workflow progression (like `tee` letting you debug pipelines)
3. They maintain a consistent user experience while you develop
4. They make it easier to iterate on your workflow design

## The Power of Flow-Based Programming

Pipulate's chain reaction pattern is part of a rich tradition in computing:

1. **Unix Pipes**: The original flow-based programming
   ```bash
   # Unix pipeline: each command processes and passes data
   cat data.txt | grep "pattern" | sort | uniq > result.txt
   
   # Pipulate: each step processes and triggers the next
   step_01 -> step_02 -> step_03 -> finalize
   ```

2. **Data Transformation**: Like Unix filters
   ```python
   # Unix way: transform text through pipeline
   cat file.txt | tr '[:lower:]' '[:upper:]' | sort
   
   # Pipulate way: transform data through steps
   url_input -> url_validation -> url_opening
   ```

3. **State Management**: Like pipeline intermediate results
   ```python
   # Unix way: store intermediate results
   command1 | tee temp.txt | command2
   
   # Pipulate way: store step state
   await pip.update_step_state(pipeline_id, step_id, value, steps)
   ```

## Best Practices for Splicing

1. **Always Update Step Indices**
   ```python
   steps.append(Step(...))  # Like renumbering Jupyter cells or reordering pipeline stages
   self.steps_indices = {step.id: i for i, step in enumerate(steps)}  # Update indices
   ```

2. **Maintain Clear Step Numbering**
   ```python
   # Good step numbering (like well-organized pipelines)
   step_01 -> step_02 -> step_03
   
   # Avoid confusing numbering (like messy pipeline branches)
   step_1 -> step_2a -> step_2b
   ```

3. **Keep the Chain Reaction Visible**
   ```python
   # Make the chain reaction obvious with comments (like documenting pipeline flow)
   return Div(
       Card(...),
       # CRITICAL: Chain reaction to next step
       Div(id=next_step_id, hx_get=f"/{app_name}/{next_step_id}", hx_trigger="load"),
       id=step_id
   )
   ```

## Testing Your Splice

After adding a placeholder step, test it like you would a new notebook cell or pipeline stage:
1. Test the forward progression through all steps (like "Run All" or pipeline flow)
2. Test reverting to previous steps (like rerunning cells or pipeline segments)
3. Verify the chain reaction continues properly (like checking pipe connections)
4. Check that finalization still works correctly (like ensuring final output)

## Conclusion

The placeholder pattern is your first step in extending a workflow. Like Jupyter notebooks revolutionized interactive computing with chainable cells, and Unix pipes revolutionized command-line computing with chainable commands, Pipulate's chain reaction pattern makes workflows flexible and maintainable. It's part of a grand tradition of flow-based programming that stretches back to the earliest days of Unix.

Remember: The chain reaction is not just a pattern - it's a promise to your users that your workflow will progress reliably and predictably, just like the Unix pipes we've relied on for decades. Guard it well! 
