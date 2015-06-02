Feature: daily_weather
  As a chicagoan
  I want to see the weather today
  So that I can stay warm and dry

Scenario: Is Raining
  Given It is raining
  When I go to "/"
  Then I will see that it is raining

Scenario: Is not Raining
  Given It is not raining
  When I go to "/"
  Then I will see that it is not raining

Scenario: Current Temp
  Given The temperature is "85"
  When I go to "/"
  Then I will see the current temperature is "85"

Scenario: View High Temp
  Given The high for today is "86"
  When I go to "/"
  Then I will see a high of "86"

Scenario: View Low Temp
  Given The low for today is "78"
  When I go to "/"
  Then I will see a low of "78"

Scenario: View Precip Chance
  Given The chance of precipitation is "30%"
  When I go to "/"
  Then I will see a precipitation chance of "30%"
