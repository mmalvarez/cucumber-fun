# debug crashed web scenarios
After do |scenario|
  save_and_open_page if scenario.failed?
end

# clean queue state
Before do
  BalanceStore.new.balance = 0
  TransactionQueue.clear
end
