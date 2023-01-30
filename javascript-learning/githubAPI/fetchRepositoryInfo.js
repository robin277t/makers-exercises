const got = require("got");
URL = "https://api.github.com/repos/sinatra/sinatra";

class GitHubClient {
  fetchRepositoryInfo(URL, callback) {
    return got(URL).then((response) => {
      callback(JSON.parse(response.body)); //might need a return at the front of this line
    });
  }
}

class GitHub {
  constructor(gHClient) {
    this.gHClient = gHClient;
  }
  fetch(url) {
    return gHClient.fetchRepositoryInfo(url, (res) => {
      return res;
    });
  }

  getRepoData() {
    return this.gHClient
    //this is meant to return 'JS object' with repo information (is this the passed callback?)
  }
}

module.exports = { GitHubClient, GitHub };

// newish = new GitHubClient

// newish.fetchRepositoryInfo(URL, (response) => {
//     console.log(response['name']);
// })
