Meta:

Narrative:
As a user
I want to perform an action
So that I can achieve a business goal

Scenario: I should not be able to withdraw more than I have on my accout
Given Account balance is 200 PLN
When I withdraw 500 PLN
Then Error message shows "Your account balance is too small to debit this amount"
And Different with the initial account balance and the current account balance is 0 PLN
And Account balance is 200 PLN


Scenario: I should be able to pay less or as much as I have on my account

Given Account balance is 200 PLN
When I withdraw <withdrawAmount> PLN
Then The payment amount is equal <withdrawAmount> PLN
And Account balance is <balanceAmount> PLN


    Examples:
      | withdrawAmount | balanceAmount       |
      | 0              | 200                 |
      | 50             | 150                 |
      | 100            | 100                 |
      | 150            | 50                  |
      | 200            | 0                   |



Scenario: I should be able to withdraw money and display the correct account balance after payment

Given Account balance is <initialBalance> PLN
When I withdraw <withdrawAmount> PLN
Then The payment amount is equal <withdrawAmount> PLN
And Account balance is <balanceAmount> PLN


    Examples:
        initialBalance     | withdrawAmount | balanceAmount       |
        200                | 500            | 200                 |
        200                | 201            | 200                 |
        200                | -58            | 200                 |
        200                | 0              | 200                 |
        200                | 0,12           | 199,88              |
        200                | 50             | 150                 |
        200                | 100            | 100                 |
        200                | 150            | 50                  |
        200                | 200            | 0                   |