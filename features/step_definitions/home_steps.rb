Given(/^I am on the root path$/) do
  visit root_path
end

Then(/^I should see a nav bar and a logo$/) do
  expect(page).to have_content("Unirondack")
  expect(page).to have_css (".navbar")
end
