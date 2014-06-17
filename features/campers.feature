Feature: Campers

Scenario: Adding camper accounts
  Given I am an admin
  And I am on the admin new camper page
  And I fill out the form correctly
  Then I should see the camper's information
