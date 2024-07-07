/* // get the element with id  "addProduct"
const addProduct = document.getElementById("addProduct");

// get the product id element
const product_id = document.getElementById("productid");

// on click fetch the php file "addProduct.php" and send the data to it

addProduct.addEventListener("click", async function () {
  try {
    const response = await fetch("/src/php/addProduct.php", {
      method: "POST",
      credentials: "same-origin",
      body: new FormData(product_id),
    });

    if (response.status) {
      alert(response.message);
    }
  } catch (error) {
    console.error(error);
  }
}
);
 */



// Get the button element with id "addProduct"
const addProduct = document.getElementById("addProduct");

// Get the product id element
const product_id = document.getElementById("productid");

const id = product_id.innerHTML;

// Attach an event listener to the button for the click event
addProduct.addEventListener("click", async function () {
  try {
    console.log(product_id.innerHTML);
    const formData = new FormData(); // Create a new FormData object
    formData.append('product_id', id); // Append the product_id value to the FormData object

    const response = await fetch("/src/php/addProduct.php", {
      method: "POST",
      credentials: "same-origin",
      body: formData,
    });

    const responseData = await response.json(); // Assuming the server responds with JSON

    if (response.ok) {
      alert(responseData.message); // Display server response message
    } else {
      throw new Error(responseData.message); // Throw an error if the response is not ok
    }
  } catch (error) {
    console.error('Fetch error:', error.message);
  }
});
