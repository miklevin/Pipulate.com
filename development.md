---
title: Development Guide
description: Development patterns and workflows for Pipulate
permalink: /development/
group: development
---

# Development Guide

This guide provides essential patterns and workflows for developing with Pipulate. These patterns are designed to help you navigate the codebase and maintain consistency in your development work.

## Core Development Patterns

### 1. Workflow Development Pattern

When creating new workflows in Pipulate, follow this pattern:

```python
class MyWorkflow:
    APP_NAME = "unique_name"        # Unique identifier
    DISPLAY_NAME = "User-Facing Name"  # UI display name
    
    def __init__(self, pipulate, db, pipeline, rt):
        self.pipulate, self.db = pipulate, db
        self.pipeline = pipeline
        
        # Define steps
        Step = namedtuple('Step', ['id', 'done', 'show', 'refill', 'transform'])
        self.steps = [
            Step(id='step_01', done='first_field', show='First Step', refill=True),
            Step(id='step_02', done='second_field', show='Second Step', refill=True),
            # More steps...
        ]
        
        # Register routes
        self.register_routes(rt)
```

Key points:
- Each workflow is a Python class
- Steps are defined as named tuples
- Routes are registered in the constructor
- State is managed through the pipeline object

### 2. Chain Reaction Pattern

The chain reaction pattern is crucial for workflow progression:

```python
return Div(
    Card(...),  # Current step content
    # This inner Div triggers loading of the next step
    Div(id=next_step_id, hx_get=f"/{app_name}/{next_step_id}", hx_trigger="load"),
    id=step_id
)
```

Important:
- Never remove `hx_trigger="load"`
- Each step must include the next step's container
- The chain reaction enables automatic progression

### 3. State Management Pattern

Pipulate uses two complementary approaches to state management:

```python
# Workflow state (JSON-based)
pipeline_id = db.get("pipeline_id", "unknown")
state = pip.read_state(pipeline_id)
state[step.done] = value
pip.write_state(pipeline_id, state)

# CRUD operations (table-based)
profiles.insert(name="New Profile")
profiles.update(1, name="Updated Profile")
profiles.delete(1)
all_profiles = profiles()
```

### 4. Plugin Development Pattern

Creating new plugins follows a specific workflow:

1. **Copy a Template**: Start with a template (e.g., `starter_flow.py`) → `my_flow (Copy).py`
2. **Modify**: Develop your workflow (won't auto-register with parentheses in name)
3. **Test**: Rename to `xx_my_flow.py` for testing (server auto-reloads but won't register)
4. **Deploy**: Rename to `XX_my_flow.py` (e.g., `30_my_flow.py`) to assign menu order and activate

### 5. Data Visualization Pattern

For embedding visualizations in workflows:

```python
import pandas as pd
import matplotlib.pyplot as plt
from io import BytesIO
import base64

# Generate plot
fig, ax = plt.subplots(figsize=(10, 6))
df.plot(ax=ax)
plt.tight_layout()

# Convert to base64 for embedding
buffer = BytesIO()
plt.savefig(buffer, format='png')
buffer.seek(0)
image_base64 = base64.b64encode(buffer.read()).decode('utf-8')

# Return in HTML
return Div(
    Card(
        H4("Data Visualization"),
        Img(src=f"data:image/png;base64,{image_base64}",
            style="width:100%;max-width:800px"),
    ),
    Div(id=next_step_id, hx_get=f"/{app_name}/{next_step_id}", hx_trigger="load"),
    id=step_id
)
```

## Development Environment

The Pipulate development experience includes:

- **Automatic Reloading**: File system watchdog detects changes and restarts the server
- **Integrated Jupyter**: JupyterLab runs alongside the application for experimentation
- **Shared Environment**: Both Jupyter and the server share the same `.venv` for package access
- **Enhanced Debugging**: Server-side state and simple architecture make debugging straightforward

## Best Practices

1. **Keep it simple.** Avoid complex patterns when simple ones will work.
2. **Stay local and single-user.** Embrace the benefits of local-first design.
3. **Be explicit over implicit.** WET code that's clear is better than DRY code that's obscure.
4. **Preserve the chain reaction.** Maintain the core progression mechanism in workflows.
5. **Embrace observability.** Make state changes visible and debuggable.

## Contributing

When contributing to Pipulate, please adhere to these principles:

* Maintain Local-First Simplicity (No multi-tenant patterns, complex ORMs, heavy client-side state)
* Respect Server-Side State (Use DictLikeDB/JSON for workflows, MiniDataAPI for CRUD)
* Preserve the Workflow Pipeline Pattern (Keep steps linear, state explicit)
* Honor Integrated Features (Don't disrupt core LLM/Jupyter integration) 