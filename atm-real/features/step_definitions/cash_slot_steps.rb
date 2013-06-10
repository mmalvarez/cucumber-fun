# encoding: utf-8"
Then /^\$(\d+) should be dispensed$/ do |value|
  cash_slot.contents.should == value.to_i
end

Then /^nothing should be dispensed$/ do
  cash_slot.contents.should == 0
end
