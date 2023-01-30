require 'string_builder'

RSpec.describe StringBuilder do
  it "test for string length" do
    something = StringBuilder.new()
    something.add("")
    result = something.output
    expect(result).to eq ""
  end

  it "test for string length" do
    something = StringBuilder.new()
    something.add("Jeff")
    result = something.output
    expect(result).to eq "Jeff"
  end
  it "test for string length" do
    something = StringBuilder.new()
    something.add("Jefferey")
    result = something.size
    expect(result).to eq 8
  end
end