var modal = document.querySelector('#product-modal');
var modalContent = document.querySelector('.close');
var productDescription = document.querySelector('.product-description');

function showModal(product) {
  modal.style.display = 'block';
  updateProductDescription(product);
}

function updateProductDescription(product) {
  productDescription.innerHTML = `
    Name: ${product.name}<br>
    Description: ${product.description}<br>
    Price: ${product.price}<br>
    <form class="add-to-cart" action="/users">
    <input type="submit" value="Add to Cart" />
    </form>
  `;
}
function removeModal() {
  modal.style.display = 'none';
}

window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = 'none';
  }
};

