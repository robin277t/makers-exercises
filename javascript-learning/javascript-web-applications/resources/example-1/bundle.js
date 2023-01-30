(() => {
  var __getOwnPropNames = Object.getOwnPropertyNames;
  var __commonJS = (cb, mod) => function __require() {
    return mod || (0, cb[__getOwnPropNames(cb)[0]])((mod = { exports: {} }).exports, mod), mod.exports;
  };

  // add.js
  var require_add = __commonJS({
    "add.js"(exports, module) {
      function add(no1, no2) {
        return no1 + no2;
      }
      module.exports = add;
    }
  });

  // multiply.js
  var require_multiply = __commonJS({
    "multiply.js"(exports, module) {
      var multiply = (no1, no2) => {
        return no1 * no2;
      };
      module.exports = multiply;
    }
  });

  // index.js
  console.log("Hello from the developer console!");
  console.log(new Date());
  var adder = require_add();
  var multiplier = require_multiply();
  console.log(multiplier(adder(2e3, 3e3), 12356435938));
})();
