Given(/^I am on the admin new items page$/) do
  visit new_admin_item_path
end

Given(/^there are items$/) do
  @item_1 = FactoryGirl.create(:item)
  @item_2 = FactoryGirl.create(:item, name: "T-shirt")
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

When(/^I visit the items index$/) do
  visit items_path
end

Then(/^I should see all of the items' info$/) do
    expect(page).to have_content(@item_1.name)
    expect(page).to have_content(@item_2.name)
end

