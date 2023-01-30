const got = require("got");
const url = "https://api.github.com/repos/sinatra/sinatra";
// Create a "handler" callback function.
// Call `got` and provide the handler callback function.
// This will get called by `got` when the response is received.
got(url).then((response) => {
  console.log(JSON.parse(response.body));
});

// const handleReceivedResponse = (response) => {
//   console.log(JSON.parse(response.body));
// };

// got("https://api.github.com/repos/sinatra/sinatra").then(
//   handleReceivedResponse
// );

