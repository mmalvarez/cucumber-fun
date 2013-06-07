Feature: Cash Withdrawal
  Scenario: Successful withdrawal from an account in credit
    Given I have deposited $100 in my account
    When I request $20
    Then $20 should be dispensed
    And The balance of my account should be $80

  Scenario: Moving money from savings to checking
    Given I have $100 in my account
    When I transfer $500 from my Savings Account into my Checking Account
