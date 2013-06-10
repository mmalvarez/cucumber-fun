# encoding: utf-8"

module KnowsTheUserInterface
  class UserInterface
    include Capybara::DSL
    
    def withdraw_from(account, amount)
      Sinatra::Application.account = account
      
      case amount
      when 20
        visit '/'
        click_button '$20'
      when 30
        visit '/'
        click_button '$30'
      else
        visit '/'
        fill_in "Amount", :with => amount
        click_button 'Withdraw'
      end
      Sinatra::Application.res_string = page.body
    end
  end
  
  def my_account
    @my_account ||= Account.new
  end
  def cash_slot
    Sinatra::Application.cash_slot
  end
  def teller
    @teller ||= UserInterface.new
  end
end

World KnowsTheUserInterface
