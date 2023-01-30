class NotesClient {
  //this function is fine
  loadNotes(callback, errCb) {
    return fetch("http://localhost:3000/notes")
      .then((response) => {
        return response.json();
      })
      .then((data) => {
        callback(data);
      })
      .catch(() => {
        errCb();
      });
  }

  createNote(contents, callback, errCb) {
    return fetch("http://localhost:3000/notes", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ content: contents }),
    })
      .then((response) => {
        callback(response);
        return response;
      })
      .catch(() => {
        errCb();
      });
  }

  deleteNotes(callback, errCb) {
    return fetch("http://localhost:3000/notes", {
      method: "DELETE",
    })
      .then(() => {
        callback();
      })
      .catch(() => {
        errCb();
      });
  }
}

module.exports = NotesClient;
