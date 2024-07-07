// function that fetches the product available in the data base using the product availible php file
function fetchProducts(category) {
  fetch(`/src/php/fetch_product.php?category=${encodeURIComponent(category)}`)
  .then(response => {
      if (!response.ok) {
          throw new Error('Network response was not ok');
      }
      return response.json();
  })
  .then(data => {
      const productList = document.querySelector('.Product-list');
      console.log(data)
      console.log(data.message);
      // Check if there is valid data
      if (data.message == "No products fonnd in this category") {
            productList.innerHTML = '';
            productList.innerHTML += `
            <div class="no-products">
                <h2>No products available in this category</h2>
            </div>
            `;  
            return;
        
      }else if (data.legnth !== 0 ) {
            // Clear the innerHtml of the div
          productList.innerHTML = ''; // Clear the list before adding new products
          data.forEach(productData => {
              productList.innerHTML += `
                  <li class="product">
                      <picture class="image">
                          <img id="product-image" src="${productData.imagelink}" alt="${productData.name}">
                      </picture>
                      <div class="info">
                          <h2 class="title">${productData.name}</h2>
                          <p class="description">${productData.description}</p>
                      </div>
                        <div class="price">
                            <p class = "price">${productData.price}&#8364;</p>
                        </div>
                        <div class = "id-product">${productData.id}</div>
                  </li>
              `;
          });
          
      }/* else{
        console.log("hey 2");
          productList.innerHTML = '';
          productList.innerHTML += `
          <div class="no-products">
              <h2>No products available in this category</h2>
          </div>
          `;
      } */
  })
  .catch(error => {
      console.error('Error fetching product data:', error);
  });
}

document.addEventListener('DOMContentLoaded', () => {
    // Select all <a> tags that have a data attribute 'data-category'
    const categoryLinks = document.querySelectorAll('a[category-name]');

    categoryLinks.forEach(link => {
        link.addEventListener('click', function(event) {
            event.preventDefault(); // Prevent the default link behavior
            const category = this.getAttribute('category-name'); // Get the category from the data attribute
            console.log(category)
            fetchProducts(category); // Fetch products for this category
        });
    });
});


document.addEventListener('DOMContentLoaded', () => {
    // Select all <a> tags that have a data attribute 'data-category'
    const productList = document.querySelector('.Product-list'); 

    // Add an event listener to each element inside the list
    productList.addEventListener('click', function(event) {
        const target = event.target;
        if (target.matches('.title') || target.matches('.description') || target.matches('#product-image') 
            || target.matches('.price') ) {
            // Get the product ID
            const id = target.closest('.product').querySelector('.id-product').textContent;
            // send the id to the server so it takes it with $_GET['id']
            /* console.log(id);
            fetch('/src/php/fetch_product.php?id=${id}')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                // Store the product data in session storage
                sessionStorage.setItem('productData', JSON.stringify(data));
                // Redirect to the product page on new tab
                window.open('/src/php/product_details.php', '_blank');

            }); */
            console.log(id);
            sendProductId(id);
        }
    });
});


function sendProductId(productId) {
    var s  = '/src/php/product_details.php?id=' + productId
    window.location.href = s; 
}
