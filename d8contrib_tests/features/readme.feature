@api @d8contrib @readme
  Feature: Front page
  When d8contrib is installed, its README file should be the contents of the front page.

@api
  Scenario: As an anonymous user, I should see d8contrib's README file's contents on the
  front page if d8contrib is installed.
    Given I am an anonymous user
    When I visit "/"
    Then I should see "The purpose of this module is to gather resources and test the readiness of critical Drupal 8 contrib modules as identified by our internal D8 DC Tracker."
