// function printHello() {
//   return "HELLO!";
// }

const printHello2 = () => {
  console.log("hello2...");
};

const delayer = (passcb) => {
  setTimeout(() => {
    passcb();
    console.log("hello!!!...");
  }, 2000);
};

// delayer(printHello2)

let counter = 0;
const incrementIt = () => {
  counter += 1;
};

const counts = (incrementCount) => {
  setInterval(() => {
    incrementCount();
    console.log(counter);
  }, 1500);
};

// counts(incrementIt)

const got = require("got");

// got("https://api.github.com/repos/sinatra/sinatra").then((response) => {
//   console.log(JSON.parse(response.body));
// });

// const fetchCatFacts = (callback) => {
//   got("https://api.github.com/orgs/makersacademy/repos").then((response) => {
//     callback(JSON.parse(response.body));
//   });
// };

// // let responder = fetchCatFacts();

// // console.log(responder);

// fetchCatFacts((response) => {
//   console.log(response);
// });

console.log("A");

const callback = () => {
  console.log("B");
};

console.log("C");

setTimeout(callback, 0);

console.log("D");

let a = 10;

const callback = () => {
  a = 20;
  console.log(a);
};

setTimeout(callback, 0);


