function profitCalculation() {
  
  const priceInput = document.getElementById("item-price")
  const fee = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  priceInput.addEventListener("input",() => {
    const inputValue = priceInput.value
    const feeValue = Math.floor(inputValue/10)
    const profitValue = Math.floor(inputValue - feeValue)
    fee.innerHTML = feeValue
    profit.innerHTML = profitValue
  })
};

window.addEventListener('load', profitCalculation)