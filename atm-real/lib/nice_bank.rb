# encoding: utf-8"

# --------------------
# Object model
require_relative 'transaction_queue'
require_relative 'balance_store'

module Currency
  class Money
    def initialize(value, symbol)
      @value = value
      @symbol = symbol
    end
    def value
      @value or raise "Invalid Money object!"
    end
  end
end

class Account
  def initialize
    @queue = TransactionQueue.new
    @balance_store = BalanceStore.new
  end
  
  def balance
    @balance_store.balance
  end

  def credit(amount)
    @queue.write("+#{amount}")
  end

  def debit(amount)
    ##if balance >= amount
    ##  @balance -= amount
    ##  return true
    ##else
    ##  return false
    ##end
    @queue.write("-#{amount}")
  end
end

class Teller
  def initialize(cash_slot)
    @cash_slot = cash_slot
  end
  def withdraw_from(account, amount)
    res = account.debit amount
    if res
      @cash_slot.dispense amount
    else
      @cash_slot.dispense 0
    end
    return res
  end
end

class CashSlot
  def contents
    @contents or raise "I'm empty!!"
  end

  def dispense(amount)
    @contents = amount
  end
end

# --------------
# Sinatra Web UI

require 'sinatra'
get '/' do
  %{
  <html>
    <body>
      <form action="/withdraw" method="post">
        <label for="amount">Amount</label>
        <input type="text" id="amount" name="amount">
        <button type="submit">Withdraw</button>
      </form>
      <form action="/withdraw" method="post">
        <input type="hidden" id="amount20" name="amount" value="20">
        <button type="submit">$20</button>
      </form>
      <form action="/withdraw" method="post">
        <input type="hidden" id="amount30" name="amount" value="30">
        <button type="submit">$30</button>
      </form>
    </body>
  </html>
  }
end

set :cash_slot, CashSlot.new
set :account do
  fail 'account has not been set!'
end
set :res_string, ""
post '/withdraw' do
  teller = Teller.new(settings.cash_slot)
  res = teller.withdraw_from(settings.account, params[:amount].to_i)
  if res
    "Success!"
  else
    "The transaction failed: Insufficient Funds."
  end
end
