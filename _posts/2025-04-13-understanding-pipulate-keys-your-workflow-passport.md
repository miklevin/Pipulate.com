---
title: "Understanding Pipulate Keys: Your Workflow Passport"
description: "Master Pipulate's clever key system - the invisible thread that ties your workflows together, making them interruptible, resumable, and always ready to pick up exactly where you left off."
author: Mike Levin
group: blog
---

Every Pipulate workflow starts with a key. It's that text field at the top of every workflow, and while it might seem like just another form field to fill out, it's actually one of Pipulate's most clever features. Let's demystify it.

## What Are Workflow Keys?

Think of a workflow key as a passport for your workflow instance. It's a unique identifier that:
- Tracks your workflow's state
- Lets you resume exactly where you left off
- Groups related data together
- Makes workflows interruptible and resumable

A typical key looks something like this:
```
default-url_opener-001
```

This is actually a composite key containing three parts:
1. Your current profile (`default`)
2. The workflow type (`url_opener`)
3. A run number (`001`)

## The Magic of Auto-Generation

Here's the beautiful part: you never have to think about creating these keys. Pipulate handles it all for you in two different ways:

### New Workflow Access
When you first access a workflow through:
- The dropdown menu
- Direct URL navigation
- A redirect from another workflow

Pipulate automatically generates a fresh key for you. No user action required - it just works!

### Mid-Workflow Reset
If you're already in a workflow and want to start fresh:
1. Click the "x" in the key field to clear it
2. Hit Enter
3. Pipulate generates the next available key
4. Hit Enter again to start your workflow

That's it! Two Enter keypresses and you're running a new workflow instance.

## Resuming Where You Left Off

The real power of the key system shows when you're in the middle of a workflow:

1. Hit Enter on the key field anytime
2. You're instantly back where you left off
3. No data lost, no state confusion
4. Perfect for long-running workflows

This is possible because Pipulate is always in an "interrupted" state - each step is a discrete operation, tied together by your workflow key.

## Finding Past Workflows

Need to pull up a previous workflow? The key field doubles as a smart search:

1. Clear the key field (click the "x")
2. Start typing - or just wait
3. A dropdown appears showing all your past workflows
4. Select any one to resume exactly where you left it

The key field acts as a filter - type any part of a key to find matching workflows.

## Power User Tips

Once you're comfortable with the basics, here are some pro moves:

### Quick New Instance
Instead of clearing the field:
1. Backspace the last digit of the current key
2. Type the next number in sequence
3. Hit Enter once
4. You've created a new workflow instance!

### Smart Filtering
- The dropdown only appears when the key field isn't an exact match
- Use this to your advantage when searching
- Type partial keys to see all matching workflows
- Perfect for finding all runs of a specific workflow type

### Always Interruptible
Because of how the key system works:
- Every workflow step saves state
- You can close your browser anytime
- Come back later and hit Enter
- You're right back where you were

### Key Generation Strategy
Remember:
- New endpoint access = automatic fresh key
- Mid-workflow reset = manual "x" + double Enter
- This dual behavior prevents accidental resets
- Keeps your workflow state predictable

## Behind the Scenes

While the keys look like composite database keys (and work similarly), they're actually simple text fields. This design choice means:
- No complex database relationships needed
- Easy to understand and debug
- Simple to extend for special cases
- Perfect for workflow state management

## Special Cases

While most workflows use the auto-generated keys, some special workflows might use meaningful keys:
- API connection workflows might use API keys
- Integration workflows might use external IDs
- But these are edge cases - generally, let Pipulate handle keys for you

## The Chain Reaction Connection

The key system is deeply integrated with Pipulate's HTMX chain reaction pattern:
- Each step transition preserves the key
- The key is used to maintain state
- This creates the "Run All Cells" behavior
- But with perfect interruptibility

## Best Practices

1. Let Pipulate generate keys for you
2. Use the "x" and Enter method for new workflows
3. Keep the key field handy for quick resumption
4. Use partial key search to find past workflows
5. Trust the system to maintain your state

## Why This Matters

This key system is a perfect example of Pipulate's philosophy:
- Make complex things simple
- Preserve state naturally
- Create consistent behaviors
- Reduce cognitive load

You never have to think about saving state, managing workflow instances, or tracking progress. The key system handles it all, letting you focus on your actual work.

Stay tuned for our next article, where we'll start adding real functionality to our URL opener plugin. For now, practice working with keys - they're your passport to mastering Pipulate workflows! 
