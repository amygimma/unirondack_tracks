Given(/^there are categories with items$/) do
	cat_1 = FactoryGirl.create(:category, name: "hats", price: 8.50)
	cat_2 = FactoryGirl.create(:category, name: "popsicles")

  @item_1 = FactoryGirl.create(:item, category: cat_1)
  @item_2 = FactoryGirl.create(:item, category: cat_2, name: "popsicle", flavor: "cherry", price: 1.00)
end

Given(/^there is a cart for a camper$/) do
  @camper = FactoryGirl.create(:camper)
end

When(/^I visit that cart$/) do
  cart = FactoryGirl.create(:cart, camper: @camper)
 	visit cart_path(cart)
end

When(/^I click on each item$/) do
  click_on(@item_1.name)
  click_on(@item_2.name)
end


Then(/^I should see those items in the cart$/) do
  within '.cart' do
  	expect(page).to have_content(@item_1.name)
  	expect(page).to have_content(@item_1.name)
  end
end

Then(/^I should see my account balance reduced by the price the items$/) do
  within '.cart' do
  	expect(page).to have_content( (@camper.account_balance - @item_1.price - @item_2.price) )
  end
end

Then(/^I should see the total price that equals the items$/) do
  within '.cart' do
  	expect(page).to have_content( (@item_1.price + @item_2.price) )
  end
end

When(/^I apply a discount of (\d+)%$/) do |percentage|
	fill_in "Discount", with: percentage.to_f/100
	click_on "Add to Total"
end

Then(/^I should see the total price that equals the items less (\d+)%$/) do |percentage|
	total = (@item_1.price + @item_2.price)
	discounted_amount = (@item_1.price + @item_2.price) * percentage.to_f/100
	@total_after_discount = total - discounted_amount
  expect(page).to have_content( @total_after_discount )
end

Then(/^I should see the account balance reduced by the price the items less (\d+)%$/) do |percentage|
 	expect(page).to have_content(@camper.account_balance - @total_after_discount)
end

When(/^I click Checkout$/) do
  click_on "Checkout"
end

Then(/^I should see the cart with the new balance$/) do
	cart = Cart.last
  expect(page).to have_content(cart.camper.account_balance)
end

Then(/^I should not see any buttons$/) do
  expect(page).to_not have_css('.btn')
end

Then(/^the account balance should be updated in the database$/) do
  expect(Camper.first.account_balance).to eq(@camper.account_balance - @total_after_discount)
end


Then(/^the inventory should be updated in the database$/) do
  expect(Item.first.quantity).to eq(@item_1.quantity - 1)
  expect(Item.last.quantity).to eq(@item_2.quantity - 1)
  expect(Item.first.sold).to eq( @item_1.sold + 1)
  expect(Item.last.sold).to eq(@item_2.sold + 1)
end

When(/^I submit a donation and cash out$/) do
  fill_in "Donation", with: 20.00
  find("#cart_cash_out").set(5.55)
  click_on "Add to Total"
end

Then(/^I should see the total of donation and cash out amounts$/) do
  expect(page).to have_content(25.55)
end