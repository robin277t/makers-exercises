class shoppingBasket {
  constructor() {
    this.candyArray = [];
    this.discount = 0;
  }

    
  applyDiscount(discount) {
    this.discount = discount;
  }

  addItem(candy) {
    this.candyArray.push(candy);
  }

    getTotalPrice() {
      if (this.candyArray.length == 0) {
        return 0;
      } else {
        return this.candyArray
          .map((instance) => {
            return instance.showPrice();
          })
          .reduce((a, v) => {
            return a + v;
          }, 0);
      }
    }

  getTotalPriceDiscount() {
    let totalPrice = 0;
    this.candyArray.forEach((candy) => {
      totalPrice += candy.showPrice();
    });

    return totalPrice * (1- this.discount);
  }
}

module.exports = shoppingBasket;
