const item_price = () => { 
  const priceInput = document.getElementById("item-price");
  if (!priceInput) return null;
  const taxOutput = document.getElementById("add-tax-price");
  const profitOutput = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const price = parseFloat(priceInput.value);

    if (!isNaN(price)) {
      const tax = Math.floor(price * 0.1); // 販売手数料（10%）を切り捨てて計算
      const profit = price - tax; // 販売利益

      taxOutput.textContent = `${tax} `; // 販売手数料を表示
      profitOutput.textContent = `${profit} `; // 販売利益を表示
    } else {
      taxOutput.textContent = "0 ";
      profitOutput.textContent = "0 ";
    }
  });
};
window.addEventListener("turbo:load", item_price);