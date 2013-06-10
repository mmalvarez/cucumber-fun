# encoding: utf-8"
# Whenever we see a currency amount as a captured argument, we convert it.
CAPTURE_CASH_AMOUNT = Transform /^(\$|£|€)(\d+)$/ do |currency_symbol, digits|
  # need to create Currency::Money class
  Currency::Money.new(digits.to_i, currency_symbol)
end
