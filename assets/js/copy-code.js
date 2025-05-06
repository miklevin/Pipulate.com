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