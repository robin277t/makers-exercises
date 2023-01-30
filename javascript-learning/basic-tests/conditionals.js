// const getNumberSign = (num) => {
//   if (num > 0) {
//     return "positive";
//   } else if (num === 0) {
//     return "zero";
//   } else {
//     return "negative";
//   }
// };

const fizzBuzz = (num) => {
  if (num % 3 === 0 && num % 5 === 0) {
    return "FizzBuzz";
  } else if (num % 5 === 0) {
    return "Buzz";
  } else if (num % 3 === 0) {
    return "Fizz";
  } else {
    return num;
  }
};

const isValidLength = (phoneNumber) => {
  const validLength = 11;
  if (phoneNumber.length == validLength) {
    return true;
  } else {
    return false;
  }
};

// const loopy = () => {
//   for (let i = 1; i <= 20; i++) {
//     if (i % 2 === 0) {
//       console.log(`${i} is even`);
//     } else {
//       console.log(`${i} is odd`);
//     }
//   }
// };

// const fizzbuzzUntil = (num) => {
//   let ite = 1;
//   while (ite <= num) {
//     console.log(fizzBuzz(ite));
//     ite += 1;
//   }
// };

// module.exports = fizzBuzz;
module.exports = { isValidLength, fizzBuzz };
// module.exports = isValidLength;
