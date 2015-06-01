Feature: accounts
  As a chicagoan
  I want to log into this app
  So that I can see the weather

  Scenario: Create Account
    Given I visit the "users/sign_up" page
    And I enter "vcarl@butts.com" as my "email"
    And I enter "secret" as my "password"
    When I click "Sign up"
    Then I should sign up successfully
    
  Scenario: Successful Login
    Given "vcarl" and "secret" are a valid username and password
    And I visit the "login" page
    And I enter "vcarl" as my "username"
    And I enter "secret" as my "password"
    When I click "Log in"
    Then I should be logged in
    
  Scenario: Unsuccessful Login
    Given "vcarl" and "secret" are not a valid username and password
    And I visit the "login" page
    And I enter "vcarl" as my "username"
    And I enter "secret" as my "password"
    When I click "Log in"
    Then I should not be logged in
    
