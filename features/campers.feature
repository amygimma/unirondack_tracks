Feature: Campers

Scenario: Adding camper accounts
  Given I am an admin
  And there is a camp session
  And I am on the admin new camper page
  And I submit the new camper form correctly
  Then I should see the camper's information
