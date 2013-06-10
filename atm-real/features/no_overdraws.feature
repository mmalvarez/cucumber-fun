Feature: Prevent users from going overdrawn
  Scenario: I try to withdraw more than my balance
    Given my account has been credited with $50
    When I withdraw $60
    Then nothing should be dispensed
    And I should be told that I have insufficient funds in my account
