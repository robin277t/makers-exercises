require 'greet'

RSpec.describe "first test" do
    it "greeter works?" do
        expect(greet("Jeff")).to eq "Hello, Jeff!"
    end
end
