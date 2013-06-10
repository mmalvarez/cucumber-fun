# encoding: utf-8"

Then /^I should be told that I have insufficient funds in my account$/ do

  Sinatra::Application.res_string.should ==
    "The transaction failed: Insufficient Funds."
end

