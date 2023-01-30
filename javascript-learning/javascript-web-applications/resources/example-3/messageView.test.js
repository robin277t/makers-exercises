/**
 * @jest-environment jsdom
 */

const fs = require("fs");
const MessageView = require("./messageView");

describe("MessageView", () => {
  it("clicks the button", () => {
    document.body.innerHTML = fs.readFileSync("./index.html");
    const view = new MessageView();
    const buttonEl = document.querySelector("#show-message-button");
    const newString = document.querySelector('#message-input').value = "testing string"
    
    buttonEl.click();
    buttonEl.click();

    expect(document.querySelectorAll(".newClass")).not.toBeNull();
    expect(document.querySelector("#message1")).not.toBeNull();
    expect(document.querySelector("#message2")).not.toBeNull();
    expect(document.querySelector("#message2").textContent).toBe('testing string');
  });
});

describe("RemoveMessages", () => {
  it("clicks the button", () => {
    document.body.innerHTML = fs.readFileSync("./index.html");

    const view = new MessageView();

    const buttonEl = document.querySelector("#remove-message-button");
    buttonEl.click();

    expect(document.querySelectorAll(".newClass")).toHaveLength(0);
    expect(document.querySelector(".newClass")).toBeNull();
  });
});
