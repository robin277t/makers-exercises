// console.log("insert?");
// const names = 12;
// const twotimes = 14;
// const evenmoreteimes = 16;
// newvar = 121;

const sayHello = (who) => {
    return `helloooo ${who}`
}

const hello4 = (yes) => {
  console.log("original thing, " + yes);
};

const hello3 = (yes) => {
  console.log("this is the third thing, " + yes);
};

module.exports = hello3;
module.exports = hello4;
module.exports = sayHello;
