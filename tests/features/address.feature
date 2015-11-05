@d8contrib @address
Feature: Administrator can create address fields
  An Administrator should be able to create an address field.

@api
  Scenario: Administrators can create address fields on a Article node type
    Given I am logged in as a user with the "Administrator" role
    When I visit "/admin/structure/types/manage/article/fields"
    And I click "Add field"
    And I should see the CSS selector "select"
    And I select "Address" from "new_storage_type"
    And I press "op"
    And I fill in "label" with "myaddress"
    And I fill in "field_name" with "myaddress"
    And I press "op"
    And I press "op"
    And I select "United States" from "settings[available_countries][]"
    And the "settings[fields][administrativeArea]" checkbox should be checked
    And the "settings[fields][locality]" checkbox should be checked
    And the "settings[fields][dependentLocality]" checkbox should be checked
    And the "settings[fields][postalCode]" checkbox should be checked
    And the "settings[fields][sortingCode]" checkbox should be checked
    And the "settings[fields][addressLine1]" checkbox should be checked
    And the "settings[fields][addressLine2]" checkbox should be checked
    And the "settings[fields][organization]" checkbox should be checked
    And the "settings[fields][recipient]" checkbox should be checked
    And I press "op"

@api
  Scenario: Administrators can input an address on a Article node type
    Given I am logged in as a user with the "Administrator" role
    And I am on "node/add/article"
    And I fill in "title[0][value]" with "Fenway Park"
    Then I select "United States" from "field_myaddress[0][country_code]"
    And I press "Preview"
    And I fill in "field_myaddress[0][recipient]" with "David Ortiz"
    And I fill in "field_myaddress[0][address_line1]" with "4 Yawkey Way"
    And I fill in "field_myaddress[0][locality]" with "Boston"
    Then I select "Massachusetts" from "field_myaddress[0][administrative_area]"
    And I fill in "field_myaddress[0][postal_code]" with "02215"
    And I press "Save and publish"
    And I should see "David Ortiz"
    And I should see "4 Yawkey Way"
    And I should see "Boston, MA 02215"
    And I should see "United States"

