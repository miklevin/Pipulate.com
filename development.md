---
title: Development Guide
description: Development patterns and workflows for Pipulate
permalink: /development/
group: documentation
---

# Development Guide

> **Note**: This is a condensed reference guide. For detailed, step-by-step tutorials and in-depth explanations, see the [Pipulate Guide](/guide/).

> **Before You Begin**: Make sure you've completed the [installation process](/). This guide assumes you have Pipulate running locally with `nix develop`.

## Introduction

Pipulate is designed as a *simpler alternative* to using Jupyter Notebooks — so
***you don't have to be a developer to use.*** Most people know Jupyter
Notebooks as just ***notebooks*** because Google Colab. Pipulate is like
notebooks but without the Python code. The main audience is SEO practitioners
upping their game in the age of AI.

**The key insight**: Pipulate workflows use a `run_all_cells()` pattern that directly mirrors Jupyter's "Run All Cells" command. This creates an immediate mental model - each workflow step is like a notebook cell, and the system automatically progresses through them top-to-bottom, just like running all cells in a notebook.

So if you're a technical SEO but a non-programmer, just install and use Pipulate. For people who want to actually participate in *making* those next-gen SEO tools, this page is for you!

## Core Concepts

### Something Different

Pipulate is built on familiar web development foundations but takes a unique approach:

1. **Framework Similarity**: It uses Python web routing patterns similar to Flask/FastAPI
2. **HTMX Integration**: The key difference is its use of HTMX for dynamic interactions
3. **Workflow Creation**: You create step-by-step automation sequences using HTMX components
4. **Local Execution**: All workflows run on your local machine, not in the cloud
5. **Easy Setup**: The installer handles all configuration automatically

To get started:
1. Open Terminal
2. Navigate to your Pipulate installation directory using `cd`
3. Run `nix develop`
4. Access both JupyterLab and Pipulate through your web browser - they run locally but appear as web applications

> **Note on Nix**: If you're new to Nix, check out [Nix Pills](https://nixos.org/guides/nix-pills/) for a gentle introduction. For now, just know that `nix develop` sets up your development environment automatically.

### JupyterLab Included

Pipulate doesn't replace notebooks, but rather packages up those notebooks into
workflows for people who don't want to deal with the code, and so I install them
side-by-side. JupyterLab works as a place to mock-up things to port over to
Pipulate. In fact, Pipulate is a great way to get a general purpose JupyterLab
installed with spell-checking and JupyterAI. On the Pipulate tab you can start
experimenting around setting up profiles, playing with the tasks app, and trying
the workflows that don't require Botify. More general SEO workflows will be
forthcoming. 

> **Porting from JupyterLab**: While porting is currently manual, the workflow structure closely mirrors notebook cells, making the transition intuitive. Future versions may include automated porting tools.

## Development Patterns

### The Plugin System

#### Copy/Paste CRUD `020_tasks.py`

There's an automatic plugin registration system that uses the `plugins` folder.
If you want an immediate positive experience without coding or AI assistance, I
recommend you just copy/paste the `020_tasks.py` and rename it to something like
`025_competitors.py` and it will just auto-register the new plugin app and you
can keep a list of competitors *per user profile*. This CRUD (Create, Read,
Update, Delete) todo app is based on DRY principles (Don't Repeat Yourself), and
so there's not much coding for customizations like this. If you want to know
more about it, it closely resembles the standard TODO app tutorial from
FastHTML. You can't do any harm. Just stay in Dev-mode and use the `Clear DB`
mode as much as you like while you get used to it.

#### Flexible Workflow System

The tasks app is the only DRY thing there. Everything else in there are
`Workflows` and workflows are WET (Write Everything Twice/We Enjoy Typing) — and
therefore more involved to figure out, but is where the Pipulate's power and
uniqueness reside. Because Workflows basically let you do anything you can in a
Jupyter Notebook they have to be much more flexible than your traditional "on
rails" web app framework — and it's gonna look different. Figuring out how to create
and modify Pipulate Workflows will be challenging and take some time, but AI
Coding Assistance helps A LOT.

> **Debugging Workflows**: Pipulate includes built-in logging and state inspection tools. Use the `pip.read_state()` function to inspect workflow state at any point, and check the browser's developer console for HTMX events and responses.

### 1. Workflow Development Pattern

When creating new workflows in Pipulate, follow this pattern:

```python
from collections import namedtuple
Step = namedtuple('Step', ['id', 'done', 'show', 'refill', 'transform'], defaults=(None,))

class MyWorkflow:
    # --- Core Configuration ---
    APP_NAME = "unique_name"           # Unique identifier, different from filename
    DISPLAY_NAME = "User-Facing Name"  # UI display name
    ENDPOINT_MESSAGE = (               # Shown when user visits workflow
        "This workflow helps you [purpose]. "
        "Enter an ID to start or resume your workflow."
    )
    TRAINING_PROMPT = "workflow_name.md"  # Training context for AI assistance
    
    def __init__(self, app, pipulate, pipeline, db, app_name=APP_NAME):
        self.app = app
        self.pipulate = pipulate
        self.pipeline = pipeline
        self.db = db
        self.app_name = app_name
        self.message_queue = pipulate.get_message_queue()
        
        # Define workflow steps
        self.steps = [
            Step(id='step_01', done='first_field', show='First Step', refill=True),
            Step(id='step_02', done='second_field', show='Second Step', refill=True),
            Step(id='finalize', done='finalized', show='Finalize', refill=False)
        ]
        
        # Register routes
        self.register_routes(app.route)
```

Key points:
- Each workflow is a Python class with standardized configuration
- Steps are defined as named tuples with clear purposes
- Routes are registered in the constructor
- State is managed through the pipeline object
- Training prompts help AI assistants understand the workflow

> **Important**: The `APP_NAME` must be different from both the filename and any public endpoints. For example, if your file is `035_my_workflow.py`, use `myworkflow` or `my_flow` as the `APP_NAME`, not `my_workflow`.

### Anatomy of a Step

To understand Pipulate Workflows is to understand a Step. A Step is modeled
after a single Cell in a Jupyter Notebook, but because there is a ***visible***
part and an ***invisible*** part after you press submit or "Run" the Cell, each
step really has 2 parts:

1. step_xx
2. step_xx_submit

The first part, `step_xx` builds the user interface for the user. The later
submit part is mostly invisible to the user but does have to reconstruct the
`elif` condition to produce the revert-phase view. It's usually very little code
— so little that it's not worth "externalizing" or building into a function for
reuse. This is the WET part of Workflows. The 3 phases of a `step_xx` are:

```python
if "finalized" in finalize_data and placeholder_value:
    # STEP PHASE: Finalize
elif placeholder_value and state.get("_revert_target") != step_id:
    # STEP PHASE: Revert
else:
    # STEP PHASE: Get Input
```

A lot of the other scaffolding that goes around this is very standard but still
not externalized to keep everything highly customizable. If we zoom out a bit
the overall schematic of a Pipulate Workflow is:

```python
import  # Do all imports

# Model for a workflow step
Step = namedtuple('Step', ['id', 'done', 'show', 'refill', 'transform'], defaults=(None,))

class WorkflowName:
    APP_NAME            # Private endpoints & foreign key, must be different from filename
    DISPLAY_NAME        # Show the user
    ENDPOINT_MESSAGE    # Sent to chat UI when user visits
    TRAINING_PROMPT     # Local LLM trained on when user visits

    # --- Initialization ---
    def __init__(self, app, pipulate, pipeline, db, app_name=APP_NAME):
        steps   # define steps
        routes  # register routes

    # --- Core Workflow Engine Methods ---
    async def landing(self, request):  # Builds initial UI that presents key
    async def init(self, request):  # Handles landing key submit
        return pip.run_all_cells(app_name, steps)  # The "Run All Cells" pattern
    async def finalize(self, request):  # Puts workflow in locked state
    async def unfinalize(self, request):  # Takes workflow out of locked state
    async def get_suggestion(self, step_id, state):  # Pipes data from step to step
    async def handle_revert(self, request):  # Handles revert buttons

    # --- Step Methods ---

    async def step_01(self, request):
        if "finalized" in finalize_data and placeholder_value:
            # STEP PHASE: Finalize
            # hx_trigger="load" (chain reaction)
        elif placeholder_value and state.get("_revert_target") != step_id:
            # STEP PHASE: Revert
            # hx_trigger="load" (chain reaction)
        else:
            # STEP PHASE: Get Input
            # Collects data (don't chain react - data has to be collected!)

    async def step_01_submit(self, request):
        # SAME AS: Revert
        # hx_trigger="load" (chain reaction)
```

### 2. Chain Reaction Pattern: The `run_all_cells()` Breakthrough

Pipulate Workflows always chain-react as far as they can when you plug-in a Key!
This is their secret to non-interruptability. The truth is Pipulate Workflows
are always interrupted all the time, just going as far as they can until
encountering a step with no data — therefore providing perfect resumability.

**The `run_all_cells()` naming breakthrough**: This method name creates the perfect mental model. Just like clicking "Run All Cells" in Jupyter, it executes the workflow from top to bottom, stopping only when it encounters a step that needs input. The name itself teaches the pattern.

This chain reaction gives Pipulate its signature feel, constantly reinforcing
the top-down linear workflow model that exactly mimics Jupyter's *Run All Cells.* This
is going to be weird to you until it isn't. Keeping the chain reaction pattern
in place in each of its standard positions is crucial for workflow progression.

The core purpose of any `step_XX_submit` handler, or the "Revert Phase" of a `step_XX` GET handler, is to:
1. Display the outcome/summary of the current step in a way that allows the user to revert it
2. Trigger the loading of the next step to continue the chain reaction

There are two main ways to achieve this:

**Method 1: Manual Construction (More Verbose, More Control)**

This is what you'd do if you needed to insert custom HTML around the revert header or if the "next step" logic was conditional:

```python
# In a step_XX_submit handler or step_XX (Revert Phase)
# processed_val would be the result of the current step's operation

# 1. Create the display for the current completed step
revert_header_content = pip.display_revert_header(
    step_id=current_step_id, 
    app_name=app_name, 
    message=f'{current_step.show}: {processed_val}', 
    steps=steps
)

# 2. Create the trigger for the next step
next_step_trigger_div = Div(
    id=next_step_id, 
    hx_get=f'/{app_name}/{next_step_id}', 
    hx_trigger='load'
)

# 3. Combine them into the standard structure that replaces the current step's div
return Div(
    revert_header_content,  # Or a Card containing this, or pip.display_revert_widget(...)
    next_step_trigger_div,
    id=current_step_id
)
```

**Method 2: Using `chain_reverter` (Concise Shortcut)**

The `chain_reverter` method encapsulates the common pattern shown above:

```python
# In a step_XX_submit handler or step_XX (Revert Phase)
# processed_val is the result of the current step's operation

return pip.chain_reverter(
    step_id=current_step_id, 
    step_index=current_step_index,  # Note: chain_reverter needs the index
    steps=steps, 
    app_name=app_name, 
    processed_val=processed_val
)
```

**When to Use Which Method:**

1. Use `pip.chain_reverter(...)` when:
   - The step completes with a simple string result
   - You want to display that result next to the "Revert" button
   - You want to immediately trigger the next step
   - This is the most common scenario for simple data collection steps

2. Use manual construction with `pip.display_revert_widget(...)` + next-step-Div when:
   - The step completes and needs to display a complex widget (table, chart, custom HTML)
   - You need to show the widget below the revertible header
   - You still want to trigger the next step

3. Use manual construction with `pip.display_revert_header(...)` + next-step-Div when:
   - You need custom layout around the standard revert header
   - You have conditional next-step logic
   - You need to add additional UI elements between the header and next step

**Example: Complex Widget Display**

```python
# For steps with visualizations or widgets
my_widget = CustomTableWidget(data=result_data)
widget_display = pip.display_revert_widget(
    step_id=step_id, 
    app_name=app_name, 
    message='Data Table', 
    widget=my_widget
)
next_step_trigger = Div(
    id=next_step_id, 
    hx_get=f'/{app_name}/{next_step_id}', 
    hx_trigger='load'
)
return Div(widget_display, next_step_trigger, id=step_id)
```

Remember, the crucial part is always including that `Div` for the `next_step_id` with `hx_trigger="load"` to keep the chain reaction going. Whether you use `chain_reverter` or manual construction, this trigger is what enables the automatic progression through your workflow.

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

1. **Copy a Template**: Start with a template (e.g., `900_blank_placeholder.py`) → `xx_my_workflow.py`)
   > **Tip**: Use the `create_workflow.py` helper script in the `helpers/` directory to automatically generate a new workflow from the template. This script handles all the boilerplate setup and ensures consistent naming conventions.

2. **Modify**: Develop your workflow (won't auto-register with parentheses in name)
   > **Tip**: Use the `splice_workflow_step.py` helper script to automatically add new steps to your workflow. It handles step numbering, method generation, and maintains the chain reaction pattern. Just run it with your workflow filename as an argument.

3. **Test**: Rename to `xx_my_flow.py` for testing (server auto-reloads but won't register)
4. **Deploy**: Rename to `XX_my_flow.py` (e.g., `035_my_workflow.py`) to assign menu order and activate

## Workflow Development Helper Scripts

Pipulate includes sophisticated helper scripts for workflow development:

### `create_workflow.py`
Creates new workflows from templates:
```bash
python helpers/create_workflow.py workflow.py MyWorkflow my_workflow \
  "My Workflow" "Welcome message" "Training prompt" \
  --template trifecta --force
```

**Parameters:**
- `workflow.py`: Output filename
- `MyWorkflow`: Class name
- `my_workflow`: APP_NAME (internal identifier)
- `"My Workflow"`: DISPLAY_NAME (user-facing)
- `"Welcome message"`: ENDPOINT_MESSAGE
- `"Training prompt"`: TRAINING_PROMPT filename

**Templates Available:**
- `blank`: Minimal workflow with one step
- `trifecta`: Three-step workflow pattern

### `splice_workflow_step.py`
Adds steps to existing workflows:
```bash
python helpers/splice_workflow_step.py workflow.py --position top
python helpers/splice_workflow_step.py workflow.py --position bottom
```

**Features:**
- Automatically finds the `self.steps = [...]` block
- Handles both direct and indirect assignment patterns
- Adds proper step numbering and method generation
- Maintains comma handling to prevent syntax errors
- Supports top/bottom positioning of new steps

### Template System Features

The template system provides:
- **Automatic Method Generation**: Creates both GET and POST handlers for each step
- **Proper Step Insertion Points**: Uses `STEP_METHODS_INSERTION_POINT` markers
- **Chain Reaction Preservation**: Maintains HTMX progression patterns
- **State Management**: Includes proper state handling patterns

## Running and Maintenance

### Running, Interrupting & Re-running

Pipulate is a FastHTML app, which means it is much like a Flask or FastAPI app.
It's being started with the familiar `python server.py` command, but
automatically by `nix develop` which sets up the `nix` environment. When you
`Ctrl`+`c` out of it you may have some question whether you are still in nix or
not, which determines which command you use to get it re-started:

- `nix develop`
- `python server.py`

...and it's based on whether you see: `(nix)` in the prompt or not. If you do
see it there, then use `python server.py`. If you don't, then use `nix develop`.

## Magic Cookie System

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

> **Security Note**: The ROT13-encoded SSH key is used as a read-only deploy key with restricted repository access. The security of this system relies on proper repository permissions rather than the encoding itself.

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

## Development Workflow

When developing white-labeled versions:

1. **Local Development**:

```bash
# Start with a copy
cp 500_hello_workflow.py 20_hello_workflow (Copy).py

# Develop and test
# Rename to xx_ for testing
mv "500_hello_workflow (Copy).py" xx_my_workflow.py

# Deploy when ready
mv xx_my_workflow.py 25_my_workflow.py
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

## File Structure & Organization

```plaintext
    .
    ├── .cursor               # Guidelines for AI code editing (if using Cursor)
    ├── .venv/                # Virtual environment (shared by server & Jupyter)
    ├── data/
    │   └── data.db           # SQLite database
    ├── downloads/            # Default location for workflow outputs (e.g., CSVs)
    ├── helpers/              # Development helper scripts
    │   ├── create_workflow.py
    │   └── splice_workflow_step.py
    ├── logs/
    │   └── server.log        # Server logs (useful for debugging / AI context)
    ├── static/               # JS, CSS, images
    ├── plugins/              # Workflow plugins (e.g., hello_flow.py)
    ├── training/             # Markdown files for AI context/prompts
    ├── flake.nix             # Nix flake definition for reproducibility
    ├── LICENSE
    ├── README.md             # Main documentation
    ├── requirements.txt      # Python dependencies (managed by Nix)
    ├── server.py             # Main application entry point
    └── start/stop            # Scripts for managing Jupyter (if used)
```

## Best Practices

1. **Keep it simple.** Avoid complex patterns when simple ones will work.
2. **Stay local and single-user.** Embrace the benefits of local-first design.
3. **Be explicit over implicit.** WET code that's clear is better than DRY code that's obscure.
4. **Preserve the chain reaction.** Maintain the core progression mechanism in workflows.
5. **Embrace observability.** Make state changes visible and debuggable.

[Read more about our development philosophy and best practices on our Guide →](/guide/)

## Contributing

When contributing to Pipulate, please adhere to these principles:

* Maintain Local-First Simplicity (No multi-tenant patterns, complex ORMs, heavy client-side state)
* Respect Server-Side State (Use DictLikeDB/JSON for workflows, MiniDataAPI for CRUD)
* Preserve the Workflow Pipeline Pattern (Keep steps linear, state explicit)
* Honor Integrated Features (Don't disrupt core LLM/Jupyter integration)

> **Note on LLM Integration**: The `TRAINING_PROMPT` field enables local LLM training for workflow-specific assistance. Future documentation will cover advanced LLM integration techniques.
