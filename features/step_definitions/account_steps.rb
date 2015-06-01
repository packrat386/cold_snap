Given(/^I visit the "(.*?)" page$/) do |url|
  visit url
end

Given(/^I enter "(.*?)" as my "(.*?)"$/) do |arg, selector|
  fill_in(selector, :with=> arg)
end

When(/^I click "(.*?)"$/) do |selector|
  click_button selector
end

Then(/^I should sign up successfully$/) do
  expect(page).to have_content('Success')
  user = User.find_by(username: 'vcarl')
  expect(user).not_to be_nil
end

Given(/^"(.*?)" and "(.*?)" are a valid username and password$/) do |uname, pword|
  @user = FactoryGirl.build(:user,
                        username: uname,
                        password: pword)
end

Then(/^I should be logged in$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^"(.*?)" and "(.*?)" are not a valid username and password$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should not be logged in$/) do
  pending # express the regexp above with the code you wish you had
end
