Feature: Currency Exchange

  @smoke
  Scenario Outline: An user can purchase foreign currency cash
    Given login page of web application
    And I fill login form with test data
    And I submit login form
    When I click Pay Bills menu item on account summary page
    And I click Purchase Foreign Currency tab
    And Fill in Purchase foreign currency cash form with the next data:
      | currency      | amount       | currency_amount   |
      | <currency>    | <amount>     | <currency_amount> |
    And I click Purchase button
    Then I should see following text on pay bills page:
    """
    Foreign currency cash was successfully purchased.
    """

    Examples:
    | currency              | amount          |currency_amount        |
    | Australia (dollar)    | 100             | U.S. dollar (USD)     |
    | Switzerland (franc)   | 1               | Selected currency     |