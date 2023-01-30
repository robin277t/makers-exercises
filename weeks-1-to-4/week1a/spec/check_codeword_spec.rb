require 'check_codeword'

RSpec.describe "tests" do
    it "test horse" do
        expect(check_codeword("horse")).to eq "Correct! Come in."
    end

    it "test h and e short" do
        expect(check_codeword("he")).to eq "Close, but nope."
    end

    it "test h and e long" do
        expect(check_codeword("hxxxxxxxxe")).to eq "Close, but nope."
    end

    it "test h and e long" do
        expect(check_codeword("")).to eq "WRONG!"
    end

    it "test h and e long" do
        expect(check_codeword("sfgdfgdfa")).to eq "WRONG!"
    end
end