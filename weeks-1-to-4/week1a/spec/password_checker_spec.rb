# tests to do
# 1. serve up password of 7 or less characters, get fail message
# 2. serve up password of 8 or more characters, check true

require 'password_checker'

RSpec.describe do
    it "is it long enough" do
        pw = PasswordChecker.new
        expect(pw.check("xyzxxxxxx")).to eq true
    end

    it "is it long enough" do
        pw = PasswordChecker.new
        expect{pw.check("xyz")}.to raise_error "Invalid password, must be 8+ characters."
    end

end