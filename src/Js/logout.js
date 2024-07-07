async function logout() {
  try {
    const response = await fetch('/src/php/logout.php', {
      method: 'POST',
      credentials: 'same-origin' // Include cookies in the request
    });

    if (response.status) {
      window.location.href = '/src/modules/signin.html';
    } else {
      throw new Error('Logout failed');
    }
  } catch (error) {
    console.error(error);
  }
}




// on click on element with id = logout call logout function
document.getElementById('logout').addEventListener('click', logout);