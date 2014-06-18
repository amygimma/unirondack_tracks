Feature: Items

Scenario: Adding items to the store

  Given I am an admin
  And I am on the admin new items page
  When I fill in valid info
  Then I should see that my item was created