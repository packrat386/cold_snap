When(/^I go to "(.*?)"$/) do |url|
  visit url
end

Given(/^The temperature is "(.*?)"$/) do |temp|
  FactoryGirl.create(:forecast, curr_temp: temp)
end

Then(/^I will see the current temperature is "(.*?)"$/) do |temp|
  expect(page).to have_content("curr_temp: #{temp}")
end

Given(/^The high for today is "(.*?)"$/) do |temp|
  @f = FactoryGirl.create(:forecast)
  FactoryGirl.create(:weather_day, high: temp, forecast_id: @f.id)
end

Then(/^I will see a high of "(.*?)"$/) do |temp|
  expect(page).to have_content("high: #{temp}")
end

Given(/^The low for today is "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I will see a low of "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^The chance of precipitation is "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I will see a precipitation chance of "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end
