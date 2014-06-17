Given(/^I am an admin$/) do
  @admin = FactoryGirl.create(:admin_user)
  visit new_admin_user_session_path
  fill_in "Email", with: @admin.email
  fill_in "Password", with: @admin.password
  click_on "Login"
end

Given(/^there is a camp session$/) do
  @camp_session = FactoryGirl.create(:camp_session)
end

Given(/^I am on the admin new camper page$/) do
  visit new_admin_camper_path
end

Given(/^I submit the new camper form correctly$/) do
  select @camp_session.name, from: "camper_camp_session_id"
  fill_in "Name", with: "Bart Simpson"
  fill_in "Account balance", with: 40
  click_on "Create Camper"
end

Then(/^I should see the camper's information$/) do
  expect(page).to have_content("Bart Simpson")
end
