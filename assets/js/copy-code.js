document.addEventListener('DOMContentLoaded', function() {
  // First, clean up any existing wrappers that might have been added incorrectly
  cleanupExistingWrappers();
  
  // These are the exact commands we want to make copyable
  const targetCommands = [
    'curl --proto \'=https\' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install',
    'curl -L https://pipulate.com/install.sh | sh -s Botifython',
    'cd ~/Botifython && nix develop'
  ];
  
  // Find all bash code blocks (more specific selector to target only code blocks)
  const codeBlocks = document.querySelectorAll('div.language-bash pre.highlight code');
  
  codeBlocks.forEach(function(block) {
    const commandText = block.textContent.trim();
    
    // Only make the specific commands copyable
    if (targetCommands.includes(commandText)) {
      // Get the parent elements - we need to go up to the div.language-bash
      const preElement = block.parentElement;
      const bashDivElement = preElement.parentElement;
      
      // Check if we've already wrapped this element (prevent duplicate wrappers)
      if (bashDivElement.parentElement.classList.contains('code-block-wrapper')) {
        return; // Skip if already processed
      }
      
      // Create a wrapper div
      const wrapper = document.createElement('div');
      wrapper.className = 'code-block-wrapper';
      
      // Insert the wrapper before the bash div element
      bashDivElement.parentNode.insertBefore(wrapper, bashDivElement);
      
      // Move the bash div element into the wrapper
      wrapper.appendChild(bashDivElement);
      
      // Add the copy button
      const copyButton = document.createElement('button');
      copyButton.className = 'copy-button';
      copyButton.setAttribute('aria-label', 'Copy to clipboard');
      copyButton.setAttribute('title', 'Copy to clipboard');
      wrapper.appendChild(copyButton);
      
      // Add tooltip for "Copied!" feedback
      const tooltip = document.createElement('span');
      tooltip.className = 'copied-tooltip';
      tooltip.textContent = 'Copied!';
      wrapper.appendChild(tooltip);
      
      // Add click event listener to the button
      copyButton.addEventListener('click', function(e) {
        e.preventDefault();
        e.stopPropagation();
        
        copyToClipboard(commandText);
        
        // Add copied class temporarily for visual feedback
        this.classList.add('copied');
        tooltip.classList.add('show');
        
        setTimeout(() => {
          this.classList.remove('copied');
          tooltip.classList.remove('show');
        }, 2000);
      });
    }
  });
  
  // Function to clean up existing wrappers that might have been added incorrectly
  function cleanupExistingWrappers() {
    // Check if main element has copy buttons directly attached
    const mainElement = document.querySelector('main');
    if (mainElement) {
      // Check if main is wrapped in code-block-wrapper
      let parent = mainElement.parentElement;
      while (parent && parent !== document.body) {
        if (parent.classList.contains('code-block-wrapper')) {
          // Unwrap the main element
          const grandparent = parent.parentElement;
          grandparent.insertBefore(mainElement, parent);
          
          // Remove any copy buttons and tooltips
          const buttons = parent.querySelectorAll('.copy-button');
          const tooltips = parent.querySelectorAll('.copied-tooltip');
          
          // Remove the wrapper
          if (grandparent.contains(parent)) {
            grandparent.removeChild(parent);
          }
          
          // Start over from the beginning since the DOM structure changed
          return cleanupExistingWrappers();
        }
        parent = parent.parentElement;
      }
      
      // Look for any copy buttons directly attached to main
      const mainButtons = mainElement.querySelectorAll(':scope > .copy-button');
      const mainTooltips = mainElement.querySelectorAll(':scope > .copied-tooltip');
      
      mainButtons.forEach(button => button.parentElement.removeChild(button));
      mainTooltips.forEach(tooltip => tooltip.parentElement.removeChild(tooltip));
    }
    
    // Look for any nested code-block-wrappers and fix them
    const nestedWrappers = document.querySelectorAll('.code-block-wrapper .code-block-wrapper');
    if (nestedWrappers.length > 0) {
      nestedWrappers.forEach(wrapper => {
        const parent = wrapper.parentElement;
        // Only process if parent is also a code-block-wrapper
        if (parent.classList.contains('code-block-wrapper')) {
          // Move all children to the parent wrapper
          while (wrapper.firstChild) {
            parent.insertBefore(wrapper.firstChild, wrapper);
          }
          // Remove the inner wrapper
          parent.removeChild(wrapper);
        }
      });
      // Start over from the beginning since the DOM structure changed
      return cleanupExistingWrappers();
    }
    
    // Remove any duplicate buttons and tooltips
    document.querySelectorAll('.code-block-wrapper').forEach(wrapper => {
      const buttons = wrapper.querySelectorAll('.copy-button');
      const tooltips = wrapper.querySelectorAll('.copied-tooltip');
      
      // Keep only the first button and tooltip
      for (let i = 1; i < buttons.length; i++) {
        buttons[i].parentElement.removeChild(buttons[i]);
      }
      
      for (let i = 1; i < tooltips.length; i++) {
        tooltips[i].parentElement.removeChild(tooltips[i]);
      }
    });
  }
  
  // Function to copy text to clipboard
  function copyToClipboard(text) {
    // Try to use the newer Clipboard API if available
    if (navigator.clipboard && navigator.clipboard.writeText) {
      navigator.clipboard.writeText(text)
        .catch(err => {
          console.error('Failed to copy text: ', err);
          fallbackCopyToClipboard(text);
        });
    } else {
      fallbackCopyToClipboard(text);
    }
  }
  
  // Fallback copy method for older browsers
  function fallbackCopyToClipboard(text) {
    const textarea = document.createElement('textarea');
    textarea.value = text;
    textarea.setAttribute('readonly', '');
    textarea.style.position = 'absolute';
    textarea.style.left = '-9999px';
    document.body.appendChild(textarea);
    
    // Check if there's any text selection currently
    const selected = document.getSelection().rangeCount > 0 
      ? document.getSelection().getRangeAt(0)
      : false;
    
    textarea.select();
    document.execCommand('copy');
    document.body.removeChild(textarea);
    
    // Restore the original selection if there was one
    if (selected) {
      document.getSelection().removeAllRanges();
      document.getSelection().addRange(selected);
    }
  }
}); 