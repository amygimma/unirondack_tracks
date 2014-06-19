Given(/^I am an admin$/) do
  @admin = FactoryGirl.create(:admin_user)
  visit new_admin_user_session_path
  fill_in "Email", with: @admin.email
  fill_in "Password", with: @admin.password
  click_on "Login"
end


Given(/^I am a user$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I am signed in$/) do
  pending # express the regexp above with the code you wish you had
end