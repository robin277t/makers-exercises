=begin
require 'present'

RSpec.describe Reminder do
  context "when no task is set" do
    it "fails" do
      reminder = Reminder.new("Kay")
      expect { reminder.remind() }.to raise_error "No reminder set!"
    end
  end
end
=end
############


require 'present'

RSpec.describe Present do
  context "when there is no gift" do
    it "fails" do
      gift = Present.new
      expect { gift.unwrap }.to raise_error "No contents have been wrapped."
    end
  end

  context "when there is a gift" do
    it "fails" do
      gift = Present.new
      gift.wrap("Cheese")
      expect { gift.wrap("wine") }.to raise_error "A contents has already been wrapped."
    end
  end
end