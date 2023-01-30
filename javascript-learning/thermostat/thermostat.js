class Thermostat {
  constructor() {
    this.currentTemp = 20;
    this.powerMode = true;
  }

  showTemp() {
    return this.currentTemp;
  }

  up1() {
    this.currentTemp += 1;
    if (this.currentTemp > 25 && this.powerMode === true) {
      this.currentTemp = 25;
    } else if (this.currentTemp > 32 && this.powerMode === false) {
      this.currentTemp = 32;
    }
  }

  down1() {
    if (this.currentTemp <= 10) {
      this.currentTemp = 10;
    } else {
      this.currentTemp -= 1;
    }
  }

  upDownMany(amount) {
    this.currentTemp += amount;
    if (this.currentTemp < 10) {
      this.currentTemp = 10;
    } else if (this.currentTemp > 25 && this.powerMode === true) {
      this.currentTemp = 25;
    } else if (this.currentTemp > 32 && this.powerMode === false) {
      this.currentTemp = 32;
    }
  }

  cyclePowerMode() {
    if (this.powerMode === true) {
      this.powerMode = false;
    } else {
      this.powerMode = true;
    }
  }

  resetTemp() {
    this.currentTemp = 20;
  }

  energyUse() {
    if (this.currentTemp < 18) {
      return "low-usage";
    } else if (this.currentTemp <= 25) {
      return "medium-usage";
    } else if (this.currentTemp > 25) {
      return "high-usage";
    }
  }
}

module.exports = Thermostat;
