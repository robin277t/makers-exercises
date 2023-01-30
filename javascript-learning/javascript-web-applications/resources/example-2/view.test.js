/**
 * @jest-environment jsdom
 */

const fs = require("fs");
const View = require("./view");

describe("Page view", () => {
  beforeEach(() => {
    document.body.innerHTML = fs.readFileSync("./index.html");
    viewMe = new View(); 
  });

  it("displays 2 paragraphs", () => {
    expect(document.querySelectorAll("p").length).toBe(2);
  });

  it("checks add paragraphs ups para count to 3", () => {
    viewMe.addParagraph("hello people");
    expect(document.querySelectorAll("p").length).toBe(3);
  });

  it("removes all paragraphs from page view", () => {
    viewMe.removeParas();
    expect(document.querySelectorAll("p").length).toBe(0);
  });
});
