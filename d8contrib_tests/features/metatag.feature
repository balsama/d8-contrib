@d8contrib @metatag @javascript
Feature: metatag
  When the metatag module is enabled
  an administrator should be able to add or edit default metatag values

Background:
  Given I am logged in as a user with the "Administrator" role

@api
Scenario: An Administrator can add a metatag field to an article node type
  And I am on "admin/structure/types/manage/article/fields"
  And I click "Add field"
  And I select "metatag" from "new_storage_type"
  And I fill in "label" with "Meta tags"
  And I wait 2 seconds
  And I press "op"
  And I should see "Metatag fields must be singular."
  And I press "op"
  And I press "op"
  Then I should see "Saved Meta tags configuration." in the "highlighted"

@api
Scenario: As an Administrator I should be able to add default metatag values
  And I am on "admin/structure/types/manage/article/fields/node.article.field_meta_tags"
  And I click "Meta tags"
  And I fill in "default_value_input[field_meta_tags][0][basic][title]" with "a lightning title"
  And I fill in "default_value_input[field_meta_tags][0][basic][description]" with "a lightning description"
  And I fill in "default_value_input[field_meta_tags][0][basic][keywords]" with "a lightning keyword"
  And I fill in "default_value_input[field_meta_tags][0][basic][abstract]" with "a lightning abstract"
  And I press "op"
  Then I should see "Saved Meta tags configuration." in the "highlighted"

@api
Scenario: An Administrator should see the metatags default values when creating a node
  When I am on "node/add/article"
  And I click "Meta tags"
  Then the "field_meta_tags[0][basic][title]" field should contain "a lightning title"
  And the "field_meta_tags[0][basic][description]" field should contain "a lightning description"
  And the "field_meta_tags[0][basic][keywords]" field should contain "a lightning keyword"
  And the "field_meta_tags[0][basic][abstract]" field should contain "a lightning abstract"

@api
Scenario: An Administrator should be able to change the default metatag values on node creation
  When I am on "node/add/article"
  And I fill in "title[0][value]" with "test"
  And I click "Meta tags"
  And I fill in "field_meta_tags[0][basic][title]" with "a custom lightning title"
  And I fill in "field_meta_tags[0][basic][description]" with "a custom lightning description"
  And I fill in "field_meta_tags[0][basic][keywords]" with "a custom lightning keyword"
  And I fill in "field_meta_tags[0][basic][abstract]" with "a custom lightning abstract"
  And I press "op"
