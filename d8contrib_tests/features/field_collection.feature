@d8contrib @field_collection
Feature: Field Collection
  Basic functional tests for the Field Collection module.

@api
  Scenario: Check FAQ content type is present
    # FAQ Content type (which contains a field collection field and is used in
    # later tests) is provided upon install of the D8 Contrib module.
    Given I am logged in as a user with the "administrator" role
    When I visit "/admin/structure/types"
    Then I should see "FAQ"

@api
  Scenario: View data stored in Field Collection fields
    Given I am viewing the Sample FAQ:
    # Content is defined in the "I am viewing the Sample FAQ" Feature Context.
    Then I should see "Sample Question"
    And I should see "jumping zebras"

