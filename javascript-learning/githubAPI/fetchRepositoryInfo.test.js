const gitHubClientRequire = require("./fetchRepositoryInfo");

describe("GitHubClient class tests", () => {
  it("first test", (done) => {
    URL = "https://api.github.com/repos/sinatra/sinatra";
    const testInstance = new gitHubClientRequire.GitHubClient();
    testInstance.fetchRepositoryInfo(URL, (response) => {
      try {
        expect(response['name']).toBe('sinatra');
        done();
      } catch (error) {
        done(error);
      }
    });
  });
});

describe("GitHub class integration tests", () => {
  it("second test", (done) => {
    URL = "https://api.github.com/repos/sinatra/sinatra";
    const testInstanceOver = new gitHubClientRequire.GitHub(
      new gitHubClientRequire.GitHubClient()
    );
    testInstanceOver.fetch(URL, (response) => {
      try {
        expect(response["name"]).toBe("sinatra");
        done();
      } catch (error) {
        done(error);
      }
    });
  });
});

