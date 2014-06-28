Feature: Campers Page

Scenario: It should have a campers page

  Given I am logged in
  And there are campers
  And there are sessions
  And on the campers path
  Then I should see "All Campers"
  And I should see campers
  And I should see an HTML select with camp sessions
