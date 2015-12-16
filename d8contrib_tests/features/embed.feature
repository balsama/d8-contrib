@d8contrib @embed
Feature: Administrator should be able to view add embed button page.

@api
  Scenario: View Add Embed button page
    Given I am logged in as a user with the "Administrator" role
    When I visit "/admin/config"
    And I click "Text editor embed buttons"
    And I click "Add embed button"
    Then I should be on "admin/config/content/embed/button/add"
    # Test stops here because there won't be any providers unless additional
    # modules are enabled.

