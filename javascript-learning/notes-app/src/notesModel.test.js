const notesModelImport = require("./notesModel");

describe("notes model class", () => {
  beforeEach(() => {
    newModel = new notesModelImport();
  });

  it("model.getNotes returns a blank array", () => {
    expect(newModel.getNotes()).toEqual([]);
  });

  it("model.addNotes adds 1 item to a blank array", () => {
    newModel.addNotes("learn to code");
    expect(newModel.getNotes()).toEqual(["learn to code"]);
  });

  it("model.addNotes adds 2 items to array", () => {
    newModel.addNotes("learn to code");
    newModel.addNotes("have a break");
    expect(newModel.getNotes()).toEqual(["learn to code", "have a break"]);
  });

  it("model.reset clears out the array of notes", () => {
    newModel.addNotes("learn to code");
    newModel.addNotes("have a break");
    newModel.reset();
    expect(newModel.getNotes()).toEqual([]);
  });
});
