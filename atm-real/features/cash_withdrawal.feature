Feature: Cash withdrawal
  Scenario: Successful withdrawal from my account in credit
    Given my account has been credited with $100
    When I withdraw $20
    Then $20 should be dispensed
    And the balance of my account should be $80

  Scenario: Successful withdrawal of $30 from my account in credit
    Given my account has been credited with $40
    When I withdraw $30
    Then $30 should be dispensed
    And the balance of my account should be $10
