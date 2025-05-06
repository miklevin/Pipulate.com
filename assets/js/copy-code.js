document.addEventListener('DOMContentLoaded', function() {
  // Add the copyable class to all code blocks that have the copyable class set
  const codeBlocks = document.querySelectorAll('.language-bash');
  
  codeBlocks.forEach(function(block) {
    // Only add the class to specific installation command blocks
    const commandText = block.textContent.trim();
    if (
      commandText.includes('install.determinate.systems/nix') || 
      commandText.includes('pipulate.com/install.sh') ||
      commandText.startsWith('cd ~/') && commandText.includes('nix develop')
    ) {
      block.parentElement.classList.add('copyable');
      
      // Add click event listener
      block.parentElement.addEventListener('click', function() {
        copyToClipboard(commandText);
        
        // Add copied class temporarily for visual feedback
        this.classList.add('copied');
        setTimeout(() => {
          this.classList.remove('copied');
        }, 2000);
      });
    }
  });
  
  // Function to copy text to clipboard
  function copyToClipboard(text) {
    // Create a temporary textarea element
    const textarea = document.createElement('textarea');
    textarea.value = text;
    textarea.setAttribute('readonly', '');
    textarea.style.position = 'absolute';
    textarea.style.left = '-9999px';
    document.body.appendChild(textarea);
    
    // Select and copy the text
    textarea.select();
    document.execCommand('copy');
    
    // Clean up
    document.body.removeChild(textarea);
  }
}); 