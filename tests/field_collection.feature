@lightning @content_types
Feature: Field Collection
  Basic functional tests for the Field Collection module.

  @api
  Scenario: Check Article content type is present
    Given I am logged in as a user with the "administrator" role
    When I visit "/admin/structure/types"
    Then I should see "Article"
    Then I should see "Basic page"
    Then I should see "Landing Page"
