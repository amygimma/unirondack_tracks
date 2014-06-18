Given(/^I am on the admin new items page$/) do
  visit new_admin_item_path
end

When(/^I fill in valid info$/) do
  fill_in "Name", with: "Sweatshirt"
  fill_in "Price", with: 20
  fill_in "Quantity", with: 40
  click_on "Create Item"
end

Then(/^I should see that my item was created$/) do
  expect(page).to have_content("Created At")
end