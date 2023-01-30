const testfizz = require("./conditionals");
// const testfizz = testfizz2.fizzBuzz;

describe("fizzystuff", () => {
  it("tests fizzyness", () => {
    expect(testfizz.fizzBuzz(3)).toBe("Fizz");
  });
});
