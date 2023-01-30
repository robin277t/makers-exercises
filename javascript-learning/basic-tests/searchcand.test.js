const candyCho = require("./searchcand");
const candyChoicesX = candyCho.candyChoices;

describe("searchcand", () => {
  it("returns candies under value threshold", () => {
    expect(candyChoicesX.candyChoice("Ma", 1.5)).toEqual(["Mars"]);
  });

  it("returns candies under value threshold", () => {
    expect(candyChoicesX.candyChoice("Sk", 3)).toEqual(["Skitties", "Skittles"]);
  });

  it("returns candies under value threshold", () => {
    expect(candyChoicesX.candyChoice("P", 3)).toEqual([]);
  });

  it("returns candies under value threshold", () => {
    expect(candyChoicesX.candyChoice("", 1.5)).toEqual(["Mars", "Skittles"]);
  });

  it("returns candies under value threshold", () => {
    expect(candyChoicesX.candyChoice("", 11.5)).toContain("Gummi bears");
  });
});
