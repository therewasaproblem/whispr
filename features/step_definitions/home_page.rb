Given /^I am on the home page and not signed in$/ do
  visit '/'
end

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content text
end

Given /^I am on the home page and signed in$/ do
  User.create(:email => "test@cucumber.com", :password => "123456")
  visit '/users/sign_in'
  fill_in "user_email", :with => "test@cucumber.com"
  fill_in "user_password", :with => "123456"
  click_button "Log in"
end
