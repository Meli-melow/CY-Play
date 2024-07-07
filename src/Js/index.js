
window.onload = function() {
    // Everything is fully loaded now
    const logo = document.getElementById('cy-logo');
    

    if (logo) {
        logo.addEventListener('click', () => {
            window.location.href = '/src/modules/index.html';
        });
    }
  
    const logoText = document.getElementById('cy-play-logo-Text');
    if (logoText) {
        logoText.addEventListener('click', () => {
            window.location.href = '/src/modules/contact.html';
        });
    }

    const profpic = document.getElementById('profile-picture');

    if (profpic) {
        profpic.addEventListener('click', () => {
            window.location.href = '/src/modules/signup.html';
        });
    }

    const profname = document.getElementById('account-name');
    const logout = document.getElementById('logout');
    if (profname) {
        if (profname.textContent === 'Se connecter') {
            profname.addEventListener('click', () => {
                window.location.href = '/src/modules/signin.html';
            });
        }else{
            profname.addEventListener('click', () => {
                logout.style.display = 'block';
                
            });
        }
        profname.addEventListener('click', () => {
            /* window.location.href = 'signup.html'; */
        });
    }

  };

  
  // Initially hide all dropdowns
/* document.querySelectorAll('.skew-menu .dropdown-content').forEach(dropdown => {
    dropdown.style.display = 'none';
});

// Query all 'li' elements within elements with the class 'skew-menu'
document.querySelectorAll('.skew-menu li').forEach(item => {
    // Ensure event listeners are added only once
    if (!item.dataset.listenersAdded) {
        // Add a 'mouseenter' event listener to each 'li' element
        item.addEventListener('mouseenter', () => {
            // Find the '.dropdown-content' within the hovered 'li' and show it
            const dropdown = item.querySelector('.dropdown-content');
            dropdown.style.display = 'block';
        });

        // Function to hide dropdown
        const hideDropdown = () => {
            const dropdown = item.querySelector('.dropdown-content');
            // Set a timeout to allow for checking if the mouse is over the dropdown
            setTimeout(() => {
                if (!dropdown.matches(':hover') && !item.matches(':hover')) {
                    dropdown.style.display = 'none';
                }
            }, 10); // A small delay to ensure the hover state is accurately checked
        };

        // Add a 'mouseleave' event listener to the 'li' element and the dropdown content
        item.addEventListener('mouseleave', hideDropdown);
        item.querySelector('.dropdown-content').addEventListener('mouseleave', hideDropdown);

        // Mark this item as having event listeners added to avoid duplication
        item.dataset.listenersAdded = 'true';
    }
}); */



document.addEventListener("DOMContentLoaded", function() {
    var basketButton = document.querySelector('.basket-button');
    
    basketButton.addEventListener('mouseenter', function() {
        this.querySelector('.dropdown-content').style.display = "block";
    });

    basketButton.addEventListener('mouseleave', function() {
        this.querySelector('.dropdown-content').style.display = "none";
    });
});


document.querySelectorAll('.navigation-h1').forEach(item => {
    item.addEventListener('click', () => {
        // Construct the URL based on the data-name attribute
        const pageName = item.getAttribute('data-name').toLowerCase(); // Ensure it's lowercase
        const url = `/src/modules/${pageName}.html`; // Assuming the URL follows a simple pattern

        // Redirect to the constructed URL
        window.location.href = url;
    });
});


// make an event listener for the elements .title .description #product-image
/* document.addEventListener('DOMContentLoaded', () => {
    const productList = document.querySelector('.Product-list');
    productList.addEventListener('click', function(event) {
        const target = event.target;
        if (target.matches('.title') || target.matches('.description') || target.matches('#product-image')) {
            
            // Redirect to the product page
            window.location.href = 'product.html';
        }
    });
}); */