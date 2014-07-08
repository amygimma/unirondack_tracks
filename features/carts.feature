Feature: Check out out items in a cart, applying discounts, processing donations and cash outs

Scenario: Adding items to a cart, applying a discount, and checking out
	Given I am logged in
	And there are categories with items
	And there is a cart for a camper
	When I visit that cart
	And I click on each item
	Then I should see those items in the cart
	And I should see my account balance reduced by the price the items
	And I should see the total price that equals the items
	When I apply a discount of 50%
	And I should see the total price that equals the items less 50%
	Then I should see the account balance reduced by the price the items less 50%
	When I click Checkout 
	Then I should see the cart with the new balance
	And I should not see any buttons
	And the account balance should be updated in the database
	And the inventory should be updated in the database

@javascript
Scenario: Donations and cashing out accounts
	Given I am logged in
	And there is a cart for a camper
	When I visit that cart
	And I submit a donation and cash out
	Then I should see the total of donation and cash out amounts
	When I click Checkout
	Then I should not see any buttons
	And I should see the total of donation and cash out amounts
