---
layout: post
title: Putting The Polish On Workflows
description: Workflows are experiences. Design them like performance art with a local LLM collaborator. Delight the human user/audience!
group: guide
layout: post
---

# WET Workflow Conventions: Emoji, Messaging, and User Experience Patterns

Based on the Botify Trifecta workflow implementation, this document outlines the conventions and patterns that have emerged for creating effective, user-friendly WET (Write Everything Twice) workflows in the Pipulate framework.

## Emoji Usage Conventions

### Message Queue Emojis
Emojis in the message queue serve as visual anchors that help users quickly understand the type and status of operations:

**Process Status Indicators:**
- 🔍 **Discovery/Analysis**: Finding optimal parameters, analyzing data
- 🎯 **Success/Found**: Successful completion, optimal values found
- ⚠️ **Warnings**: Non-critical issues, proceeding with caution
- ❌ **Errors**: Critical failures, operation stopped
- ✅ **Completion**: Final success confirmation

**Data Type Indicators:**
- 📊 **Analytics/Metrics**: Data analysis, performance metrics
- 🔗 **Links/Connections**: Link graphs, internal linking
- 📄 **Content/Pages**: Page attributes, content analysis
- 🔍 **Search**: Search Console data, keyword analysis

**Action Indicators:**
- ⬇️ **Downloads**: File downloads, CSV exports
- 📂 **File Operations**: Folder access, file management
- 🐍 **Code**: Python code generation, API debugging
- 🔄 **Processing**: Background operations, API calls

### Button Label Emojis
Consistent emoji usage in button labels improves visual scanning:

```python
UI_CONSTANTS = {
    'BUTTON_LABELS': {
        'HIDE_SHOW_CODE': '🐍 Hide/Show Code',
        'VIEW_FOLDER': '📂 View Folder', 
        'DOWNLOAD_CSV': '⬇️ Download CSV'
    }
}
```

## Message Queue Flow Patterns

### Progressive Feedback Pattern
The message queue should provide continuous feedback during long operations:

```python
# Initial status
await self.pipulate.message_queue.put(username, "🔍 Finding optimal depth for Link Graph Edges...")

# Progress updates
await self.pipulate.message_queue.put(username, f"Testing depth {depth}: {metric_value:,} edges")

# Final result
await self.pipulate.message_queue.put(username, f"🎯 Optimal depth for Link Graph: {optimal_depth} (for {final_count:,} edges).")
```

### Error Handling in Messages
Clear, actionable error messages with appropriate emojis:

```python
# Specific error context
await self.pipulate.message_queue.put(username, f"❌ API Error: {error_details}")

# Recovery suggestions
await self.pipulate.message_queue.put(username, "⚠️ Retrying with fallback parameters...")
```

## Template-Driven UI Patterns

### Dynamic User Messages
Templates should include user-facing messages that explain what will happen:

```python
QUERY_TEMPLATES = {
    'Template Name': {
        'user_message': 'This will download X data including Y and Z fields.',
        'button_label_suffix': 'Descriptive Action',
        # ... other config
    }
}
```

### Qualifier Configuration Pattern
For templates that need prerequisite queries to optimize parameters:

```python
'qualifier_config': {
    'enabled': True,
    'user_message_running': '🔍 Finding optimal parameters...',
    'user_message_found': '🎯 Optimal value: {param_value} (for {metric_value:,} items).',
    'user_message_threshold_exceeded': '⚠️ Warning: Large dataset detected. Proceeding with caution.'
}
```

## Chain Reaction Pattern Conventions

### Step Progression
Each step should follow the standard pattern for reliable progression:

```python
async def step_N_submit(self, request):
    # Process form data
    # Store results
    # Provide user feedback
    
    # Return revert control + next step trigger
    return Div(
        self._create_revert_control(request, f"step_{N}"),
        Div(id=f"step_{N+1}", hx_get=f"/{self.APP_NAME}/step_{N+1}", hx_trigger="load")
    )
```

### Background Processing Pattern
For long-running operations, use Script tags with htmx.ajax:

```python
{% raw %}return Div(
    P("🔄 Processing in background..."),
    Script(f"""
        htmx.ajax('POST', '/{self.APP_NAME}/step_N_process', {
            values: {{'pipeline_id': '{pipeline_id}'}},
            target: '#step_N',
            swap: 'outerHTML'
        }});
    """)
){{% endraw %}
```

## File Management Conventions

### Deterministic File Paths
Use consistent, predictable file naming:

```python
async def get_deterministic_filepath(self, username, project_name, analysis_slug, data_type=None):
    safe_project = re.sub(r'[^\w\-_]', '_', project_name)
    safe_analysis = re.sub(r'[^\w\-_]', '_', analysis_slug)
    
    if data_type:
        filename = f"{safe_project}_{safe_analysis}_{data_type}.csv"
    else:
        filename = f"{safe_project}_{safe_analysis}.csv"
    
    return f"downloads/{username}/{filename}"
```

### Cache-Aware Button Text
Buttons should reflect file availability:

```python
async def check_cached_file_for_button_text(self, username, project_name, analysis_slug, data_type):
    filepath = await self.get_deterministic_filepath(username, project_name, analysis_slug, data_type)
    if await self.check_file_exists(filepath):
        return f"⬇️ Download Cached {data_type.title()}"
    else:
        return f"📊 Generate {data_type.title()}"
```

## Code Generation Patterns

### Jupyter-Friendly Output
Generated code should be optimized for notebook debugging:

```python
def _generate_api_call_representations(self, method, url, headers, payload=None, step_context=None):
    # Generate both curl and Python requests versions
    # Include proper error handling
    # Add explanatory comments
    # Format for easy copying
```

### Syntax Highlighting Integration
When displaying code, ensure proper highlighting:

```python
Pre(
    Code(python_code, cls="language-python"),
    style="max-height: 400px; overflow-y: auto;"
)
```

## Error Handling Conventions

### Graceful Degradation
Always provide fallback behavior:

```python
try:
    optimal_value = await self._execute_qualifier_logic(...)
except Exception as e:
    await self.pipulate.message_queue.put(username, f"⚠️ Qualifier failed: {str(e)}. Using default value.")
    optimal_value = default_value
```

### User-Friendly Error Messages
Transform technical errors into actionable feedback:

```python
if "404" in str(error):
    message = "❌ Project not found. Please check your project URL."
elif "401" in str(error):
    message = "❌ Authentication failed. Please check your API token."
else:
    message = f"❌ Unexpected error: {str(error)}"
```

## State Management Patterns

### Consistent State Structure
Use predictable state keys across workflows:

```python
state_update = {
    'username': username,
    'project_name': project_name,
    'analysis_slug': analysis_slug,
    'template_config': template_config,
    'dynamic_parameters': dynamic_params
}
```

### Template Configuration Storage
Store template choices for later use:

```python
await self.pipulate.db.set_state(
    pipeline_id, 
    'template_config', 
    {
        'crawl_template': selected_template,
        'gsc_template': 'GSC Performance'
    }
)
```

These conventions ensure consistent user experience across all WET workflows while maintaining the explicit, debuggable nature that makes WET patterns effective for complex data processing pipelines.


Perfect! I've created both the article and the corresponding Cursor rule document. The rule document is now available at `.cursor/rules/wet_workflow_conventions.mdc` and will help guide future development of WET workflows in the Pipulate framework.

## Key Highlights of the Document

**Emoji Conventions:**
- 🔍 for discovery/analysis phases
- 🎯 for successful completion
- ⚠️ for warnings
- ❌ for errors
- ✅ for final completion
- 📊 for analytics/metrics
- 🔗 for links/connections
- ⬇️ for downloads
- 📂 for file operations
- 🐍 for code generation

**Message Queue Patterns:**
- Progressive feedback during long operations
- Clear error handling with actionable messages
- Consistent emoji usage for visual anchoring

**Template-Driven UI:**
- Dynamic user messages explaining what will happen
- Qualifier configuration patterns for prerequisite queries
- Cache-aware button text that reflects file availability

**Chain Reaction Patterns:**
- Standard step progression with revert controls
- Background processing patterns for long operations
- Consistent state management structures

This document will serve as a reference for updating other WET workflows to follow these established conventions, ensuring a consistent and user-friendly experience across the entire Pipulate framework. The conventions are based on real-world usage patterns that have proven effective in the Botify Trifecta workflow.

---

## Hello Workflow Snazzied Up

> And when the rules of this document are applied to the previously boring
> `Hello Workflow` we get:

**Claude 4**: I'll polish the Hello Workflow to follow the WET workflow conventions we've established. Let me analyze the current implementation and apply the emoji, messaging, and UX patterns.

Read file: pipulate/plugins/500_hello_workflow.py
Now let me read the rest of the file to see the complete implementation:

Read file: pipulate/plugins/500_hello_workflow.py

Read file: pipulate/plugins/500_hello_workflow.py
Now I'll polish the Hello Workflow to follow the WET workflow conventions. The main areas that need improvement are:

1. **Emoji Usage**: Add consistent emojis for process status, data types, and actions
2. **Message Queue Flow**: Improve progressive feedback with proper emoji conventions
3. **UI Constants**: Centralize button labels and styles
4. **Error Handling**: Use emoji conventions for error messages
5. **State Management**: Follow consistent patterns


Perfect! I've successfully polished the Hello Workflow to follow the WET workflow conventions. Here's a summary of the key improvements made:

## 🎯 Key Improvements Applied

### 1. **UI Constants Structure**
- Added centralized `UI_CONSTANTS` dictionary with:
  - **Button Labels**: Consistent emoji-enhanced labels (`🔑 Enter Key`, `▶️ Next Step`, `🔒 Finalize`, `🔓 Unlock`)
  - **Button Styles**: Standardized CSS classes (`primary`, `secondary`, `secondary outline`)
  - **Emoji Categories**: Organized by purpose (Process Status, Data Types, Actions)

### 2. **Emoji Usage Conventions**
- **Process Status**: `🎯` for success, `⚠️` for warnings, `❌` for errors, `🔒`/`🔓` for locked/unlocked states
- **Data Types**: `👤` for user input, `💬` for greetings, `🔄` for workflow processes
- **Actions**: `📝` for input forms, `▶️` for next steps

### 3. **Enhanced Message Queue Flow**
- **Progressive Feedback**: All status changes now include appropriate emojis
- **Error Handling**: Consistent emoji prefixes for error messages
- **State Changes**: Clear visual indicators for workflow progression

### 4. **Improved User Experience**
- **Consistent Button Labels**: All buttons now use centralized constants
- **Better Visual Hierarchy**: Emojis provide instant context recognition
- **Enhanced Feedback**: Users get clear, emoji-enhanced status updates

### 5. **Code Organization**
- **Centralized Constants**: Easy to maintain and update UI elements
- **Consistent Patterns**: Follows the same conventions as Botify Trifecta
- **Better Documentation**: Comments explain the emoji categorization system

## 🔄 Before vs After Examples

**Before:**
```python
'ready': 'All steps complete. Ready to finalize workflow.'
```

**After:**
```python
'ready': f'{self.UI_CONSTANTS["EMOJIS"]["SUCCESS"]} All steps complete. Ready to finalize workflow.'
```

**Before:**
```python
button_label='Next ▸'
```

**After:**
```python
button_label=self.UI_CONSTANTS['BUTTON_LABELS']['NEXT_STEP']  # ▶️ Next Step
```

The Hello Workflow now serves as an excellent template that demonstrates all the WET workflow conventions, making it easier for developers to create consistent, user-friendly workflows throughout the Pipulate framework. The emoji system provides immediate visual context while maintaining the explicit, debuggable nature that makes WET patterns effective.


