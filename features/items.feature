Feature: Items

Scenario: Adding items to the store

  Given I am an admin
  And I am on the admin new items page
  When I fill in valid info
  Then I should see that my item was created

Scenario: Seeing items in the store
   Given I am a user
   And I am signed in
   And there are items
   When I visit the items index
   Then I should see all of the items' info

