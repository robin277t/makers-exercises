require 'counter'

RSpec.describe Counter do
    it "pass the test?" do
        counter = Counter.new()
        counter.add(3)    
        result = counter.report
        expect(result).to eq "Counted to 3 so far"
    end

    it "pass the test?" do
        counter = Counter.new()
        counter.add(3)
        counter.add(100)    
        result = counter.report
        expect(result).to eq "Counted to 103 so far"
    end

    it "works with floats" do
        counter = Counter.new()
        counter.add(20)
        counter.add(5.4)    
        result = counter.report
        expect(result).to eq "Counted to 25.4 so far"
    end

=begin
RSpec.describe Counter do
    it "works with strings" do
        counter = Counter.new()
        counter.add("str")   
        result = counter.report
        expect(result).to eq "Counted to 0str so far"
    end
=end
end