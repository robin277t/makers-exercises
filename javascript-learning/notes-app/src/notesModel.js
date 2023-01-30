class NotesModel {
  constructor() {
    this.notes = [];
  }

  getNotes() {
    return this.notes;
  }

  addNotes(note) {
    this.notes.push(note);
  }

  reset() {
    this.notes = [];
  }

  setNotes(notes) {
    // console.log('setNotes called here! should appear first');
    this.notes = notes;
  }
}

module.exports = NotesModel;
