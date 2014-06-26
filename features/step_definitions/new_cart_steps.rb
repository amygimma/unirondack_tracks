Given(/^I am on the new cart path$/) do
  visit new_cart_path
end

Then(/^I should see "(.*?)"$/) do |arg1|
  expect(page).to have_content("Start a Cart")
end
