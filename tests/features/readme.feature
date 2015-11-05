@api @d8contrib @readme
  Feature: Front page
  When d8contrib is installed, its README file should be the contents of the front page.

@api
  Scenario: As an anonymous user, I should see d8contrib's README file's contents on the
  front page if d8contrib is installed.
    Given I am an anonymous user
    When I visit "/"
    Then the response should contain "<h2>Background</h2>"
    And the response should contain "<h2>Coverage</h2>"
    And the response should contain "<h2>Install</h2>"
    And the response should contain "<h2>Test</h2>"
