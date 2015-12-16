@api @d8contrib @config_update
  Feature: Configuration Update Manager
  Administrators should be able to see the differences between the configuration
  items provided by the current versions of your installed modules, themes, and
  install profile, and the configuration on your site.

@api
  Scenario: As an administrator, when I change a field's settings through the
  UI, I should be able to see that change reflected in the Config Update
  Manager.
    Given I am logged in as a user with the "Administrator" role
    And I visit "admin/structure/types/manage/page"
    And I select "2" from "preview_mode"
    And I press "op"
    And I visit "admin/config/development/configuration/report/diff/node_type/page"
    Then I should see "preview_mode : 2"

@api
  Scenario: When I revert an overriden config through Config Update Manage, I
  should see the change in the UI.
    Given I am logged in as a user with the "Administrator" role
    And I visit "admin/config/development/configuration/report/revert/node_type/page"
    And I press "op"
    And I visit "node/add/page"
    Then I should see the "Save as unpublished" button

