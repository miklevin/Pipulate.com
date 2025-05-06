document.addEventListener('DOMContentLoaded', function() {
  // These are the exact commands we want to make copyable
  const targetCommands = [
    'curl --proto \'=https\' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install',
    'curl -L https://pipulate.com/install.sh | sh -s Botifython',
    'cd ~/Botifython && nix develop'
  ];
  
  // Find all bash code blocks
  const codeBlocks = document.querySelectorAll('.language-bash');
  
  codeBlocks.forEach(function(block) {
    const commandText = block.textContent.trim();
    
    // Only make the specific commands copyable
    if (targetCommands.includes(commandText)) {
      // Get the parent (pre) element
      const preElement = block.parentElement;
      
      // Create a wrapper div
      const wrapper = document.createElement('div');
      wrapper.className = 'code-block-wrapper';
      
      // Insert the wrapper before the pre element
      preElement.parentNode.insertBefore(wrapper, preElement);
      
      // Move the pre element into the wrapper
      wrapper.appendChild(preElement);
      
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