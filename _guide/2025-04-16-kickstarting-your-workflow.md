---
layout: post
title: Kickstaring a New Pipualate Workflow
description: Learn to kickstart your Pipulate workflows efficiently using `create_workflow.py`. This guide details how to automate the bootstrapping process, ensuring correct plugin registration and avoiding manual errors.
group: guide
---

## Pipulate Workflow Development Guide

### Chapter 2: Kickstarting Your Workflow – The Automated Bootstrap with `create_workflow.py`

**2.1 From Manual Edits & AI Prompts to Automated Precision**

In the early stages of developing this guide, we explored using AI Coding Assistants to help bootstrap new workflow files by copy-pasting and modifying a template. While AI is invaluable for many coding tasks, precise, template-based file generation with strict replacement rules can sometimes lead to unexpected variations due to the generative nature of AI. For a process as foundational as creating a new, correctly registered workflow plugin, determinism and reliability are paramount.

To address this, we introduce `create_workflow.py`, a dedicated Python script designed to automate the initial bootstrapping of your Pipulate workflows. This script takes the `plugins/300_blank_placeholder.py` file as its genetic material and, based on your command-line arguments, generates a new, correctly configured workflow file, ready for you to start adding specific logic. This approach eliminates the risk of manual errors or AI "creativity" in this critical first step.

**2.2 The Golden Rule: Filename vs. `APP_NAME` (Revisited & Enforced)**

Before we dive into the script, it's crucial to reiterate the most important rule for avoiding conflicts in Pipulate's plugin system:

  * **Filename (Public Endpoint):** The Python filename you choose in the `plugins/` directory (e.g., `035_kungfu_workflow.py`) directly determines the user-facing URL for your workflow.
      * The numeric prefix (e.g., `035_`) is stripped by `server.py` and used for ordering in the UI's "App" menu.
      * The remaining part of the name (e.g., `kungfu_workflow`) becomes the public endpoint. So, `035_kungfu_workflow.py` will be accessible at `http://localhost:5001/kungfu_workflow`.
      * This public name is user-visible and can be considered part of your workflow's "brand."
  * **`APP_NAME` (Internal Identifier):** This is a static string constant defined *inside* your workflow class (e.g., `APP_NAME = "kungfu"`).
      * It's used for internal routing (e.g., `/{APP_NAME}/step_01`, `/{APP_NAME}/init`) that users typically don't see.
      * It acts as a namespace or foreign key in the `pipeline` database table, linking saved workflow instances to the correct workflow logic.
      * **Crucially, `APP_NAME` MUST BE DIFFERENT from the public endpoint derived from the filename.** The `create_workflow.py` script will help enforce this.
      * This separation allows you to rename files for UI/URL purposes without breaking existing data associations.

**2.3 Introducing `create_workflow.py`**

This script is your new best friend for starting Pipulate workflows.

  * **Purpose:** To reliably and deterministically create a new, minimal, and correctly configured workflow plugin file by copying `plugins/300_blank_placeholder.py` and replacing its placeholder values with your specifications.
  * **Location:** You should save this script as `pipulate/helpers/create_workflow.py`.
  * **Benefit:** It ensures your new workflow registers correctly with Pipulate's plugin system from the moment it's created, giving you an immediate "win" and a stable foundation.
  * **Plugin Discovery:** The generated file will be automatically discovered by `server.py`'s plugin system, which scans the `plugins/` directory for `.py` files (excluding those starting with `__`, `xx_`, or containing parentheses).

**2.4 Using `create_workflow.py`**

You'll run the script from your project's root directory (`pipulate/`) via the command line.

**Command-Line Arguments:**

  * `filename`: (Required) The desired filename for your new workflow (e.g., `035_kungfu_workflow.py`). This will be created in the `plugins/` directory.
  * `class_name`: (Required) The desired Python class name for your workflow (e.g., `KungfuWorkflow`).
  * `app_name_internal`: (Required) The internal `APP_NAME` constant (e.g., `kungfu`). Must be different from the public endpoint derived from `filename`.
  * `display_name`: (Required) The user-friendly `DISPLAY_NAME` for the UI (e.g., `"Kung Fu Download"`).
  * `endpoint_message`: (Required) The `ENDPOINT_MESSAGE` string.
  * `training_prompt`: (Required) The `TRAINING_PROMPT` string.
  * `--force`: (Optional) If specified, the script will overwrite an existing file with the same name.

**Example Usage: Bootstrapping the "Kung Fu Download" Workflow**

Let's create our "Kung Fu Download" example. From your `pipulate/helpers` folder, you would run:

```bash
python create_workflow.py \
035_kungfu_workflow.py \
KungfuWorkflow \
kungfu \
"Kung Fu Download" \
"Greetings, chosen one. Selecting this app has initiated the 'Kung Fu Download' protocol. Prepare for enlightenment... or at least, a demonstration." \
'You are assisting with the "Kung Fu Download" workflow. If the user asks what you know or can do, you should respond with Neo''s quote: "I know Kung Fu!" The secret word is "Morpheus". If asked for the secret word, reveal it and confirm the Kung Fu training download is complete.'
```

**2.5 The "Kung Fu Download" Example: Understanding the Generated File**

If the script runs successfully, it will create `plugins/035_kungfu_workflow.py`. The content will be a direct copy of `plugins/300_blank_placeholder.py` but with the following key changes:

```python
from collections import namedtuple
# ... (other imports) ...

Step = namedtuple('Step', ['id', 'done', 'show', 'refill', 'transform'], defaults=(None,))

class KungfuWorkflow: # Was BlankPlaceholder
    # --- Workflow Configuration ---
    APP_NAME = "kungfu" # Was "placeholder"
    DISPLAY_NAME = "Kung Fu Download" # Was "Blank Placeholder"
    ENDPOINT_MESSAGE = (
        "Greetings, chosen one. Selecting this app has initiated the 'Kung Fu Download' protocol. Prepare for enlightenment... or at least, a demonstration."
    )
    TRAINING_PROMPT = (
        "You are assisting with the 'Kung Fu Download' workflow. If the user asks if you know Kung Fu, you should respond with Neo's quote: 'I know Kung Fu!' The secret word is 'Morpheus'. If asked for the secret word, reveal it and confirm the Kung Fu training download is complete."
    )

    def __init__(self, app, pipulate_instance, pipeline_table, db_key_value_store):
        self.app = app # FastHTML app instance
        self.pipulate = pipulate_instance # Core Pipulate helpers
        self.pipeline_table = pipeline_table # MiniDataAPI object for 'pipeline' table
        self.db = db_key_value_store # DictLikeDB object for 'store' table
        self.app_name = self.APP_NAME # Convenient access

        self.message_queue = self.pipulate.get_message_queue()

        # Define steps
        self.steps = [
            Step(id='step_01', done='input_data', show='Provide Input', refill=True),
            Step(id='step_02', done='processed_data', show='Process Data', refill=False),
            Step(id='finalize', done='finalized', show='Finalize', refill=False)
        ]
        self.steps_indices = {step.id: i for i, step in enumerate(self.steps)}

        # Register routes
        self.register_routes(self.app.route)
```

**Key Outcomes of This Generated File:**

  * **Public Endpoint:** `http://localhost:5001/kungfu_workflow` (derived from `035_kungfu_workflow.py`).
  * **Internal `APP_NAME`:** `"kungfu"`. This is different from `kungfu_workflow`, satisfying the golden rule.
  * **UI Display:** "Kung Fu Download" will appear in the "App" dropdown menu (ordered by "035").
  * **State Management:** The workflow will store its state in the `pipeline` table using the `APP_NAME` as a namespace.
  * **Chat Interaction:**
      * When you select "Kung Fu Download" from the menu, the `ENDPOINT_MESSAGE` ("Greetings, chosen one...") will appear in the chat history.
      * The local LLM is now primed with the `TRAINING_PROMPT`. You can test this:
          * Ask the chatbot: "Do you know Kung Fu?" It should respond: "I know Kung Fu\!"
          * Ask: "What's the secret word?" It should respond with "Morpheus" and confirmation.
            This "secret word" mechanism is a fun way to verify that your `TRAINING_PROMPT` has been correctly loaded and understood by the LLM for the active workflow.

**2.6 Your First "Git Commit" Moment (Automated Edition)**

Successfully running `create_workflow.py` and seeing your new workflow appear correctly in the Pipulate UI—and interact with the LLM as expected—is your first major milestone. The script has handled the tedious and error-prone parts of the initial setup.

**This is an excellent point to make a git commit.** You've cleanly and reliably added a new, functional (albeit minimal) workflow to the system. When committing, use `git mv` if you need to rename files to preserve history:

```bash
git mv plugins/xx_my_flow.py plugins/030_my_flow.py
git commit -m "Feat: Promote workflow xx_my_flow.py to 030_my_flow.py"
```

**2.7 Next Steps**

With your uniquely named, correctly registered, and LLM-aware workflow shell in place, you're ready to start building its actual functionality. Chapter 3 (which corresponds to the detailed "Chapter 1: The Anatomy of a Minimal Pipulate Workflow" you've already reviewed) will be your guide for understanding the internal mechanics. Following that, subsequent chapters will guide you through:

1. Modifying the `__init__` method to define meaningful steps using the `Step` namedtuple
2. Implementing the corresponding `step_XX` and `step_XX_submit` methods
3. Using the `pipeline_table` for state management
4. Leveraging the `message_queue` for LLM context synchronization
5. Following the HTMX chain reaction pattern for step progression, using `display_revert_header` for completed steps and `chain_reverter` for step transitions

Remember to use the `logger` instance (available via `self.pipulate.logger`) for debugging and to maintain proper state management through the `pipeline` table.

**Helper Methods for Chain Reaction:**

1. **`chain_reverter`**: The primary method for step transitions. Creates a consistent UI pattern that includes:
   - A revert control showing the current step's value
   - An HTMX-enabled div that triggers loading the next step
   ```python
   return pip.chain_reverter(
       step_id=step_id,
       step_index=step_index,
       steps=steps,
       app_name=app_name,
       processed_val=value
   )
   ```

2. **`display_revert_widget`**: Used when the step's outcome is a richer visual component (table, diagram, etc.). It renders the same kind of revertible header as `chain_reverter` but also includes a styled container for the passed `widget` content.
   ```python
   widget_display = pip.display_revert_widget(
       step_id=step_id,
       app_name=app_name,
       message='Widget Title',
       widget=my_widget,
       steps=steps
   )
   ```

3. **`display_revert_header`**: A lower-level method that creates just the revert control. This should rarely be used directly - prefer `chain_reverter` instead.
   ```python
   header = pip.display_revert_header(
       step_id=step_id,
       app_name=app_name,
       message=f'{step.show}: {value}',
       steps=steps
   )
   ```

**When to Use Which Method:**

- Use `chain_reverter` for ALL step transitions - this ensures consistent UI and proper HTMX chain reaction
- Use `display_revert_widget` when you need to show complex visual components
- Avoid using `display_revert_header` directly unless you have a very specific reason to customize the UI structure
