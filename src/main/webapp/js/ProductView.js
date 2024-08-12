$(function() {

  const productPriceElement = document.getElementById('product-price');
  const totalPriceElement = document.getElementById('total-price');
  const increaseButton = document.getElementById('increase-btn');
  const decreaseButton = document.getElementById('decrease-btn');
  const numberDisplay = document.getElementById('number-display'); 
  const quantityDisplay = document.getElementById('quantity-display'); 

  let basePrice = parseInt(productPriceElement.textContent.replace(/[^0-9]/g, ''));
  let quantity = 1;

 
  function updateDisplay() {
    numberDisplay.textContent = quantity; 
    quantityDisplay.textContent = `(${quantity}개)`; 

    const totalPrice = basePrice * quantity;
    totalPriceElement.textContent = `${totalPrice}원`;
  }

  increaseButton.addEventListener('click', () => {
    quantity += 1;
    updateDisplay();
  });

  decreaseButton.addEventListener('click', () => {
    if (quantity > 1) { 
      quantity -= 1; 
      updateDisplay(); 
    }
  });

  updateDisplay();
});

function goToScroll(name) {
  var location = document.querySelector("#" + name).offsetTop;
  window.scrollTo({ top: location - 100, behavior: 'smooth' });
}
