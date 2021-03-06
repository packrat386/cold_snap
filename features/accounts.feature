Feature: accounts
  As a chicagoan
  I want to log into this app
  So that I can see the weather
  
  @nws_data
  Scenario: Create Account
    Given I am signed out
    And I visit the "/users/sign_up" page
    And I enter "vcarl@butts.com" as my email
    And I enter "secretsauce" as my password
    And I confirm "secretsauce" as my password
    When I click "Sign up"
    Then I should be signed up
    
    @nws_data
  Scenario: Successful Login
    Given I am signed out
    And "vcarl@butts.com" and "secretsauce" are a valid email and password
    And I visit the "/users/sign_in" page
    And I enter "vcarl@butts.com" as my email
    And I enter "secretsauce" as my password
    When I click "Log in"
    Then I should be logged in
    
    @nws_data
  Scenario: Unsuccessful Login
    Given I am signed out
    And "vcarl@butts.com" and "secretsauce" are a valid email and password
    And I visit the "/users/sign_in" page
    And I enter "vcarl" as my email
    And I enter "wrongsecret" as my password
    When I click "Log in"
    Then I should not be logged in
    
    @nws_data
  Scenario: Logout
    Given I log in as "vcarl@butts.com" with password "secretsauce"
    And I visit the "/users/sign_out" page
    Then I should be able to log in
