Feature: Login

  @smoke
  Scenario: An user can open sign in page via home page
    Given home page of web application
    When I click Signin button on home page
    Then I should be redirected to login page

  @smoke
  Scenario: An user can sign in with correct credentials
    Given login page of web application
    When I fill login form with test data
    And I submit login form
    Then I should be redirected to account summary page
    And I should be logged in the system

  Scenario: An user can not sign in with blank data
    Given login page of web application
    When I fill login form with blank data
    And I submit login form
    Then I should see following text on login page:
    """
    Login and/or password are wrong.
    """

  Scenario: An user can not login with wrong password
    Given login page of web application
    When I fill form with wrong password
    And I submit login form
    Then I should see following text on login page:
    """
    Login and/or password are wrong.
    """


