//　フォームに入力した数字を価格に反映させる
window.addEventListener('load', function(){

let itemPrice = document.getElementById('test-item-price');

itemPrice.addEventListener('input',()=>{
  calcPrice = document.getElementById('test-item-price').value;

  let taxPrice = document.getElementById('add-tax-price').innerHTML;
   taxPrice = calcPrice * 0.1;
   document.getElementById('add-tax-price').innerHTML = taxPrice;

  let profitPrice = document.getElementById('profit').innerHTML;
   profitPrice = calcPrice - taxPrice;
   document.getElementById('profit').innerHTML = profitPrice;
})
})

