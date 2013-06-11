# encoding: utf-8"

Given /^my account has been credited with (#{CAPTURE_CASH_AMOUNT})$/ do |amount|
  my_account.credit(amount.value)
end

Then /^the balance of my account should be (#{CAPTURE_CASH_AMOUNT})$/ do |amount|
  # sleep 1
  my_account.balance.should eq(amount.value),
    "Expected the balance to be #{amount.value} but it was #{my_account.balance}"
end
