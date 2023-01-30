class View {
  constructor() {
    this.mainContainerEl = document.querySelector("#main-container");
    console.log(this.mainContainerEl);
  }
  addParagraph(content) {
    let newP = document.createElement("p");
    newP.textContent = content;
    this.mainContainerEl.append(newP);
  }

  removeParas() {
    const paras = document.querySelectorAll('p')
    paras.forEach((para) => para.remove())
  }
}

module.exports = View;

