Given(/^there are sessions$/) do
  @camp_session = FactoryGirl.create(:camp_session)
end

Given(/^on the campers path$/) do
  visit campers_path
end

Then(/^I should see "(.*?)"$/) do |arg1|
  expect(page).to have_content(arg1)
end

Then(/^I should see campers$/) do
  expect(page).to have_content(@camper.name)
  expect(page).to have_css("div.camper")
end

Then(/^I should see an HTML select with camp sessions$/) do
  expect(page).to have_select("select_session", :with_options => ["All", @camp_session.name])
  puts @camp_session.to_s
end
