Feature: accounts
  As a chicagoan
  I want to log into this app
  So that I can see the weather

  Scenario: Create Account
    Given I visit the signup page
    And I enter vcarl as my username
    And I enter secret as my password
    And I enter vcarl@butts.com as my email
    When I click signup
    Then I should sign up successfully
    
