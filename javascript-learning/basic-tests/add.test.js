const xx = require("./add");
yy = new xx();

describe("add", () => {
  it("add adds 2 and 3", () => {
    expect(yy.add(2, 3)).toBe(5);
  });
  it("multiply multiplies 10 and 3", () => {
    expect(yy.multiply(10, 3)).toBeCloseTo(29.9999);
  });
});
