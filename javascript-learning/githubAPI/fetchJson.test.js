const test = require("./fetchJson");

describe("fetchJson", () => {
  // using expect inside the callback function to get it to execute delayed - with DONE otherwise false positive
  it("checks response body the easiest way", (done) => {
    test.fetchJson("https://jsonplaceholder.typicode.com/todos", (bodytext) => {
      expect(bodytext.length).toBe(200);
      done();
    });
  });

  // Below has the try and catch blocks to show what the value diff error is rather than just a generic error message
  it("checks response body with error catching", (done) => {
    test.fetchJson("https://jsonplaceholder.typicode.com/todos", (bodytext) => {
      try {
        expect(bodytext.length).toBe(200);
        done();
      } catch (showTheErrorWeGotFromTry) {
        done(showTheErrorWeGotFromTry);
      }
    });
  });

  //Using .then to get wait for promise resolution before running expect as a callback
  it("checks response body with dot then  ", () => {
    const testurl = "https://jsonplaceholder.typicode.com/todos";
    const testCallback = (bodytext) => bodytext.length;
    test.fetchJson(testurl, testCallback).then((whatever) => {
      expect(whatever).toBe(200);
    });
  });

  //using async await to achieve the same thing as above
  it("checks response body with async/await  ", async () => {
    const testurl = "https://jsonplaceholder.typicode.com/todos";
    const testCallback = (bodytext) => bodytext.length;
    const testObject2 = await test.fetchJson(testurl, testCallback);
    expect(testObject2).toBe(200);
  });
});
