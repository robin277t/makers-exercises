require 'gratitudes'

RSpec.describe Gratitudes do
  it "tests for blank" do
    grat = Gratitudes.new
    expect(grat.format).to eq "Be grateful for: "
  end

  it "tests for list of gratitudes" do
    grat = Gratitudes.new
    # why doesn't .new.add("cheese") work?
    grat.add("cheese")
    expect(grat.format).to eq "Be grateful for: cheese"
  end

  it "tests multiple gratitudes" do
    grat = Gratitudes.new
    grat.add("cheese")
    grat.add("pizza")
    expect(grat.format).to eq "Be grateful for: cheese, pizza"
  end
end