const getBasket = require("./shoppingBasket");

describe("shopping basket class", () => {
  it("returns get total price of empty basket", () => {
    const basketInstance = new getBasket();
    expect(basketInstance.getTotalPrice()).toBe(0);
  });

  it("returns adds 1 candy to basket", () => {
    const basketInstance = new getBasket();
    const mockCandy = { showPrice: () => 1.5, showname: () => "fruit" };
    basketInstance.addItem(mockCandy);
    expect(basketInstance.getTotalPrice()).toBe(1.5);
  });

  it("returns adds 2 candies to basket", () => {
    const basketInstance = new getBasket();
    const mockCandy = { showPrice: () => 1.5, showname: () => "fruit" };
    const mockCandy2 = { showPrice: () => 4.2, showname: () => "fruitser" };
    basketInstance.addItem(mockCandy);
    basketInstance.addItem(mockCandy2);
    expect(basketInstance.getTotalPrice()).toBe(5.7);
  });

  it("applies total discount to basket", () => {
    const basketInstance = new getBasket();
    const mockCandy = { showPrice: () => 1.5, showname: () => "fruit" };
    const mockCandy2 = { showPrice: () => 4.2, showname: () => "fruitser" };
    basketInstance.addItem(mockCandy);
    basketInstance.addItem(mockCandy2);
    basketInstance.applyDiscount(0.1);
    expect(basketInstance.getTotalPriceDiscount()).toBe(5.13);
  });
});
