document.addEventListener('DOMContentLoaded', function() {
    // Get the form element and other input elements
    var form = document.querySelector('form');
    var name = document.querySelector('#nom');
    var email = document.querySelector('#mail');
    var message = document.querySelector('#message');
    var prenom = document.querySelector('#prenom');
    var birthDateInput = document.querySelector('#naissance'); 
    var sujet = document.querySelector('#sujet');
    var contact_date = document.querySelector('#contact_date');
   
    var genre = document.querySelector('#genre');

    setEmpty(); 

    // Function to show alert
    function showAlert(field) {
        document.querySelector(`#alert-${field}`).style.display = 'inline-block';
    }

    // Function to hide alert
    function hideAlert(field) {
        document.querySelector(`#alert-${field}`).style.display = 'none';
    }

    // Function to set all previous element to empty
    function setEmpty() {
        name.value = '';
        email.value = '';
        message.value = '';
        prenom.value = '';
        birthDateInput.value = ''; // Now this refers to the element, not the initial value
        sujet.value = '';
    }

    // Function to validate birth date
    function validateBirthDate(birthDate) {
        if (!birthDate) return false; // Ensure there's a value to process
        const birthDateObj = new Date(birthDate);
        const currentDate = new Date();
        currentDate.setHours(0, 0, 0, 0); // Normalize current date to remove time part
        return birthDateObj <= currentDate;
    }

    // Add an event listener to the form
    form.addEventListener('submit', function(event) {
        event.preventDefault(); // Prevent the default form submission
        // Clears all fields, this might not be intended before validation checks

        let isValid = true;

        // Validate the form
        if(contact_date.value.trim() === ''){
            /* contact_date.style.display = 'inline-block'; */
            showAlert('contact_date');
            isValid = false;
        }
        else{
            hideAlert('contact_date');
            /* contact_date.style.display = 'none'; */
        }
        if (name.value.trim() === '') {
            showAlert('nom');
            isValid = false;
        } else {
            hideAlert('nom');
        }

        if (prenom.value.trim() === '') {
            showAlert('prenom');
            isValid = false;
        } else {
            hideAlert('prenom');
        }

        if (email.value.trim() === '') {
            showAlert('mail');
            isValid = false;
        } else {
            hideAlert('mail');
        }

        if (message.value.trim() === '') {
            showAlert('message');
            isValid = false;
        } else {
            hideAlert('message');
        }

        // Now retrieve the current value of the birth date input
        if (!validateBirthDate(birthDateInput.value)) {
            console.log(birthDateInput.value);
            showAlert('birth');
            isValid = false;
        } else {
            hideAlert('birth');
        }

        if(sujet.value.trim() === ''){
            showAlert('sujet');
            isValid = false;
        } else {
            hideAlert('sujet');
        }

        // Submit the form only if all validations pass
        if (isValid) {
            var data = {
            name: name.value,
            prenom: prenom.value,
            email: email.value,
            message: message.value,
            birthDate: birthDateInput.value,
            sujet: sujet.value
            };
            
            alert('votre message a bien été envoyé');
            window.location.href = "/src/modules/index.html";
            // form.submit(); // Uncomment to proceed with form submission
        }

        // Submit the form only if all validations pass
        if (isValid) {
            var data = {
                name: name.value,
                prenom: prenom.value,
                email: email.value,
                message: message.value,
                birthDate: birthDateInput.value,
                sujet: sujet.value
            };
            
            alert('votre mail est bien envoyer');
            window.location.href = "/src/modules/index.html";
            // form.submit(); // Uncomment to proceed with form submission
        }
    });
});



