---
layout: post
title: "The Chain Reaction Pattern: Pipulate's Secret Sauce"
description: "Deep dive into how Pipulate uses HTMX chain reactions to create robust, maintainable workflows"
group: guide
---

When building workflow systems, one of the trickiest challenges is managing state and progression between steps. Many systems use complex state machines, event buses, or reactive frameworks. Pipulate takes a different approach: the Chain Reaction Pattern.

## The Unix Philosophy in Web Apps

Remember Unix pipes? They're beautiful in their simplicity:

```bash
cat data.txt | grep "pattern" | sort | uniq -c
```

Each command does one thing well, and data flows naturally through the pipeline. Pipulate's Chain Reaction Pattern brings this same elegance to web workflows.

## The Three Phases of a Step

Every step in a Pipulate workflow has three distinct phases, each with its own role in the chain reaction:

```python
async def step_XX(self, request):
    # ... setup code ...
    
    if "finalized" in finalize_data and step_value:
        # PHASE 1: Finalize
        # Shows locked view of completed step
        return Div(
            Card(H3(f"🔒 {step.show}: {step_value}")),
            Div(id=next_step_id, hx_get=f"/{app_name}/{next_step_id}", hx_trigger="load"),
            id=step_id
        )
    elif step_value and state.get("_revert_target") != step_id:
        # PHASE 2: Revert
        # Shows completed step with revert option
        return Div(
            Card(H3(f"{step.show}: {step_value}")),
            Div(id=next_step_id, hx_get=f"/{app_name}/{next_step_id}", hx_trigger="load"),
            id=step_id
        )
    else:
        # PHASE 3: Get Input
        # Shows input form for new data
        return Div(
            Card(
                H3(f"{step.show}"),
                Form(...)  # Input form here
            ),
            Div(id=next_step_id),  # No hx_trigger here - wait for form submission
            id=step_id
        )
```

The chain reaction flows differently in each phase:

1. **Finalize Phase**: Shows locked view, chains to next step
2. **Revert Phase**: Shows completed view with revert option, chains to next step
3. **Get Input Phase**: Shows input form, waits for submission

## The Submit Handler: Revert Phase Revisited

The submit handler (`step_XX_submit`) is essentially a specialized version of the Revert Phase:

```python
async def step_XX_submit(self, request):
    # ... process form data ...
    
    # Store the new value
    await pip.update_step_state(pipeline_id, step_id, new_value, steps)
    
    # Return the Revert Phase view
    return Div(
        Card(H3(f"{step.show}: {new_value}")),
        Div(id=next_step_id, hx_get=f"/{app_name}/{next_step_id}", hx_trigger="load"),
        id=step_id
    )
```

This is why the submit handler looks similar to the Revert Phase - it's showing the same completed state view, just with newly submitted data.

## The Golden Pattern

At its core, the pattern is deceptively simple:

```python
return Div(
    Card(...),  # Current step content
    Div(
        id=next_step_id,
        hx_get=f"/{app_name}/{next_step_id}",
        hx_trigger="load"  # The magic happens here
    ),
    id=step_id
)
```

That `hx_trigger="load"` is Pipulate's pipe operator. Just as removing a `|` breaks a Unix pipeline, removing `hx_trigger="load"` breaks the chain reaction.

## Never Break the Chain: Checklist

- [x] Every step's output must include a Div for the next step with `hx_trigger="load"` (except when waiting for user input)
- [x] The input form phase must include a placeholder Div for the next step (without `hx_trigger`)
- [x] All error paths must preserve the chain (include the next step Div)
- [x] The chain reaction must be explicit in every step's GET and POST handler ([04_chain_reaction_pattern.mdc](https://github.com/miklevin/pipulate/blob/main/.cursor/rules/04_chain_reaction_pattern.mdc))
- [x] Test normal, error, and edge-case flows ([13_testing_and_debugging.mdc](https://github.com/miklevin/pipulate/blob/main/.cursor/rules/13_testing_and_debugging.mdc))

## Why It Works

The pattern succeeds because it:

1. **Maintains Atomicity**: Each step is self-contained, like a Unix command
2. **Preserves State**: State flows naturally between steps
3. **Enables Reversibility**: Steps can be reverted without breaking the chain
4. **Simplifies Testing**: Each step can be tested in isolation
5. **Follows HTMX Principles**: Uses HTMX's natural request/response cycle

## The WET Principle: Why Not DRY?

Pipulate intentionally follows the WET (Write Everything Twice) principle rather than DRY (Don't Repeat Yourself). Why? Because workflows often need subtle variations that DRY abstractions would make harder to implement. This explicitness makes each step observable, testable, and easy to debug ([03_workflow_core.mdc](https://github.com/miklevin/pipulate/blob/main/.cursor/rules/03_workflow_core.mdc)).

This is similar to how Unix commands have overlapping functionality (`cat` vs `less`, `find` vs `locate`). The overlap gives users flexibility without sacrificing reliability.

## Common Pitfalls

### Breaking the Chain

❌ The most common mistake is breaking the chain reaction:

```python
# WRONG: Missing hx_trigger="load"
return Div(
    Card(...),
    Div(id=next_step_id, hx_get=f"/{app_name}/{next_step_id}"),
    id=step_id
)
```

✅ Always maintain the chain:

```python
# RIGHT: Chain reaction preserved
return Div(
    Card(...),
    Div(id=next_step_id, hx_get=f"/{app_name}/{next_step_id}", hx_trigger="load"),
    id=step_id
)
```

### Error Handling

❌ Another common mistake is forgetting the chain in error paths:

```python
# WRONG: Chain broken on error
if error:
    return P("Error message", style=pip.get_style("error"))
```

✅ Maintain the chain even in error paths:

```python
# RIGHT: Chain preserved in error handling
if error:
    return Div(
        P("Error message", style=pip.get_style("error")),
        Div(id=next_step_id, hx_get=next_url, hx_trigger="load"),
        id=step_id
    )
```

## Special Cases

### Long-Running Operations

For operations that take time, use background processing while maintaining the chain:

```python
# Submit handler starts the process
return Card(
    Progress(...),
    Script("""
    setTimeout(function() {
        htmx.ajax('POST', '""" + f"/{app_name}/process" + """', {
            target: '#""" + step_id + """'
        });
    }, 500);
    """),
    id=step_id
)

# Process handler maintains the chain
return Div(
    Card(
        H3("Processing Complete"),
        results
    ),
    Div(id=next_step_id, hx_get=next_url, hx_trigger="load"),
    id=step_id
)
```

### File Downloads

File downloads require special handling to maintain the chain:

```python
return Div(
    A(
        "Download File",
        href=download_url,
        download=True,
        _onclick="setTimeout(() => htmx.trigger('#continue-btn', 'click'), 1000);"
    ),
    Button(
        "Continue",
        id="continue-btn",
        style="display: none;",
        hx_get=f"/{app_name}/{next_step_id}",
        hx_target=f"#{step_id}"
    ),
    id=step_id
)
```

## The Chain Reaction Pattern in the Plugin System

Pipulate's plugin system ([11_plugin_development_guidelines.mdc](https://github.com/miklevin/pipulate/blob/main/.cursor/rules/11_plugin_development_guidelines.mdc)) and state management rules ([05_state_management.mdc](https://github.com/miklevin/pipulate/blob/main/.cursor/rules/05_state_management.mdc)) are designed to support the chain reaction pattern:
- Each plugin defines explicit step handlers
- State is managed in SQLite and keyed by workflow keys ([06_key_system.mdc](https://github.com/miklevin/pipulate/blob/main/.cursor/rules/06_key_system.mdc))
- The UI and state are always in sync, making workflows robust and observable

## Testing Your Chain Reaction

To ensure your workflow is robust, always test:

1. Normal progression through steps
2. Error handling in each step
3. Background processing completion
4. File download handling
5. State preservation between steps
6. Revert functionality
7. Edge cases specific to your workflow

See [13_testing_and_debugging.mdc](https://github.com/miklevin/pipulate/blob/main/.cursor/rules/13_testing_and_debugging.mdc) for more on best practices for testing Pipulate workflows.

## Real-World Example

Here's a complete step implementation showing all the patterns:

```python
async def step_XX(self, request):
    """GET handler for step XX display"""
    pip, db, steps, app_name = self.pipulate, self.db, self.steps, self.app_name
    step_id = "step_XX"
    step_index = self.steps_indices[step_id]
    step = steps[step_index]
    next_step_id = steps[step_index + 1].id if step_index < len(steps) - 1 else 'finalize'
    pipeline_id = db.get("pipeline_id", "unknown")
    state = pip.read_state(pipeline_id)
    step_value = state.get(step.done, "")
    
    # Finalize Phase
    if "finalized" in state.get("finalize", {}) and step_value:
        return Div(
            Card(H3(f"🔒 {step.show}: {step_value}")),
            Div(id=next_step_id, hx_get=f"/{app_name}/{next_step_id}", hx_trigger="load"),
            id=step_id
        )
    
    # Revert Phase
    elif step_value and state.get("_revert_target") != step_id:
        return Div(
            pip.display_revert_header(step_id=step_id, app_name=app_name, message=f'{step.show}: {step_value}', steps=steps),
            Div(id=next_step_id, hx_get=f"/{app_name}/{next_step_id}", hx_trigger="load"),
            id=step_id
        )
    
    # Get Input Phase
    else:
        return Div(
            Card(
                H3(f"{step.show}"),
                Form(
                    Input(name=step.done, value=step_value),
                    Button("Submit", type="submit"),
                    hx_post=f"/{app_name}/{step_id}_submit",
                    hx_target=f"#{step_id}"
                )
            ),
            Div(id=next_step_id),  # No hx_trigger - wait for form submission
            id=step_id
        )

async def step_XX_submit(self, request):
    """POST handler for step XX submission"""
    pip, db, steps, app_name = self.pipulate, self.db, self.steps, self.app_name
    step_id = "step_XX"
    step_index = self.steps_indices[step_id]
    step = steps[step_index]
    next_step_id = steps[step_index + 1].id if step_index < len(steps) - 1 else 'finalize'
    pipeline_id = db.get("pipeline_id", "unknown")
    
    # Process form data
    form = await request.form()
    new_value = form.get(step.done, "").strip()
    
    # Store the new value
    await pip.update_step_state(pipeline_id, step_id, new_value, steps)
    
    # Return the Revert Phase view using chain_reverter
    return pip.chain_reverter(step_id, step_index, steps, app_name, new_value)
```

## Conclusion

The Chain Reaction Pattern is a powerful example of how simple patterns can create robust systems. By following Unix philosophy and embracing HTMX's natural patterns, Pipulate creates workflows that are both powerful and maintainable.

Remember:
1. Never break the chain
2. Keep steps atomic
3. Maintain state properly
4. Handle errors gracefully
5. Test thoroughly

Just as Unix pipes changed how we think about command-line tools, the Chain Reaction Pattern changes how we think about web workflows. 