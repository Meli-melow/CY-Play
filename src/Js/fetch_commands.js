
// Fetch the commands from the server
  fetch('/src/php/fetch_commands.php')
    .then(response => response.json())
    .then(data => {
      console.log(data);
      // Process the received JSON data here
      if (data!==null ) {
        // Get the div that will contain the commands that's inside the basket-button
        const commandContainer = document.querySelector('.basket-button .dropdown-content');

        // Clear the innerHtml of the div
        commandContainer.innerHTML = '';

        if(data.length === 0) {
          const liElement = document.createElement('li');
          liElement.textContent = 'No commands yet';
          commandContainer.appendChild(liElement);
        }
  
        data.forEach(command => {
            const liElement = document.createElement('li');
            liElement.id = 'commnad_id';
          const spanElement = document.createElement('span');
          spanElement.textContent = `${command.product.name}`;
          liElement.appendChild(spanElement);
          commandContainer.appendChild(liElement);
        });
      }
    })
    .catch(error => {
      // Handle any errors that occurred during the request
      console.error('Error:', error);
    });

    //if the data is not empty, then change remove the innerhtml of the div and add the data as li span containing the command name and the description
    
