(() => {
  var __commonJS = (cb, mod) => function __require() {
    return mod || (0, cb[Object.keys(cb)[0]])((mod = { exports: {} }).exports, mod), mod.exports;
  };

  // view.js
  var require_view = __commonJS({
    "view.js"(exports, module) {
      var View2 = class {
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
          const paras = document.querySelectorAll("p");
          paras.forEach((para) => para.remove());
        }
      };
      module.exports = View2;
    }
  });

  // index.js
  var View = require_view();
  var view = new View();
  view.addParagraph("This paragraph has been dynamically added");
})();
