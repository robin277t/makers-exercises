class Candy {
  constructor(itemname, price) {
    this.itemname = itemname;
    this.price = price;
  }
  showName() {
    return this.itemname;
  }

  showPrice() {
    return this.price;
  }
}

module.exports = Candy;
