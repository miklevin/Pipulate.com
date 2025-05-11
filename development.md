---
title: Development Guide
description: Development patterns and workflows for Pipulate
permalink: /development/
group: development
---

# Development Guide

This guide provides essential patterns and workflows for developing with Pipulate. These patterns are designed to help you navigate the codebase and maintain consistency in your development work.

## Getting Started

### 1. Installation
- Nix Flakes setup
- Python environment
- Dependencies
- GPU support

### 2. Project Structure
- Plugin organization
- Workflow structure
- State management
- Testing setup

### 3. Development Environment
- IDE setup
- Debugging tools
- Testing tools
- Documentation

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
- This gives that Notebook *Run All Cells* feel

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

1. **Copy a Template**: Start with a template (e.g., `20_hello_workflow.py`) → `20_hello_workflow (Copy).py`
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

## Workflow Development

### 1. Basic Workflow
- Step definition
- State management
- Route registration
- Error handling

### 2. Widget Implementation
- Chain reaction pattern
- State preservation
- Error recovery
- Mobile support

### 3. Testing
- Unit tests
- Integration tests
- State validation
- Error scenarios

## CRUD Development

### 1. MiniDataAPI Usage
- Table definition
- CRUD operations
- Type safety
- Error handling

### 2. UI Components
- Form handling
- Data display
- State management
- Validation

### 3. Testing
- Data operations
- UI interactions
- Error handling
- State validation

## Plugin Development

### 1. Plugin Structure
- Directory organization
- File naming
- Documentation
- Testing

### 2. Development Workflow
- Local development
- Testing
- Deployment
- Version control

### 3. Best Practices
- Code organization
- Error handling
- State management
- Documentation

## Common Patterns

### 1. State Management
- DictLikeDB usage
- State preservation
- Error recovery
- Data validation

### 2. Error Handling
- Input validation
- API errors
- State recovery
- User feedback

### 3. UI Patterns
- Form handling
- Data display
- Loading states
- Error messages

## Testing Guidelines

### 1. Unit Testing
- Function testing
- State validation
- Error handling
- Edge cases

### 2. Integration Testing
- Workflow testing
- State management
- Error recovery
- UI interactions

### 3. Performance Testing
- Resource usage
- Response times
- Memory usage
- Load testing

## Deployment

### 1. Local Deployment
- Environment setup
- Configuration
- Testing
- Monitoring

### 2. Production Deployment
- Environment setup
- Configuration
- Testing
- Monitoring

### 3. Maintenance
- Updates
- Backups
- Monitoring
- Troubleshooting

## Best Practices

1. **Keep it simple.** Avoid complex patterns when simple ones will work.
2. **Stay local and single-user.** Embrace the benefits of local-first design.
3. **Be explicit over implicit.** WET code that's clear is better than DRY code that's obscure.
4. **Preserve the chain reaction.** Maintain the core progression mechanism in workflows.
5. **Embrace observability.** Make state changes visible and debuggable.

[Read more about our development philosophy and best practices on our blog →](/blog/)

## Contributing

When contributing to Pipulate, please adhere to these principles:

* Maintain Local-First Simplicity (No multi-tenant patterns, complex ORMs, heavy client-side state)
* Respect Server-Side State (Use DictLikeDB/JSON for workflows, MiniDataAPI for CRUD)
* Preserve the Workflow Pipeline Pattern (Keep steps linear, state explicit)
* Honor Integrated Features (Don't disrupt core LLM/Jupyter integration)

## The Magic Cookie System

Pipulate uses a "Magic Cookie" system for seamless installation and updates. This approach enables:

- **Git-less Installation**: Users don't need git installed
- **Automatic Updates**: Software stays current without manual intervention (using git)
- **Cross-Platform**: Works identically on macOS, Linux, and Windows (WSL)
- **White-Label Ready**: Easy to rebrand for different organizations

### How It Works

1. **Initial Installation**:
```bash
curl -L https://pipulate.com/install.sh | sh -s AppName
```

This downloads a ZIP archive containing:
- The application code
- A ROT13-encoded SSH key (the "magic cookie")
- Configuration files

2. **First Run Transformation**:
When `nix develop` runs for the first time:
- Detects non-git directory
- Clones the repository
- Preserves app identity and credentials
- Sets up the environment

3. **Automatic Updates**:
The system performs git pulls:
- On shell entry
- Before server startup
- During application runs

### White-Labeling Process

To create a white-labeled version of Pipulate:

1. **Custom Branding**:
```bash
# Install with custom name
curl -L https://pipulate.com/install.sh | sh -s YourBrandName
```

2. **Configuration Files**:
- `app_name.txt`: Contains the application identity
- `.ssh/rot`: ROT13-encoded deployment key
- `flake.nix`: Environment configuration

3. **Customization Points**:
- Application name and branding
- Default workflows and plugins
- Environment variables
- Database schema

4. **Deployment Options**:
- Direct installation from pipulate.com
- Self-hosted installation script
- Custom domain deployment

### Best Practices for White-Labeling

1. **Branding Consistency**:
- Use consistent naming across all files
- Update all UI elements and documentation
- Maintain version tracking

2. **Security Considerations**:
- Keep deployment keys secure
- Use ROT13 encoding for SSH keys
- Maintain proper file permissions

3. **Update Management**:
- Test updates in development first
- Maintain separate deployment keys
- Monitor update logs

4. **User Experience**:
- Provide clear installation instructions
- Document customization options
- Include troubleshooting guides

### Magic Cookie System: Installation & Transformation Flow

The following diagram illustrates how the magic cookie system works to bootstrap, transform, and update a Pipulate installation without requiring git at the start:

```
User runs install.sh (via curl)           Nix Flake Activation & Transformation
┌──────────────────────────────┐         ┌────────────────────────────────────────────┐
│ 1. Download install.sh       │         │ 5. User runs 'nix develop'                 │
│ 2. Download ZIP from GitHub  │         │ 6. Flake detects non-git directory         │
│ 3. Extract ZIP to ~/AppName  │         │ 7. Flake clones repo to temp dir           │
│ 4. Download ROT13 SSH key    │         │ 8. Preserves app_name.txt, .ssh, .venv     │
│    to .ssh/rot               │         │ 9. Moves git repo into place               │
└─────────────┬────────────────┘         │10. Sets up SSH key for git                 │
              │                          │11. Transforms into git repo                │
              ▼                          │12. Enables auto-update via git pull        │
      ┌─────────────────────────────────────────────────────────────────────────────┐
      │ Result: Fully functional, auto-updating, git-based Pipulate installation    │
      └─────────────────────────────────────────────────────────────────────────────┘
```

**Legend:**
- Steps 1–4: Performed by the install.sh script (no git required)
- Steps 5–12: Performed by the flake.nix logic on first nix develop

## Development Workflow

When developing white-labeled versions:

1. **Local Development**:

```bash
# Start with a copy
cp 20_hello_workflow.py 20_hello_workflow (Copy).py

# Develop and test
# Rename to xx_ for testing
mv "20_hello_workflow (Copy).py" xx_my_workflow.py

# Deploy when ready
mv xx_my_workflow.py 30_my_workflow.py
```

{:start="2"}
2. **Testing Updates**:
- Use `xx_` prefix for development versions
- Test in isolated environments
- Verify update mechanisms

{:start="3"}
3. **Deployment**:
- Use numbered prefixes for menu order
- Maintain consistent naming
- Document all customizations

This approach ensures smooth development and deployment of white-labeled versions while maintaining the benefits of automatic updates and cross-platform compatibility. 
