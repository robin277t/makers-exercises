// const getModel = require("./notesModel"); // THIS NOT NEEDED?

class NotesView {
  constructor(newModel, newClient) {
    this.newClient = newClient;
    this.button1 = document.querySelector("#noteButtonID");
    this.button2 = document.querySelector("#noteDeleteButton");
    this.field = document.querySelector("#input-box");
    this.newModel = newModel;

    // create new method in noteClient that clears notes

    this.button2.addEventListener("mouseover", () => {
      this.newClient.deleteNotes(
        () => {
          this.insertNotesFromApi();
        },
        () => {
          this.displayError();
        }
      );
    });

    this.button1.addEventListener("click", () => {
      this.newClient.createNote(
        this.field.value,
        () => {
          this.insertNotesFromApi();
        },
        () => {
          this.displayError();
        }
      );
    });
  }

  displayNotesOnPage() {
    // console.log(" displayNotesOnPage called here should appear Second!");
    document.querySelectorAll("div.note").forEach((note) => {
      note.remove();
    });
    this.field.value = "";
    this.newModel.notes.forEach((note) => {
      let newNote = document.createElement("div");
      newNote.className = "note";
      newNote.innerText = note;
      let insertLoc = document.getElementById("main-container1");
      insertLoc.append(newNote);
    });
  }

  insertNotesFromApi() {
    this.newClient.loadNotes(
      (data) => {
        this.newModel.setNotes(data);
        this.displayNotesOnPage();
      },
      () => {
        this.displayError();
      }
    );
  }

  displayError() {
    let error = document.createElement("div");
    error.id = "err-msg";
    error.innerText = `oops, something went wrong with the network`;
    let insertLoc = document.getElementById("main-container1");
    insertLoc.append(error);
  }

  testFunction() {
    console.log("print location??");
  }
}

module.exports = NotesView;
