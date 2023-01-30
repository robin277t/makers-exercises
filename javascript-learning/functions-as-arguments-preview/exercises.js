const doubleCall = (callback) => {
  callback(); callback();
};

// Exercise 2. Edit this function
const obnoxiousFn = (param) => {
  console.log("EXECUTING CALLBACK!");
  return param();
};

const four = obnoxiousFn(() => {
  return 2 + 2;
}); // Should print 'EXECUTING CALLBACK!!' and return 4

console.log(four); // Should print 4

// Exercise 3. Edit this function
const currentTime = (callback) => {
  const currentTime = new Date().toLocaleTimeString();
  callback(currentTime);
};

// Bonus Exercise. Edit this function
// const myMap = (array, cb) => {
//   const newarr = [];
//   for (let i = 0; i < array.length; i++) {
//     newarr.push(cb(array[i]));
//   }
//   return newarr;
// };

const myMap = (array, cb) => {
  const newarr = [];
  let i = 0;
  while (i < array.length) {
    newarr.push(cb(array[i]));
    i++;
  }
  return newarr
};

const lettersArray = ["a", "b", "c"];
const numbersArray = [1, 2, 3, 5];

const toUpperCase = (str) => {
  return str.toUpperCase();
};
const double = (num) => {
  return num * 2;
};

const uppercaseArray = myMap(lettersArray, toUpperCase); // uppercaseArray should be ['A', 'B', 'C']
const doubledArray = myMap(numbersArray, double); // doubledArray should be [2, 4, 6, 10]

console.log(uppercaseArray);
console.log(doubledArray);

module.exports = {
  doubleCall,
  obnoxiousFn,
  currentTime,
  myMap,
};
