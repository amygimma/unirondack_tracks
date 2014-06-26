Given(/^I am on the campers path$/) do
  visit campers_path
end

Then(/^I should see a "(.*?)"$/) do |arg1|
  expect(page).to have_content("All Campers")
end

