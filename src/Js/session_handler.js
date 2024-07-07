
    fetch('/src/php/session_data.php')
        .then(response => response.json())
        .then(data => {
            console.log('Session data:', data);
            console.log("Logged in user:", data.username);
            document.getElementById('account-name').textContent = data.username;
        })
        .catch(error => console.error('Error fetching session data:', error));
