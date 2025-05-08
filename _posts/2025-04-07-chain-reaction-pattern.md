---
layout: post
title: "The Chain Reaction Pattern: Pipulate's Secret Sauce"
description: "Deep dive into how Pipulate uses HTMX chain reactions to create robust, maintainable workflows"
group: blog
---

When building workflow systems, one of the trickiest challenges is managing state and progression between steps. Many systems use complex state machines, event buses, or reactive frameworks. Pipulate takes a different approach: the Chain Reaction Pattern.

## The Unix Philosophy in Web Apps

Remember Unix pipes? They're beautiful in their simplicity:

```bash
cat data.txt | grep "pattern" | sort | uniq -c
```

Each command does one thing well, and data flows naturally through the pipeline. Pipulate's Chain Reaction Pattern brings this same elegance to web workflows.

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

## Why It Works

The pattern succeeds because it:

1. **Maintains Atomicity**: Each step is self-contained, like a Unix command
2. **Preserves State**: State flows naturally between steps
3. **Enables Reversibility**: Steps can be reverted without breaking the chain
4. **Simplifies Testing**: Each step can be tested in isolation
5. **Follows HTMX Principles**: Uses HTMX's natural request/response cycle

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

## The WET Philosophy

Pipulate intentionally follows the WET (Write Everything Twice) principle rather than DRY (Don't Repeat Yourself). Why? Because workflows often need subtle variations that DRY abstractions would make harder to implement.

This is similar to how Unix commands have overlapping functionality (`cat` vs `less`, `find` vs `locate`). The overlap gives users flexibility without sacrificing reliability.

## Testing Chain Reactions

Always test these scenarios:

1. Normal progression through steps
2. Error handling in each step
3. Background processing completion
4. File download handling
5. State preservation between steps
6. Revert functionality
7. Edge cases specific to your workflow

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
    
    try:
        # Process step
        result = await process_data()
        
        # Store state
        await pip.update_step_state(pipeline_id, step_id, result, steps)
        
        # Return with chain reaction
        return Div(
            Card(
                H3("Processing Complete"),
                result_display
            ),
            Div(id=next_step_id, hx_get=f"/{app_name}/{next_step_id}", hx_trigger="load"),
            id=step_id
        )
    except Exception as e:
        # Error handling with chain reaction
        return Div(
            P(f"Error: {str(e)}", style=pip.get_style("error")),
            Div(id=next_step_id, hx_get=f"/{app_name}/{next_step_id}", hx_trigger="load"),
            id=step_id
        )
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