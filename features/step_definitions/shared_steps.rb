Given(/^I am an admin$/) do
  @admin = FactoryGirl.create(:admin_user)
  visit new_admin_user_session_path
  fill_in "Email", with: @admin.email
  fill_in "Password", with: @admin.password
  click_on "Login"
end

Given(/^I am logged in$/) do
  @user = FactoryGirl.create(:user)
  login_as(@user, :scope => :user)
end

Given(/^there are campers$/) do
  @camper = FactoryGirl.create(:camper)
end