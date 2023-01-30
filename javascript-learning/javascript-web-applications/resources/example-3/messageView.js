class MessageView {
  constructor() {
    this.buttonEl1 = document.querySelector("#show-message-button");
    this.buttonEl2 = document.querySelector("#remove-message-button");
    this.counter = 1;

    this.buttonEl1.addEventListener("click", () => {
      this.displayMessage();
    });

    this.buttonEl2.addEventListener("click", () => {
      this.removeMessages();
    });
  }

  displayMessage() {
    // console.log("Thanks for clicking me!");
    const val = document.querySelector("#message-input").value;
    const newDiv1 = Object.assign(document.createElement("div"), {
      id: `message${this.counter}`,
      textContent: `${val}`,
      className: "newClass",
    });
    document.querySelector("#main-container").append(newDiv1);
    this.counter += 1;
  }

  removeMessages() {
    document.querySelectorAll("div.newClass").forEach((div) => div.remove());
  }
}

module.exports = MessageView;
