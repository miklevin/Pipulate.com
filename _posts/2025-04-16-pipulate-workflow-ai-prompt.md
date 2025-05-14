---
layout: post
title: Pipulate Workflow AI Prompt
description: Changeme
group: blog
---

## Pipulate Workflow Development Guide

### Chapter 2: Kickstarting Your Workflow – The AI-Assisted Bootstrap

**2.1 The Power of a Clean Start: Instant Workflow Registration**

Before diving into complex logic or multiple steps, the very first goal when creating a new Pipulate workflow is to get it to **exist** within the Pipulate system. This means creating a new plugin file that `server.py` can discover, correctly initializing its core configuration so it appears in the "App" dropdown menu, and ensuring it has its own unique space for routes and data without conflicting with other plugins.

Achieving this "Day 0" registration is a significant early win. It confirms your basic setup is correct and provides immediate positive feedback. The simplest way to do this is by starting with a minimal, functional template. For this, we use `plugins/710_blank_placeholder.py` as our genetic material. It's essentially the `700_widget_shim.py` we dissected in Chapter 1, but explicitly intended as a starting point for *new, multi-step workflows* rather than just single-widget shims.

**2.2 The Golden Rule: Filename vs. `APP_NAME`**

This is the most critical detail to get right at the very beginning to avoid frustrating routing conflicts:

  * **Filename (Public Endpoint):** The Python filename in the `plugins/` directory (e.g., `035_kungfu_workflow.py`) determines the user-facing URL.

      * The numeric prefix (`035_`) is stripped and used for menu ordering.
      * The rest of the name (`kungfu_workflow`) becomes the public endpoint: `http://localhost:5001/kungfu_workflow`.
      * This public endpoint is like the "marketing name" of your workflow; it's what users see and can be changed if needed (though changing it will change the URL).

  * **`APP_NAME` (Internal Identifier):** This is a static string constant defined *inside* your workflow class (e.g., `APP_NAME = "kungfu"`).

      * It's used for **internal routing** (e.g., `/{APP_NAME}/step_01`, `/{APP_NAME}/init`) which the user generally doesn't see directly.
      * It's also used as a **namespace or foreign key** in the `pipeline` database table to associate saved workflow instances with this specific workflow logic.
      * **Crucially, `APP_NAME` MUST BE DIFFERENT from the public endpoint derived from the filename.**
          * **Correct:** Filename `035_kungfu_workflow.py` (public endpoint: `kungfu_workflow`), `APP_NAME = "kungfu"`
          * **Incorrect (will cause conflicts):** Filename `035_kungfu.py` (public endpoint: `kungfu`), `APP_NAME = "kungfu"`

Your AI Coding Assistant might naturally try to use the same name for both if not explicitly told otherwise. This distinction must be clear in your prompt.

**2.3 Restraining AI Ambition: The One-Step Bootstrap Prompt**

AI Coding Assistants are eager to help and often try to do too much at once. For this initial bootstrap, we want the AI to perform a very specific, limited set of tasks. The goal is to copy the placeholder, make essential name changes, and nothing more. This ensures a clean commit point before adding complexity.

**Prompt Template for AI Coding Assistant (e.g., Gemini, Claude in Cursor, Copilot):**

```text
Okay, AI Assistant, I need your help to bootstrap a new Pipulate workflow.

**Overall Goal:** Create a new, minimal workflow plugin file that will immediately and correctly register with the Pipulate system and appear in the UI dropdown menu. We will add more steps and logic later.

**Specific Tasks for THIS step (and ONLY these tasks):**

1.  **Copy Template:**
    * Locate the file: `plugins/710_blank_placeholder.py`
    * Create a copy of this file in the `plugins/` directory.

2.  **Rename the Copied File:**
    * Rename the newly copied file to: `plugins/‹new_workflow_filename.py›` (e.g., `035_kungfu_workflow.py`)

3.  **Modify the Content of the New File (`‹new_workflow_filename.py›`):**
    * **Rename the Class:** Change the class name from `BlankPlaceholder` to `‹NewWorkflowClassName›` (e.g., `KungfuWorkflow`).
    * **Update `APP_NAME` Constant:**
        * Change the `APP_NAME` static class variable to a unique internal identifier: `APP_NAME = "‹internal_app_name›"` (e.g., `"kungfu"`).
        * **VERY IMPORTANT:** Ensure this `‹internal_app_name›` is DIFFERENT from the public endpoint part of `‹new_workflow_filename.py›`. For example, if the filename is `035_kungfu_workflow.py`, the public endpoint will be `kungfu_workflow`. So, `APP_NAME` could be `"kungfu"`, but NOT `"kungfu_workflow"`.
    * **Update `DISPLAY_NAME` Constant:**
        * Change the `DISPLAY_NAME` static class variable to a user-friendly name: `DISPLAY_NAME = "‹User-Friendly Workflow Name›"` (e.g., `"Kung Fu Download"`).
    * **Update `ENDPOINT_MESSAGE` Constant:**
        * Change the `ENDPOINT_MESSAGE` static class variable to: `ENDPOINT_MESSAGE = "‹Initial message for chat UI when user visits this workflow›"`
    * **Update `TRAINING_PROMPT` Constant:**
        * Change the `TRAINING_PROMPT` static class variable to an embedded string: `TRAINING_PROMPT = "‹Instructions for the local LLM when this workflow is active, including a secret word for confirmation›"`

**DO NOT:**
* Add any new steps to the `self.steps` list in `__init__`.
* Modify the logic of `step_01` or `step_01_submit` yet.
* Change any other methods (`landing`, `init`, `finalize`, etc.) beyond what's necessary for the class name change.
* Add any new helper methods or imports not already in `710_blank_placeholder.py` (unless absolutely required by a name change, which is unlikely).

Please make these changes and provide the complete content of the new file `plugins/‹new_workflow_filename.py›`. Then STOP.
```

**2.4 Example Prompt: Bootstrapping the "Kung Fu Download" Workflow**

Let's apply this template to create our fun "Kung Fu Download" workflow.

**Prompt to AI Coding Assistant:**

```text
Okay, AI Assistant, I need your help to bootstrap a new Pipulate workflow.

**Overall Goal:** Create a new, minimal workflow plugin file that will immediately and correctly register with the Pipulate system and appear in the UI dropdown menu. We will add more steps and logic later.

**Specific Tasks for THIS step (and ONLY these tasks):**

1.  **Copy Template:**
    * Locate the file: `plugins/710_blank_placeholder.py`
    * Create a copy of this file in the `plugins/` directory.

2.  **Rename the Copied File:**
    * Rename the newly copied file to: `plugins/035_kungfu_workflow.py`

3.  **Modify the Content of the New File (`plugins/035_kungfu_workflow.py`):**
    * **Rename the Class:** Change the class name from `BlankPlaceholder` to `KungfuWorkflow`.
    * **Update `APP_NAME` Constant:**
        * Change the `APP_NAME` static class variable to: `APP_NAME = "kungfu"`
        * (This ensures "kungfu" is different from "kungfu_workflow" derived from the filename).
    * **Update `DISPLAY_NAME` Constant:**
        * Change the `DISPLAY_NAME` static class variable to: `DISPLAY_NAME = "Kung Fu Download"`
    * **Update `ENDPOINT_MESSAGE` Constant:**
        * Change the `ENDPOINT_MESSAGE` static class variable to: `ENDPOINT_MESSAGE = "Greetings, chosen one. Selecting this app has initiated the 'Kung Fu Download' protocol. Prepare for enlightenment... or at least, a demonstration."`
    * **Update `TRAINING_PROMPT` Constant:**
        * Change the `TRAINING_PROMPT` static class variable to an embedded string: `TRAINING_PROMPT = "You are assisting with the 'Kung Fu Download' workflow. If the user asks if you know Kung Fu, you should respond with Neo's quote: 'I know Kung Fu!' The secret word is 'Morpheus'. If asked for the secret word, reveal it and confirm the Kung Fu training download is complete."`

**DO NOT:**
* Add any new steps to the `self.steps` list in `__init__`.
* Modify the logic of `step_01` or `step_01_submit` yet.
* Change any other methods (`landing`, `init`, `finalize`, etc.) beyond what's necessary for the class name change.
* Add any new helper methods or imports not already in `710_blank_placeholder.py`.

Please make these changes and provide the complete content of the new file `plugins/035_kungfu_workflow.py`. Then STOP.
```

**2.5 Expected Outcome and Your First "Git Commit" Moment**

After the AI Assistant processes this prompt, you should have a new file, `plugins/035_kungfu_workflow.py`. Its content will be almost identical to `710_blank_placeholder.py` except for:

  * The class name will be `KungfuWorkflow`.
  * The static constants `APP_NAME`, `DISPLAY_NAME`, `ENDPOINT_MESSAGE`, and `TRAINING_PROMPT` will have their new "Kung Fu" themed values.

When `server.py` restarts (which it should do automatically due to the file watchdog system), this new "Kung Fu Download" workflow should appear in the "App" dropdown menu. Selecting it should:

1.  Display the "Kung Fu Download" as the current app in the breadcrumb navigation.
2.  Show the campy `ENDPOINT_MESSAGE` in the chat UI.
3.  Prime the local LLM with the `TRAINING_PROMPT`. You can test this by asking the chatbot, "Do you know Kung Fu?" or "What's the secret word?"

This successful registration and basic interaction is your first major milestone. **This is an excellent point to make a git commit.** You've cleanly added a new, functional (albeit minimal) workflow to the system.

**Next Steps:** With this bootstrapped workflow in place, Chapter 3 will guide you through the process of modifying its `__init__` method to define actual, meaningful steps, and then implementing the corresponding `step_XX` and `step_XX_submit` methods, effectively "splicing in" new functionality, one step at a time.
