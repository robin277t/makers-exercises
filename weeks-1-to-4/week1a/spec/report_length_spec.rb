require 'report_length'

RSpec.describe "tests" do
    it "length test 1" do
        expect(report_length("Jeff")).to eq "This string was 4 characters long."
    end

    it "length test 1" do
        expect(report_length("Geoffrey the hobo")).to eq "This string was characters long."
    end
end