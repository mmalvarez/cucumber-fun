Given /^I have \$(\d+) in my account$/ do |amount|
  # TODO: code that puts money into user's account
  puts "something about money existing in an account"
end

When /^I transfer \$(\d+) from my (\w+) Account into my (\w+) Account$/ do |amount, source_account, dest_account|
  puts "Moving $#{amount} from #{source_account} into #{dest_account}"
end
