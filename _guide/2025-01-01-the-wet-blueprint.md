---
title: "The WET Blueprint: Why Your Next App Should Repeat Itself"
description: "Challenging the DRY dogma: How AI and notebooks are revolutionizing development philosophy. Discover why explicit, repeated code (WET) is becoming the new standard for modern, AI-assisted development."
author: Mike Levin
group: guide
permalink: /guide/wet-blueprint/
meta_description: A revolutionary blueprint challenging DRY principles, arguing for WET (Write Everything Twice) workflows with Pipulate's local-first, AI-assisted development approach.
meta_keywords: WET vs DRY, Pipulate, FastHTML, HTMX, coding philosophy, AI-assisted development, local-first, Nix, code convection, Literate Programming, software architecture, developer productivity, Python web framework
layout: post
---

## The Local-First Revolution Meets AI-Assisted Development

In an era dominated by cloud subscriptions, vendor lock-in, and increasingly complex software stacks, a quiet revolution is taking place. It's a return to simplicity, but with modern tools that are actually more powerful than their predecessors. At the forefront of this movement is a new development philosophy that challenges one of programming's most sacred principles: **Don't Repeat Yourself (DRY)**.

This is the story of **WET** (Write Everything Twice) - a philosophy that embraces explicit, understandable code in the age of AI assistance. And it's the foundation upon which Pipulate is built.

## Setting the Stage: Why DRY is Dying

For decades, developers have been taught that repeating code is sin. The DRY principle became gospel, leading to complex abstractions, inheritance hierarchies, and systems so abstracted that understanding them requires a Computer Science degree.

But here's the thing: **the world has changed**.

We now have:
1. **Jupyter Notebooks** promoting Literate Programming
2. **AI assistants** that excel at managing repetitive code
3. **Local-first architectures** that prioritize clarity over enterprise complexity

These changes fundamentally alter the cost-benefit analysis of code organization.

## The WET Revolution: Explicit is Better Than Abstract

**WET** stands for:
- **Write Everything Twice** 
- **Write Explicitly/Thoughtfully**
- **We Enjoy Typing!** (when AI helps)

### The Sheet Music Analogy

Consider sheet music. If the DRY camp won out over sheet music, composers and musicians would have to flip pages in the middle of a performance to reference a previously-played stanza. Instead, sheet music repeats musical phrases for clarity and performance flow.

This is exactly what WET code does - it prioritizes **immediate clarity** over abstract efficiency.

### The Hardware Platform Revolution

Traditional development has been trapped in cloud-first thinking, but the future is local-first with AI assistance. Here's why WET workflows work now:

<!-- START_ASCII_ART: why-wet-works-now -->
### Why WET Works Now  <!-- key: why-wet-works-now -->

Traditional development follows DRY principles, creating abstract, complex systems that are hard to understand and modify. But the world has changed:

1. **🔬 Jupyter Notebooks** promote explicit, literate programming
2. **🤖 AI assistants** excel at managing repetitive code  
3. **🏠 Local-first architectures** prioritize clarity over enterprise complexity
4. **🎯 Right Granularity**: WET provides the perfect abstraction level for human AND AI comprehension

```
                               ________________________________
   - Like Notebooks           /                                \
   - Linear Workflows        |  It runs proprietary private AI  |
   - Local & Cloud-free      |  Workflows from your Local PC?!  |
   - Chip O'Theseus included  \________________________________/
                                                              ()   
        HARDWARE PLATFORM             LOCAL BROWSER             O   , Chip O'Theseus
     _______________________       __________ _______             o \\  . 
    |                       |     / Pipulate \Jupyter\__            |\\/|
    | Windows, Mac or Linux |    |  __________________  |   See!    / " '\ - Radical transparency
    |     _____ ___         |    | | App Name   Menu⚙️| |<- - - - -. .   . - MCP tool-call control
    |   _/ Nix \____\_____  |    | |------------------| |         /    ) | - Browser as bot's body
    |  |                  | |    | | Workflow | Local | |        '  _.'  |
    |  |     Pipulate    <---------> -Step #1 | AI🤖  | |        '-'/    \
    |__|  localhost:5001  |_|    | | -Step #2 | Chat  | |      What, no Docker?
       |  (AI on Rails🚂) |      | | -Step #3 | Help▸ | |      What, no React?
       |__________________|      | |__________|_______| |      What, no Cloud?
                                 |______________________| 
```

**WET workflows are:**
- **🔍 Observable**: See exactly what's happening at every step
- **🔧 Customizable**: Modify workflows without breaking abstractions
- **🤖 AI-Friendly**: Clear code that AI assistants can easily understand and maintain
- **🚀 Future-Proof**: Built on durable web standards that won't become obsolete
<!-- END_ASCII_ART: why-wet-works-now -->

**WET workflows are:**
- **🔍 Observable**: See exactly what's happening at every step
- **🔧 Customizable**: Modify workflows without breaking abstractions
- **🤖 AI-Friendly**: Clear code that AI assistants can easily understand and maintain
- **🚀 Future-Proof**: Built on durable web standards that won't become obsolete

### Why Notebooks Changed Everything

Jupyter Notebooks promote Literate Programming by embedding working code directly within documentation. But traditional DRY/OOP patterns don't work well in notebooks:

- **Complex inheritance hierarchies** confuse readers
- **Abstract dependencies** break when notebooks are moved
- **Hidden implementation details** reduce code legibility

Notebooks thrive on explicit, self-contained blocks of code that are easy to read and execute sequentially. This repetition isn't a bug - **it's a feature** that enhances readability and maintainability.

## How AI Makes WET Work: The Game Changer

The traditional pain point of WET was maintenance - changing one copy meant finding and updating all others. But AI fundamentally changes this equation:

### Easy Transplants with AI 🤖
- **Intelligent Refactoring**: AI performs context-aware search-and-replace operations
- **Code Generation**: AI generates variations of existing code blocks tailored to new requirements  
- **Semantic Understanding**: AI can update similar code blocks even when they're not exact textual duplicates

### Code Convection with AI ♻️
- **Enhanced Readability**: Explicit code is easier for AI to understand and work with
- **High Customizability**: WET code is less coupled, making it easier to modify for specific use cases
- **Continuous Modernization**: AI can scan and update WET code for outdated practices or security issues

## Pipulate: WET Philosophy in Action

Pipulate embodies this WET philosophy through its unique architecture:

### WET Workflows, DRY Framework

```python
# WET Workflow Example - Explicit and Clear
class MyWorkflow:
    def __init__(self):
        self.steps = [
            Step(id='step_01', done='first_field', show='First Step'),
            Step(id='step_02', done='second_field', show='Second Step'),
            # Each step is explicit and self-contained
        ]
    
    def step_01(self, request):
        # Explicit implementation - no hidden abstractions
        user_input = request.form.get('user_data')
        processed_data = self.process_step_one(user_input)
        self.pipulate.set_step_data(self.APP_NAME, 'first_field', processed_data)
        return self.render_step_complete()
```

This approach makes every step:
- **Observable**: You can see exactly what's happening
- **Testable**: Each step is a function you can test in isolation  
- **Debuggable**: No hidden magic or leaky abstractions
- **AI-Friendly**: Clear, explicit code that AI can easily understand and modify

### The Chain Reaction Pattern

Pipulate's workflows use a "chain reaction pattern" where each step explicitly triggers the next using HTMX:

```python
# Each completed step triggers the next
return Div(
    H3("Step 1 Complete ✅"),
    P(f"Processed: {data}"),
    
    # This triggers the next step automatically
    Div(
        id="step_02",
        hx_get=f"/{self.APP_NAME}/step_02",
        hx_trigger="load"
    ),
    id="step_01"
)
```

This ensures:
- **Reliable state progression**: Each step completion is explicit
- **Full observability**: State transitions are visible and debuggable
- **Resumable workflows**: You can interrupt and resume at any step

## The Technical Stack: Simplicity Meets Power

Pipulate's WET philosophy extends to its technology choices:

### FastHTML + HTMX: The New Web Stack
```python
# No template language - Python functions ARE the templates
@rt("/users")
def get_users():
    return Div(
        H1("User List"),
        *[Li(user.name) for user in users],
        hx_get="/refresh-users",
        hx_trigger="every 30s"
    )
```

This eliminates:
- **Template languages** (Jinja2, Liquid)
- **Build steps** and compilation
- **Client-side JavaScript frameworks**
- **Complex state management**

### Local-First Architecture
- **Your data** stays on your machine
- **Your AI** runs locally (Ollama integration)
- **Your environment** is reproducible (Nix Flakes)
- **Your workflows** are explicit and customizable

## The Broader Impact: A New Development Paradigm

This isn't just about code organization - it's about a fundamental shift in how we think about software development:

### From Cloud Dependencies to Local-First
- No API rate limits or costs
- Complete privacy and control
- Run intensive tasks 24/7
- Offline capability

### From Complex Frameworks to Simple Tools
- One person can understand the entire stack
- Debugging is intuitive
- Future-proofed with durable technologies

### From Vendor Lock-in to User Control
- Open source and self-hosted
- No subscription fatigue
- Export your data anytime
- Modify the code to your needs

## The Path Forward: Getting WET with Pipulate

The future of development is looking more like the past, but with AI capabilities that make it even better:

1. **Explicit Code**: Write workflows that are immediately understandable
2. **AI Assistance**: Let AI handle the "tedious" maintenance of repeated code
3. **Local Control**: Run everything on your own hardware
4. **Future-Proofing**: Use durable technologies that won't become obsolete

## Conclusion: The WET Blueprint for Success

The DRY principle served us well in an era of limited tooling and manual maintenance. But with AI assistance and local-first architectures, **explicit is better than abstract**.

WET code offers:
- **Immediate clarity** for human readers
- **Easy customization** for specific use cases  
- **AI-friendly structure** for automated maintenance
- **Robust debugging** with full observability

Pipulate proves that this philosophy works in practice. It's not just a development framework - it's a statement about how software should work in the age of AI.

**The future belongs to those who can read their own code.**  
**The future is WET.**

---

*Ready to get WET? [Install Pipulate](/install) and experience the future of local-first, AI-assisted development.* 
