const notesClientConstructor = require("./notesClient");

require("jest-fetch-mock").enableMocks();

describe("notes client class", () => {
  it("loadNotes works with mocked fetch and callback", (done) => {
    notesClientInstance = new notesClientConstructor();
    fetch.mockResponseOnce(
      JSON.stringify({
        name: "This note from the test server",
      })
    );
    notesClientInstance.loadNotes(
      (testItem) => {
        try {
          let test = `${testItem.name} has been returned`;
          expect(test).toBe("This note from the test server has been returned");
          done();
        } catch (showTheErrorWeGotFromTry) {
          done(showTheErrorWeGotFromTry);
        }
      },
      () => {
        () => {
          console.log("error found but why? that is better"); //// HOW CAN I TEST FAILED SERVER RESPONSE HERE? toEqual(Promise.reject())
        };
      }
    );
  });

  it("createNote works with fetch post route", async () => {
    notesClientInstance = new notesClientConstructor();
    fetch.mockResponseOnce(
      JSON.stringify({
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify("will this work ?"),
      })
    );
    const tester = await notesClientInstance.createNote(
      "blank",
      (text) => {
        text + text;
      },
      () => {
        return "error message here";
      }
    );
    try {
      let bodyText = await tester.json();
      expect(bodyText.body).toContain("will this work ?");
      expect(tester.status).toBe(200);
    } catch (showTheErrorWeGotFromTry) {
      console.log(showTheErrorWeGotFromTry);
    }
  });

  it("createNote flags up error with broken network (failed promise) on get post route", async () => {
    notesClientInstance = new notesClientConstructor();
    fetch.mockResponseOnce( //ALTER THIS?
      JSON.stringify({
        method: "POST",
        headers: {
          ok: false,
          "Content-Type": "application/json",
        },
        body: JSON.stringify("will this work ?"),
      })
    );
    const tester = await notesClientInstance.createNote(
      "blank",
      (text) => {
        text + text;
      },
      () => {
        console.log("error message here");
      }
    );
    expect(tester)
  });
});

//// HOW TO TEST THIS? WHAT AM I ACTUALLY TESTING???
// I am actually testing that a 'fetch' call is made with the assigned 'body'
// (which is note content of my choosing). We can test that with a mocked 'fetch' which
//replaces the real fetch when it's called, and we can test that mocked fetch is called by
// checking for statuscode 200 and the body content.
