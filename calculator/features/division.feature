Feature: Division
  Scenario: Divide a number by another
    Given the input "100/2"
    When the calculator is run
    Then the output should be "50"
