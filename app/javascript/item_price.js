const priceInput = document.getElementById("item-price");
const taxOutput = document.getElementById("add-tax-price");
const profitOutput = document.getElementById("profit");

priceInput.addEventListener("input", () => {
  const price = parseFloat(priceInput.value);

  if (!isNaN(price)) {
    const tax = price * 0.1; // 販売手数料（10%）
    const profit = price - tax; // 販売利益

    taxOutput.textContent = `${tax.toFixed(0)} `; // 販売手数料を表示（小数点以下表示しない）
    profitOutput.textContent = `${profit.toFixed(0)} `; // 販売利益を表示（小数点以下表示しない）
  } else {
    taxOutput.textContent = "0 ";
    profitOutput.textContent = "0 ";
  }
});
