Scenario: A user attempts to withdraw more money than they have in their account
    Given John has a valid Credit or Debit card
    And his account balance is $20
    When he inserts his card
    And withdraws $40
    Then the ATM displays an error
    And returns his card
    But his balance remains $20
