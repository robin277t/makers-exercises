console.log("The notes app is running!");

const notesViewConstruct = require("./notesView");
const notesModelConstruct = require("./notesModel");
const notesClientConstruct = require("./notesClient");

const notesClientInstance = new notesClientConstruct
const notesModelInstance = new notesModelConstruct();
const notesViewInstance = new notesViewConstruct(notesModelInstance, notesClientInstance);

// notesModelInstance.addNotes("hey there")
// notesModelInstance.addNotes("what are you doing?!")
// notesModelInstance.addNotes("get coding")

notesViewInstance.displayNotesOnPage()
