Given(/^I am signed out$/) do
  visit '/users/sign_out'
end

Given(/^I visit the "(.*?)" page$/) do |url|
  visit url
end

Given(/^I enter "(.*?)" as my email$/) do |email|
  fill_in(:user_email, :with => email)
end

Given(/^I enter "(.*?)" as my password$/) do |pword|
  fill_in(:user_password, :with => pword)
end

Given(/^I confirm "(.*?)" as my password$/) do |pword|
  fill_in(:user_password_confirmation, :with => pword)
end

When(/^I click "(.*?)"$/) do |selector|
  click_button selector
end

Then(/^There should be an account for "(.*?)"$/) do |email|
  user = User.find_by(email: email)
  expect(user).not_to be_nil
end

Given(/^"(.*?)" and "(.*?)" are a valid email and password$/) do |email, pword|
  visit '/users/sign_up'
  fill_in(:user_email, :with => email)
  fill_in(:user_password, :with => pword)
  fill_in(:user_password_confirmation, :with => pword)
  click_button('Sign up')
  expect(page).to have_content('signed up successfully')
  visit '/users/sign_out'
end

Then(/^I should be signed up$/) do
  expect(page).to have_content('signed up successfully')
end

Then(/^I should be logged in$/) do
  expect(page).to have_content('Signed in successfully')
end

Then(/^I should not be logged in$/) do
  expect(page).not_to have_content('Signed in successfully')  
end

Given(/^I log in as "(.*?)" with password "(.*?)"$/) do |email, pword|
  visit '/users/sign_up'
  fill_in(:user_email, :with => email)
  fill_in(:user_password, :with => pword)
  fill_in(:user_password_confirmation, :with => pword)
  click_button('Sign up')
  expect(page).to have_content('signed up successfully')
end

Then(/^I should be able to log in$/) do
  visit '/users/sign_in'
  expect(page).to have_content('Log in')
end
