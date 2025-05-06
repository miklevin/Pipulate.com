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

// Initialize width immediately before DOM content loads
const storedWidth = getCookie('containerWidth') || '850';
document.documentElement.style.setProperty('--slider-width', storedWidth + 'px');

document.addEventListener('DOMContentLoaded', function() {
    const widthSlider = document.getElementById('widthSlider');
    const containers = document.querySelectorAll('.container');
    const sliderContainer = document.getElementById('widthSliderContainer');
    
    // Set initial values immediately
    if (widthSlider) {
        widthSlider.value = storedWidth;
        // Set width by directly overriding CSS with !important to prevent other rules from interfering
        containers.forEach(container => {
            container.style.cssText = `max-width: ${storedWidth}px !important; width: ${storedWidth}px !important;`;
        });
    }
    
    function updateSliderMaxWidth() {
        // Only run this on desktop
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

        // Use viewport width as maximum (no artificial constraints)
        const maxWidth = window.innerWidth;
        
        // Set slider's max value
        if (widthSlider) {
            widthSlider.max = maxWidth;
            // If current value is greater than new max, update it
            if (parseInt(widthSlider.value) > maxWidth) {
                widthSlider.value = maxWidth;
                containers.forEach(container => {
                    container.style.cssText = `max-width: ${maxWidth}px !important; width: ${maxWidth}px !important;`;
                });
            }
        }
    }

    // Update on page load
    updateSliderMaxWidth();

    // Update when window is resized
    let resizeTimer;
    window.addEventListener('resize', function() {
        clearTimeout(resizeTimer);
        resizeTimer = setTimeout(function() {
            updateSliderMaxWidth();
        }, 250);
    });

    // Handle slider changes
    if (widthSlider) {
        widthSlider.addEventListener('input', function() {
            if (!isMobile()) {
                // Set width directly with !important to override any other styles
                const newWidth = this.value + 'px';
                containers.forEach(container => {
                    container.style.cssText = `max-width: ${newWidth} !important; width: ${newWidth} !important;`;
                });
                
                // Update slider container width to match content
                if (sliderContainer && containers[0]) {
                    sliderContainer.style.width = containers[0].offsetWidth + 'px';
                }
                
                // Update CSS variable for width calculations
                document.documentElement.style.setProperty('--slider-width', this.value + 'px');
                
                // Save the width to a cookie
                setCookie('containerWidth', this.value, 30);
            }
        });
    }
}); 