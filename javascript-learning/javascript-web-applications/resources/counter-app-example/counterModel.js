class CounterModel {
  constructor() {
    this.counter = 0;
    console.log("hello robin");
  }

  getCounter() {
    return this.counter;
  }

  increment() {
    this.counter++;
  }

  decrement() {
    this.counter--;
  }
}

module.exports = CounterModel;
