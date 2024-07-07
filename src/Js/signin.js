document.getElementById('loginForm').addEventListener('submit', function(event) {
    event.preventDefault();
    // Step 1: Get form field values
    var email = document.getElementById('email').value;
    var password = document.getElementById('password').value;

    

    // Step 2: Check for empty fields
    if (!email || !password) {
        alert('All fields are required.');
        return; // Stop the function if any field is empty
    }

    // Step 3: Validate email format
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // Simple regex for email validation
    if (!emailRegex.test(email)) {
        alert('Please enter a valid email address.');
        return; // Stop the function if email is invalid
    }

    var formData = {email: email, password: password};

    console.log(typeof password);
    

    fetch('/src/php/loginUser.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(formData)
    })
    .then(response => response.json()) // Parse the response as JSON
    .then(data => {
        console.log('Response Data:', data); // Log the response data

        if (data.status) {
            // Redirect to home page
            window.location.href = '/src/modules/index.html';
        } else {
            // Handle error case
            console.log(data);
            alert('Combinaison email/mot de passe invalide. Veuillez réessayer.');
        }
    })
    .catch(error => {
        console.log('An error occurred:', error);
    });
});


window.onload = function() {
    // Everything is fully loaded now
    const logo = document.getElementById('cy-logo');
    

    if (logo) {
        logo.addEventListener('click', () => {
            window.location.href = 'index.html';
        });
    }
  
    const logoText = document.getElementById('cy-play-logo-Text');
    if (logoText) {
        logoText.addEventListener('click', () => {
            window.location.href = 'contact.html';
        });
    }

    const profpic = document.getElementById('profile-picture');

    if (profpic) {
        profpic.addEventListener('click', () => {
            window.location.href = 'signup.html';
        });
    }

    const profname = document.getElementById('account-name');

    if (profname) {
        profname.addEventListener('click', () => {
            window.location.href = 'signup.html';
        });
    }

  };