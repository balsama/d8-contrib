Feature: Field Collection
  Basic functional tests for the Field Collection module.

  #@api
  #Scenario: Check FAQ content type is present
  # Given I am logged in as a user with the "administrator" role
  # When I visit "/admin/structure/types"
  # Then I should see "FAQ"

  #@api
  #Scenario: Create FAQ node with Field Collection
  # Given "faq" content:
  # | title    | field_question    | field_answer    |
  # | My FAQ   | My First Question | My first answer |
  # And I am logged in as a user with the "administrator" role
  # When I go to "admin/content"
  # Then I should see "My FAQ"

@api
  Scenario: View data stored in Field Collection fields
    Given I am viewing the Sample FAQ:
    Then I should see "Question"
    
