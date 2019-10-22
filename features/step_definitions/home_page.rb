Given /^I am on the home page and not logged in$/ do
  visit "/"
end
 
Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content text
end


Given /^I am on the home page and logged in$/ do
  visit "/"
end
