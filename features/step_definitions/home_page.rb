Given /^I am on the home page and not signed in$/ do
  visit "/"
end
 
Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content text
end


Given /^I am on the home page and signed in$/ do
  visit "/"
end
