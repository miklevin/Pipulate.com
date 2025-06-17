---
title: "Understanding Pipulate Keys: Your Workflow Passport"
description: "Master Pipulate's clever key system - the invisible thread that ties your workflows together, making them interruptible, resumable, and always ready to pick up exactly where you left off."
author: Mike Levin
group: guide
layout: post
---

Every Pipulate workflow starts with a key. It's that text field at the top of every workflow, and while it might seem like just another form field to fill out, it's actually one of Pipulate's most clever features. Let's demystify it.

## What Are Workflow Keys?
Think of a workflow key as a passport for your workflow instance. It's a unique identifier that:
- Tracks your workflow's state in the `pipeline` table
- Lets you resume exactly where you left off
- Groups related data together
- Makes workflows interruptible and resumable

A typical key follows this format: `{ProfileName}-{WorkflowAppName}-{RunNumber}`. For example: `Default_Profile-Hello_Workflow-04`. In the application, you'll find it as an input field with an "Enter" button, typically displayed in a card-like section on the workflow's landing page.

<article style="padding: 1rem; margin-bottom: 1rem; border: 1px solid var(--pico-muted-border-color, #202632); border-radius: var(--pico-border-radius, 0.25rem); background-color: var(--pico-card-background-color, #181c25);">
  <p style="margin-top:0; margin-bottom: 0.75rem; font-size: 0.9em; color: var(--pico-muted-color, #7b8495);">Example of the key input field:</p>
  <form onsubmit="event.preventDefault(); return false;" style="margin-bottom: 0; max-width: 600px; margin-left: auto; margin-right: auto;">
    <div style="display: flex; align-items: center; gap: 0.5rem;">
      <input type="search" name="pipeline_id_example_in_article" class="contrast" placeholder="Existing or new 🗝 here (Enter for auto)" value="Default_Profile-Hello_Workflow-04" list="pipeline-ids-example-in-article" style="flex-grow: 1; margin-bottom: 0; background-color: #000000 !important; color: #ffffff !important; border-color: #333333 !important;">
      <button type="submit" class="secondary" style="display: inline-block; cursor: pointer; width: auto !important; white-space: nowrap; flex-shrink: 0; margin-bottom: 0;">Enter 🔑</button>
    </div>
    <datalist id="pipeline-ids-example-in-article">
      <option value="Default_Profile-Hello_Workflow-04"></option>
      <option value="Another_Profile-Some_Workflow-12"></option>
    </datalist>
  </form>
</article>

This key is actually a composite, containing three parts:
1. Your current profile (e.g., `Default_Profile`) - stored in `db["last_profile_id"]`
2. The workflow type (e.g., `Hello_Workflow`) - matches the workflow's `APP_NAME` constant
3. A run number (e.g., `04`) - auto-incremented based on existing runs

## The Magic of Auto-Generation
Here's the beautiful part: you often don't have to manually create these keys. Pipulate handles it for you through the `generate_pipeline_key` function in two ways:

### New Workflow Access
When you first access a workflow through:
- The dropdown menu
- Direct URL navigation
- A redirect from another workflow
Pipulate automatically generates a fresh key for you, usually incorporating the current profile, the app name, and the next available sequential number. For instance, if `Default_Profile-Kung_Fu_Download-03` was the last key for the "Kung Fu Download" app under the "Default Profile", the next auto-generated key upon accessing this workflow anew would be `Default_Profile-Kung_Fu_Download-04`. No user action is required for this initial generation – it just works!

### Mid-Workflow Reset or New Instance with Same Prefix
If you're already in a workflow and want to start a new instance or explicitly type a new key:
1. Click the "x" in the key field (if your browser shows one for search inputs) or manually clear it.
2. Type your desired key or leave it blank and hit Enter. If left blank, Pipulate generates the next available key for that workflow and profile.
3. Hit Enter again (if you left it blank and Pipulate filled it) to initialize the workflow with that key.

That's it! A couple of Enter keypresses, and you're running a new workflow instance or the one you specified.

## Resuming Where You Left Off
The real power of the key system shows when you're in the middle of a workflow:
1. Simply ensure the desired workflow key is in the input field.
2. Hit Enter.
3. You're instantly back where you left off in that specific workflow run.
4. No data lost, no state confusion.
5. Perfect for long-running workflows or when you need to switch contexts.

This is possible because Pipulate is designed to be "interrupted" – each step is a discrete operation, and the state of your progress is stored in the `pipeline` table under that unique workflow key.

## Finding Past Workflows
Need to pull up a previous workflow? The key field (and its associated dropdown) doubles as a smart search:
1. Clear the key field (click the "x" or select the text and delete).
2. Start typing any part of a key (e.g., the profile name, workflow type, or run number).
3. Alternatively, click the small downward arrow (if your browser renders one for inputs with datalists) or simply focus the empty field.
4. A dropdown appears showing all your past workflow keys that match what you've typed (or all keys if the field is empty and a datalist is populated).
5. Select any one to populate the field, then hit Enter to resume exactly where you left that workflow.

The key field acts as a filter – the more you type, the more refined the list of suggestions becomes.

## Power User Tips
Once you're comfortable with the basics, here are some pro moves:

### Quick New Instance by Incrementing
Instead of clearing the field to get the next sequential key:
1. Observe the current key, for example, `MyClient-DataAnalysis-03`.
2. Manually change the run number: backspace the `03` and type `04`.
3. Hit Enter once.
4. You've initiated a new workflow instance: `MyClient-DataAnalysis-04`!

### Smart Filtering
- The dropdown suggestions are dynamically filtered as you type.
- If the text in the input field is an exact match for an existing key, the dropdown might not automatically appear until you alter the text (e.g., by backspacing).
- Use this to your advantage: type partial keys to see all matching workflows, which is perfect for finding all runs of a specific workflow type or for a particular profile.

### Always Interruptible
Because of how the key system works:
- Every workflow step saves its state against the current key in the `pipeline` table.
- You can close your browser or navigate away at any time.
- Come back later, enter or select the same key, and hit Enter.
- You're right back where you were.

### Key Generation Strategy
Remember:
- The workflow, once initiated with a key, stays *locked* on that current key until you explicitly change it to start or resume a different one.
- To start a *new, auto-numbered* instance of the *current* workflow type: clear the key field by clicking the "x" (if available) or deleting the text, then hit Enter. Pipulate will populate the field with the next available sequential key. Hit Enter again to load this new workflow.
- A forced page reload (e.g., `Ctrl`+`R` or `F5`) while on a workflow's landing page (before a key is submitted) will typically result in the input field being pre-populated with the next auto-generated key, ready for you to hit Enter.
- This behavior keeps your workflow state predictable and tied to explicit keys.

## Behind the Scenes
While the keys look like structured identifiers (and they are, by convention: `profilename-workflowname-runnumber`), they are stored and treated by the core system as simple unique strings in the `pipeline` table. This design choice means:
- No complex database relationships are strictly enforced by the key format itself.
- The system is flexible and relatively simple to debug.
- It's easy to extend for special cases if needed.
- It's well-suited for the primary goal: workflow state management.

## Special Cases
While most workflows will use the auto-generated `profile-workflow-number` key format, some special-purpose workflows *could* be designed to use other meaningful strings as keys, such as:
- API connection workflows might use an API key or part of it.
- Integration workflows might use an external system's ID.
However, these are edge cases. Generally, it's best to let Pipulate's default key generation and selection mechanism handle the keys for you.

## The Chain Reaction Connection
The key system is deeply integrated with Pipulate's HTMX-driven "chain reaction" pattern for step progression:
- Each step transition within a workflow inherently knows its parent key.
- This key is used to fetch the current state from the `pipeline` table and determine what to render or process next.
- This enables the "Run All Cells" behavior (similar to Jupyter notebooks) where completed steps show their output and the next incomplete step presents its input form, all under the umbrella of the active workflow key.
- And crucially, it allows for perfect interruptibility and resumability.

## Best Practices
1. Generally, let Pipulate auto-generate keys when you first navigate to a workflow.
2. To start a new instance of the *same* workflow, clear the key field and hit Enter (twice if it auto-fills).
3. Use the key field and its dropdown to easily find and resume previous workflow runs.
4. Trust the system to maintain your state based on the active key. The key is king!

## Managing Your Workflow History
While Pipulate's key system makes it easy to resume workflows, it's important to understand that workflows are designed to be temporary. Think of them like a scratch pad - they're perfect for getting work done, but you don't need to keep every single one forever.

### Cleaning Up Individual Workflows
If you want to remove a specific workflow run:
1. Look for the "🗑️" (trash can) icon in the workflow interface
2. Click it to delete just that specific workflow instance
3. All data associated with that key will be removed from the `pipeline` table
4. The workflow will be ready for a fresh start

### Cleaning Up All Workflows of a Type
If you want to start fresh with a particular workflow type:
1. Look for the "Clear All" option in the workflow interface
2. This will remove all instances of that specific workflow type from the `pipeline` table
3. You can then start fresh with new workflow runs
4. This is great for when you want to clean up old test runs or start over

### Why Clean Up?
- Keeps your workflow list clean and manageable
- Frees up space in your local SQLite database
- Makes it easier to find recent, relevant workflows
- Prevents confusion from old test runs

Remember: Workflows are meant to be temporary tools for getting work done. Don't worry about deleting old ones - you can always start fresh with a new workflow run when you need it!

## Why This Matters
This key system is a perfect example of Pipulate's core philosophy:
- Make complex things simple for the user.
- Preserve state naturally and reliably in SQLite.
- Create consistent and predictable behaviors.
- Reduce the user's cognitive load.

You generally don't have to meticulously save your progress or remember complex identifiers. The key system, combined with Pipulate's architecture, handles the state management, letting you focus on executing your SEO tasks and leveraging the AI-assisted workflows.

---

## More Behind The Scenes

> Describe to me how the default key value gets set. Is it by
> @500_hello_workflow.py or by @server.py? Where does that pattern in the key
> *"Profile + Workflow + Next Number"* come from?

Let me explain how the pipeline key (workflow key) system works in Pipulate:

1. **Key Structure**
The key follows a standardized format: `{ProfileName}-{WorkflowAppName}-{RunNumber}`
For example: `Default_Profile-Hello_Workflow-01`

2. **Key Generation**
The key generation is primarily handled by the `generate_pipeline_key` method in the `Pipulate` class in `server.py`. This is the central authority for key generation. The workflow files (like `500_hello_workflow.py`) don't generate keys themselves - they use this central method.

3. **Components of the Key**:
   - `ProfileName`: Comes from the current user profile (e.g., `Default_Profile`)
   - `WorkflowAppName`: Comes from the workflow's `APP_NAME` constant (e.g., `Hello_Workflow`)
   - `RunNumber`: Auto-incremented number (e.g., `01`, `02`, etc.)

4. **How it Works**:
   - When you first access a workflow, the landing page shows an input field pre-populated with a suggested key
   - This suggestion comes from `pipulate.generate_pipeline_key(self)` in the workflow's `landing` method
   - The method:
     1. Gets the current profile name and workflow name
     2. Queries the `pipeline` table to find existing keys for this profile/workflow combination
     3. Finds the highest existing run number and increments it
     4. Formats the number with leading zeros (e.g., `01` instead of `1`)
     5. Combines all parts into the final key

5. **User Interaction**:
   - Users can:
     - Accept the auto-generated key by just pressing Enter
     - Type a custom key (which will be validated and formatted)
     - Select an existing key from the dropdown (populated with previous runs)

6. **Storage**:
   - The active key is stored in `db["pipeline_id"]`
   - The workflow state associated with this key is stored in the `pipeline` table

So to directly answer your questions:
- The default key value is set by `server.py`'s `generate_pipeline_key` method, not by individual workflow files
- The pattern `Profile + workflow + Next Number` is a convention implemented in `server.py`'s `generate_pipeline_key` method
- Workflow files like `500_hello_workflow.py` just use this central method to get and display the key

This centralized approach ensures consistency across all workflows and makes it easy to manage workflow state and resumability.

---

Stay tuned for our next article, where we'll start adding real functionality to our URL opener plugin. For now, practice working with keys - they're your passport to mastering Pipulate workflows!
