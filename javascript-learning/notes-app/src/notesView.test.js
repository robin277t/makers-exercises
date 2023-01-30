/**
 * @jest-environment jsdom
 */

const getNotesClient = require("./notesClient");
const getNotesModel = require("./notesModel");
const getNotesView = require("./notesView");
const fs = require("fs");

jest.mock("./notesClient");
jest.mock("./notesModel");

// jest.mock("./notesModel", () => ({
//   __esModule: true,
//   names: ["one item"],
// }));

describe("notes View class integration", () => {
  //THIS BLOCK WON'T WORK WHILE jest.mock() is enabled

  beforeEach(() => {
    document.body.innerHTML = fs.readFileSync("../index.html");
    testNote = new getNotesModel();
    testView = new getNotesView(testNote);
  });

  xit("displayNotes will show a note INTEGRATION", () => {
    testNote.addNotes("hey bro");
    testNote.addNotes("where is my coffee?");

    testView.displayNotesOnPage();
    expect(document.querySelectorAll("div.note").length).toBe(2);
  });

  xit("button shows on page", () => {
    const buttonTest = document.querySelector("#noteButtonID");
    expect(buttonTest).not.toBeNull();
  });

  xit("button click calls addNotes variable", () => {
    const buttonTest = document.querySelector("#noteButtonID");
    testNote.addNotes("hey bro");
    testNote.addNotes("where is my coffee?");
    buttonTest.click();
    expect(testNote.notes.length).toBe(3);
  });
  xit("button click takes input field as value to display", () => {
    const buttonTest = document.querySelector("#noteButtonID");
    testNote.addNotes("hey bro");
    testNote.addNotes("where is my coffee?");
    document.querySelector("#input-box").value = "latest musings";
    buttonTest.click();
    expect(testNote.notes[2]).toEqual("latest musings");
  });
  xit("button click displays new field as note on screen", () => {
    const buttonTest = document.querySelector("#noteButtonID");
    testNote.addNotes("hey bro");
    testNote.addNotes("where is my coffee?");
    document.querySelector("#input-box").value = "even more musings";
    buttonTest.click();
    const newDivArray = document.querySelectorAll("div.note");
    expect(newDivArray[2].innerText).toEqual("even more musings");
  });

  xit("displays correct number of notes", () => {
    // const buttonTest = document.querySelector("#noteButtonID");
    testNote.addNotes("hey bro");
    testNote.addNotes("where is my coffee?");
    testView.displayNotesOnPage();
    expect(document.querySelectorAll("div.note").length).toBe(2);
    testView.displayNotesOnPage();
    expect(document.querySelectorAll("div.note").length).toBe(2);
    testNote.addNotes("is this now three?");
    testView.displayNotesOnPage();
    expect(document.querySelectorAll("div.note").length).toBe(3);
  });

  xit("displayNotes clears input box", () => {
    const buttonTest = document.querySelector("#noteButtonID");
    testNote.addNotes("hey bro");
    testNote.addNotes("where is my coffee?");
    document.querySelector("#input-box").value = "even more musings";
    buttonTest.click();
    expect(document.querySelectorAll("div.note").length).toBe(3);
    expect(document.querySelector("#input-box").value).toBe("");
  });
});

describe("notes View works with fetch and mocks", () => {
  beforeEach(() => {
    document.body.innerHTML = fs.readFileSync("../index.html");
  });

  it("checks that displayNotesFromApi calls loadNotes from Client class", () => {
    const clientMock = new getNotesClient();
    const noteMock = new getNotesModel();
    noteMock.notes = ["one note from server mocked"];
    clientMock.loadNotes.mockImplementation(() => {
      noteMock.setNotes();
      testView.displayNotesOnPage();
    });

    const testView = new getNotesView(noteMock, clientMock);

    testView.insertNotesFromApi(); //WHEN USING A MOCKED CLASS INSTANCE WITH CALLBACK EVEN INCLUDING FETCH, IT EFFECTIVELY BECOMES SYNCHRONOUS
    expect(clientMock.loadNotes).toHaveBeenCalledTimes(1);
    expect(noteMock.setNotes).toHaveBeenCalledTimes(1);
    expect(document.querySelectorAll("div.note").length).toBe(1);
  });

  it("checks that createNotes is called with input box data", (done) => {
    const clientMock = new getNotesClient();
    const noteMock = new getNotesModel();
    let testString = (document.querySelector("#input-box").value =
      "this is also from the server");
    const buttonTest = document.querySelector("#noteButtonID");
    testView = new getNotesView(noteMock, clientMock);

    buttonTest.click();
    try {
      expect(clientMock.createNote).toHaveBeenCalledTimes(1);
      expect(clientMock.createNote).toHaveBeenCalledWith(
        testString,
        expect.any(Function),
        expect.any(Function)
      );
      done();
    } catch (errorMessage) {
      done(errorMessage);
    }
  });
  it("error catching using displayError method, displays error on page", () => {
    // if method is called, display a new message on the page at the top as a h1 class
    const clientMock = new getNotesClient();
    const notesMock = new getNotesModel();
    testView = new getNotesView(notesMock, clientMock);
    testView.displayError();
    const checkErrorMsg = document.getElementById("err-msg");
    expect(checkErrorMsg.innerText).toBe("oops, something went wrong with the network");
  });
});

// xdescribe("notes View class mocks", () => {
//   beforeEach(() => {
//     getNotesModel.mockClear();
//     document.body.innerHTML = fs.readFileSync("./index.html");
//   });

//   //Automatically creating a mock here is slightly unneccesary, as I am just inserting it as an object with an array
//   //to give something for the test to check adds to page.
//   //The real purpose and need for the auto mock is to look at the 'toHaveBeenCalled' methods within the class instance, as they appear
//   //autogenerated in the auto mock but don't actually work, but if there's lots it'll save typing and you can check that your
//   //current method or class does the calling correctly.

//   it("displayNotes will show a note MOCKED", () => {
//     const mockTestNote = new getNotesModel();
//     mockTestNote.notes = ["hey you", "new note", "what is this"]; //adds array of notes to auto mock (this doesn't seem to happen automatically)
//     mockTestNote.addNotes.mockImplementation((input) =>
//       mockTestNote.notes.push(input)
//     ); //adds fake replacement method to auto mock
//     mockTestNote.addNotes("where is my coffee?");
//     expect(mockTestNote.notes).toEqual([
//       "hey you",
//       "new note",
//       "what is this",
//       "where is my coffee?",
//     ]);
//     expect(mockTestNote.addNotes).toHaveBeenCalledTimes(1);
//     const testView = new getNotesView(mockTestNote);
//     testView.displayNotes();
//     const pageList = document.querySelectorAll("div.note");
//     expect(pageList.length).toBe(4);
//   });
// });
