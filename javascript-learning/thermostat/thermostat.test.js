thermostatget = require("./thermostat");

describe("thermostat class", () => {
  beforeEach(() => {
    thermostatInstance = new thermostatget();
  });

  it("inital temp of 20 deg", () => {
    expect(thermostatInstance.showTemp()).toBe(20);
  });

  it("up1 function works by 1 deg", () => {
    thermostatInstance.up1();
    expect(thermostatInstance.showTemp()).toBe(21);
  });

  it("down1 function works by 1 deg", () => {
    thermostatInstance.down1();
    expect(thermostatInstance.showTemp()).toBe(19);
  });

  it("upDownMany function works goin up 4 and down 8 deg", () => {
    thermostatInstance.upDownMany(4);
    thermostatInstance.upDownMany(-8);
    expect(thermostatInstance.showTemp()).toBe(16);
  });

  it("minimum temp possible is 10 degrees with bulk change", () => {
    thermostatInstance.upDownMany(-22);
    expect(thermostatInstance.showTemp()).toBe(10);
  });

  it("minimum temp possible is 10 degrees with 1 change", () => {
    thermostatInstance.upDownMany(-9);
    thermostatInstance.down1();
    thermostatInstance.down1();
    expect(thermostatInstance.showTemp()).toBe(10);
  });

  it("power saving mode on by default", () => {
    expect(thermostatInstance.powerMode).toBe(true);
  });

  it("power saving mode can be turned off, on, and back off again", () => {
    thermostatInstance.cyclePowerMode();
    expect(thermostatInstance.powerMode).toBe(false);
    thermostatInstance.cyclePowerMode();
    expect(thermostatInstance.powerMode).toBe(true);
    thermostatInstance.cyclePowerMode();
    expect(thermostatInstance.powerMode).toBe(false);
  });

  it("max temp allowed is 25 if power saving on", () => {
    thermostatInstance.upDownMany(20);
    expect(thermostatInstance.showTemp()).toBe(25);
  });

  it("max temp allowed is 32 if power saving off", () => {
    thermostatInstance.cyclePowerMode();
    thermostatInstance.upDownMany(20);
    expect(thermostatInstance.showTemp()).toBe(32);
  });

  it("max temp allowed is 32 if power saving off using up 1", () => {
    thermostatInstance.cyclePowerMode();
    thermostatInstance.upDownMany(12);
    thermostatInstance.up1();
    expect(thermostatInstance.showTemp()).toBe(32);
  });

  it("max temp allowed is 32 if power saving off using up 1", () => {
    thermostatInstance.cyclePowerMode();
    thermostatInstance.upDownMany(12);
    thermostatInstance.up1();
    thermostatInstance.resetTemp();
    expect(thermostatInstance.showTemp()).toBe(20);
  });

  it("displays current usage correctly default", () => {
    expect(thermostatInstance.energyUse()).toBe("medium-usage");
  });

  it("displays current usage high", () => {
    thermostatInstance.cyclePowerMode();
    thermostatInstance.upDownMany(10);
    expect(thermostatInstance.showTemp()).toBe(30);
    expect(thermostatInstance.energyUse()).toBe("high-usage");
  });

  it("displays current usage low", () => {
    thermostatInstance.cyclePowerMode();
    thermostatInstance.down1();
    thermostatInstance.down1();
    thermostatInstance.down1();
    expect(thermostatInstance.energyUse()).toBe("low-usage");
  });
});
