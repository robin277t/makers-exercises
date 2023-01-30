const { count } = require("console");
const { getRandomValues } = require("crypto");

class Rectangle {
  constructor(height, width) {
    this.height = height;
    this.width = width;
  }

  getArea() {
    return this.height * this.width;
  }
}

class User {
  constructor(namex) {
    this.namex = namex;
  }
  getName() {
    return this.namex;
  }

  getIntroduced() {
    return `Hi, my name is ${this.namex}`;
  }
}

const userslist = [new User("Uma"), new User("Josh"), new User("Ollie")];

class userBase {
  constructor(array) {
    this.array = array;
  }

  count() {
    return this.array.length;
  }

  getNames() {
    return this.array.map((thing) => thing.getName())
  }
}


class ShoppingBasket {
  constructor() {
    this.basketarr = [];
  }
  addItem(candy) {
    this.basketarr.push(candy);
  }
  getTotalPrice = () => {
    return this.basketarr.map((candy) => {
      return candy.getPrice()}).reduce((a, v) => { return a + v }, 0)
  }
}

class Candy {
    constructor(name, price) {
        this.name = name;
        this.price = price;
    }
    getName() {
        return this.name;
    }
    getPrice() {
        return this.price;
    }
}


module.exports = {
    Rectangle,
    User,
    userBase,
    userslist,
    Candy,
    ShoppingBasket,
};
