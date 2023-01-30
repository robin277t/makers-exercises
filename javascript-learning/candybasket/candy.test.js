const getCandy = require("./candy");

describe("candy class", () => {
  it("returns candy name", () => {
    const testCandy = new getCandy("fruit", 1.99);
    expect(testCandy.showName()).toBe("fruit");
  });

  it("returns candy price", () => {
    const testCandy = new getCandy("fruit", 1.99);
    expect(testCandy.showPrice()).toBe(1.99);
  });
});
