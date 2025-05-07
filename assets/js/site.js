// Function to set a cookie
function setCookie(name, value, days) {
    const expires = new Date();
    expires.setTime(expires.getTime() + (days * 24 * 60 * 60 * 1000));
    document.cookie = name + '=' + value + ';expires=' + expires.toUTCString() + ';path=/';
}

// Function to get a cookie
function getCookie(name) {
    const nameEQ = name + "=";
    const ca = document.cookie.split(';');
    for(let i = 0; i < ca.length; i++) {
        let c = ca[i];
        while (c.charAt(0) == ' ') c = c.substring(1, c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
    }
    return null;
}

// Function to check if device is mobile
function isMobile() {
    return window.innerWidth <= 768;
}

// CRITICAL: Initialize width IMMEDIATELY (no waiting for DOM) to prevent slider 'pop'
(function() {
    // Absolute min/max constraints that cannot be violated
    const ABSOLUTE_MIN_WIDTH = 850;
    
    // Get the stored width with proper constraints
    let storedWidth = parseInt(getCookie('containerWidth') || ABSOLUTE_MIN_WIDTH);
    
    // Enforce minimum width
    storedWidth = Math.max(storedWidth, ABSOLUTE_MIN_WIDTH);
    
    // Set the CSS variable for other calculations
    document.documentElement.style.setProperty('--slider-width', storedWidth + 'px');
    
    // Inject a style tag to immediately set container width
    const style = document.createElement('style');
    style.textContent = isMobile() 
        ? `.container { max-width: 100% !important; width: 100% !important; }`
        : `.container { max-width: ${storedWidth}px !important; width: ${storedWidth}px !important; }`;
    document.head.appendChild(style);
    
    // Set up an onload handler to immediately set the slider value as soon as it exists
    window.addEventListener('load', function() {
        const slider = document.getElementById('widthSlider');
        if (slider) {
            slider.value = storedWidth;
            slider.min = ABSOLUTE_MIN_WIDTH;
            slider.max = window.innerWidth;
            // Hide slider on mobile
            if (isMobile()) {
                slider.parentElement.style.display = 'none';
            }
        }
    });
})();

document.addEventListener('DOMContentLoaded', function() {
    // Constants for constraints
    const MIN_WIDTH = 850; // Absolute minimum width
    
    const widthSlider = document.getElementById('widthSlider');
    const containers = document.querySelectorAll('.container');
    const sliderContainer = document.getElementById('widthSliderContainer');
    
    // Get the stored width with proper constraints
    let storedWidth = parseInt(getCookie('containerWidth') || MIN_WIDTH);
    storedWidth = Math.max(storedWidth, MIN_WIDTH);
    
    // Set slider attributes and value
    if (widthSlider) {
        // Hard-code the min attribute
        widthSlider.min = MIN_WIDTH;
        
        // Set the max to current viewport width
        widthSlider.max = window.innerWidth;
        
        // Set the value with constraints
        widthSlider.value = Math.min(Math.max(storedWidth, MIN_WIDTH), window.innerWidth);
        
        // Hide slider on mobile
        if (isMobile()) {
            sliderContainer.style.display = 'none';
        }
    }
    
    function updateSliderMaxWidth() {
        // Only run this on mobile
        if (isMobile()) {
            if (sliderContainer) {
                sliderContainer.style.display = 'none';
            }
            containers.forEach(container => {
                container.style.cssText = 'max-width: 100% !important; width: 100% !important;';
            });
            return;
        }

        // Show slider on desktop
        if (sliderContainer && containers[0]) {
            sliderContainer.style.display = 'block';
            // Match the slider container width to the content container
            sliderContainer.style.width = containers[0].offsetWidth + 'px';
        }

        // Always use full viewport width as maximum
        const maxWidth = window.innerWidth;
        
        // Set slider's max value
        if (widthSlider) {
            // Always update max to current viewport width
            widthSlider.max = maxWidth;
            
            // Ensure value is within min/max bounds
            const currentValue = parseInt(widthSlider.value);
            if (currentValue > maxWidth) {
                widthSlider.value = maxWidth;
                updateContainersWidth(maxWidth);
                setCookie('containerWidth', maxWidth, 30);
            } else if (currentValue < MIN_WIDTH) {
                widthSlider.value = MIN_WIDTH;
                updateContainersWidth(MIN_WIDTH);
                setCookie('containerWidth', MIN_WIDTH, 30);
            }
        }
    }
    
    // Function to update all container widths in real-time
    function updateContainersWidth(width) {
        if (isMobile()) {
            // On mobile, always use 100% width
            containers.forEach(container => {
                container.style.cssText = 'max-width: 100% !important; width: 100% !important;';
            });
            return;
        }
        
        // Enforce constraints for desktop
        width = Math.min(Math.max(parseInt(width), MIN_WIDTH), window.innerWidth);
        
        // Apply width to all containers with !important to force immediate update
        containers.forEach(container => {
            container.style.cssText = `max-width: ${width}px !important; width: ${width}px !important;`;
        });
        
        // Update slider container width to match content
        if (sliderContainer && containers[0]) {
            sliderContainer.style.width = containers[0].offsetWidth + 'px';
        }
        
        // Update CSS variable for width calculations
        document.documentElement.style.setProperty('--slider-width', width + 'px');
    }

    // Update on page load
    updateSliderMaxWidth();

    // Update when window is resized - CRITICAL for maintaining proper max width
    let resizeTimer;
    window.addEventListener('resize', function() {
        // Clear any pending timer
        clearTimeout(resizeTimer);
        
        // Immediately update based on mobile/desktop
        if (isMobile()) {
            updateSliderMaxWidth();
        } else {
            // Update the slider's max attribute to new viewport width
            if (widthSlider) {
                widthSlider.max = window.innerWidth;
                
                // If current value exceeds new max, constrain it
                if (parseInt(widthSlider.value) > window.innerWidth) {
                    widthSlider.value = window.innerWidth;
                    updateContainersWidth(window.innerWidth);
                    setCookie('containerWidth', window.innerWidth, 30);
                }
            }
        }
        
        // Delayed full update
        resizeTimer = setTimeout(function() {
            updateSliderMaxWidth();
        }, 250);
    });

    // CRITICAL: Handle slider changes with immediate feedback
    if (widthSlider) {
        // Real-time updates for 'input' events (while dragging)
        widthSlider.addEventListener('input', function(e) {
            if (!isMobile()) {
                // Get the current slider value with constraints
                const newWidth = Math.min(
                    Math.max(parseInt(this.value), MIN_WIDTH), 
                    window.innerWidth
                );
                
                // Force immediate DOM update for real-time resizing
                updateContainersWidth(newWidth);
                
                // Also update slider container immediately to match
                if (sliderContainer && containers[0]) {
                    sliderContainer.style.width = containers[0].offsetWidth + 'px';
                }
            }
        });
        
        // Save cookie on 'change' event (when slider is released)
        widthSlider.addEventListener('change', function() {
            if (!isMobile()) {
                // Get the final value with constraints
                const finalWidth = Math.min(
                    Math.max(parseInt(this.value), MIN_WIDTH), 
                    window.innerWidth
                );
                
                // Ensure the slider value reflects any constraints
                this.value = finalWidth;
                
                // Save the new width value to the cookie when slider is released
                setCookie('containerWidth', finalWidth, 30);
                
                // Ensure containers have the final value
                updateContainersWidth(finalWidth);
            }
        });
    }
}); 