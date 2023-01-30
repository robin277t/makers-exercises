const got = require("got");
const URL = "https://jsonplaceholder.typicode.com/todos";

const fetchJson = (URL, callbackFunc) => {
  return got(URL).then((response) => {
    return callbackFunc(JSON.parse(response.body));
  });
};

module.exports = { fetchJson };

////////////////////////
////////////////////////

const fetchJson2 = (URL) => {
  return got(URL).then((response) => {
    return JSON.parse(response.body).length; // does this not return '200'? It does, just needed the extra return on parent function
  });
}; //Returns Promise (pending) and then Promise 200

const xxx = (callback, URL) => {
  const please = callback(URL);
  // at this point please = Promise (pending)
  setTimeout(() => {
    console.log(please); // at this point please = Promise (200)
  }, 300);
};

const xxx = async (callback, URL) => {
  const please = await callback(URL);
  // at this point please = Promise (pending)
    console.log(please); // at this point please = Promise (200)
};


xxx(fetchJson2, URL); //why does this output 'Promise { 200 }' instead of just 200? 
fetchJson2(URL).then((bodycount) => {console.log(bodycount)}); // why does this output '200' instead of Promise { 200 }? This is more surprising?
// My theory is it is the difference of the output of a function called with the returned result as an argument (not xxx) which has made it not a promise-returning function, vs just assigning and printing the returned result of a promised function(xxx)


///BELOW IS CODE FROM JOHN ADVICE CALL

// There are other ways we can add functions to the event queue.
// 1. using the `.then` method on a promise:

const promise = fetch("https://pokeapi.co/api/v2/pokemon/ditto");
promise
  .then((res) => {
    console.log(res);
    return res.json();
  })
  .then((dataString) => {
    console.log(JSON.parse(dataString));
  });

const got = (url) => {
  return fetch(url).then((response) => {
    return response.text();
  });
};

// 2. using event listeners. (This is used heavily in front-end JS)
// This will add `callback` to the event queue, with a trigger of
// 'this button has been clicked'

// const buttonElement = document.querySelector('.button');
// buttonElement.addEventListener('click', callback)

const got = require("got");
let a;

const fetchJson = (URL) => {
  return got(URL).then((res) => {
    a = JSON.parse(res.body).name;
  });
};

fetchJson("https://pokeapi.co/api/v2/pokemon/ditto");

setTimeout(() => {
  console.log(a);
}, 500); // What this does here is 'race' the logging of 'a' between server request and setTimeout
