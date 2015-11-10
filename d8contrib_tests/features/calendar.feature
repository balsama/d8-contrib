@d8contrib @calendar
Feature: Calendar
  When the calendar module enabled
  An Administrator should be able to create simple calendar view
Background:
  Given I am logged in as a user with the "Administrator" role

@api @javascript
Scenario: Administrators can create a calendar view
  When I visit "admin/structure"
  And I click "Views"
  And I click "Add new view"
  And I fill in "label" with "mycal"
  And I wait 3 seconds
  And I press "Save and edit"
  Then I should see "The view mycal has been saved." in the "highlighted"
  And I click "Change the way content is formatted."
  And I wait for AJAX to finish
  Then I should see "Master: How should this view be styled"
  And I should see "Calendar"
  And I select "calendar" from "style[type]"
  And I click the element with CSS selector "button.button--primary"
  And I wait for AJAX to finish
  Then I should see "Master: Style options"
  And I select "week" from "style_options[calendar_type]"
  And I click the element with CSS selector "button.button--primary"
  And I press "Save" in the "content"
  And I am on "admin/structure/views/view/mycal"
  And I click "Fields"
  And I wait for AJAX to finish
  Then I should see "Master: How should each row in this view be styled"
  And I select "calendar_row" from "row[type]"
  And I click the element with CSS selector "button.button--primary"
  And I wait for AJAX to finish
  And I click the element with CSS selector "button.button--primary"
  And I press "Save" in the "content"
  And I am on "admin/structure/views/view/mycal"
  And I click "Advanced"
  And I click the element with CSS selector "a#views-add-argument"
  And I wait for AJAX to finish
  And I fill in "override[controls][options_search]" with "Calendar contextual filter for created"
  And I wait for AJAX to finish
  And I check "name[node_field_data.created_calendar]"
  And I click the element with CSS selector "button.button--primary"
  And I wait for AJAX to finish
  And I click the element with CSS selector "button.button--primary"
  And I am on "admin/structure/views/view/mycal"
  And I click the element with CSS selector "input#edit-actions-submit"
  Then I should see "The view mycal has been saved." in the "highlighted"
  And I should see "Fri" in the "content"
  And I should see the css selector "div.calendar-calendar"