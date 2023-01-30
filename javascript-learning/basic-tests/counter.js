let counter = 0;

const increment = () => {
  let x = 2;
  counter += x;
  console.log(counter);
};

const incrementTime = () => {
  setInterval(increment, 1000);
};

const numbers = [1, 2, 3, 4];

const newNumbers = numbers.concat(5); // adds one element and return a new array

numbers.forEach((num) => {
  console.log(num);
});

// const newarray = ["one", "two", "three"];
// looper = [1, 2, 3, 4, 5, 6, 7];

const addToBatch = (array, number) => {
  if (array.length >= 5) {
    return array;
  }
  return array.concat(number);
};

const person = {
  name: "Maxine",
  age: 32,
  address: {
    city: "London",
    postcode: "E1 123",
  },
  hobbies: ["writing", "tennis", "cooking"],
};

const cohort = {
  name: "October22",
  id: 0x10245,
  id2: 102,
  id3: 0011,
  names: ["jeff", "bill gates", "me"],
};

const readCohort = (coh) => {
  console.log(
    `${coh.id} ${coh["id2"]} - ${coh.name} - ${coh.names.length} students in this cohort`
  );
};

const names = ["Anna", "Li", "Charlie", "Mary", "Jo"];

// 1. Using a predicate function and `filter` to get only names shorter than 3 letters.
const isShorterThanThree = (name) => {
  if (name.length < 3) {
    return true;
  } else {
    return false;
  }
};

const namesShorterThanThreeLetters = names.filter(isShorterThanThree);

// 2. Create a new array of all names uppercased by applying
// the `getUppercased` function to all elements in the `names` array.

const getUppercased = (name) => {
  return name.toUpperCase();
};

const uppercasedNames = names.map(getUppercased);

const checkLength = (string_of_numbers) => {
  if (string_of_numbers.length <= 10) {
    return true;
  } else {
    return false;
  }
};

const filterLongNumbers = (array) => {
  return array.filter(checkLength);
};

const makeMessage = (givenname) => {
  return `Hi ${givenname}! 50% off for you today`;
};

const generateMessages = (namearray) => {
  return namearray.map(makeMessage);
};

const generateMessages2 = (namearray) => {
  return namearray.map((nam) => `Hi ${nam}! 75% off for you today`);
};

const nameslist = ["Anna", "Laura", "Josh", "Min", "Karla"];

const namesAndDiscounts = [
  { name: "Anna", discount: 50 },
  { name: "Laura", discount: 40 },
  { name: "Josh", discount: 30 },
  { name: "Min", discount: 50 },
  { name: "Karla", discount: 60 },
];

const generateMessages3 = (nameobj) => {
  return nameobj.map(
    (nam) => `Hi ${nam.name}! ${nam.discount}% off for you today`
  );
};
