@d8contrib @entity_embed
Feature: Entity Embed
  A user with an administrator role
  should be able to configure the settings
  for the Entity Embed module

Background:
  Given I am logged in as a user with the "administrator" role

@api
Scenario: Administrators should see the Embed Buttons link on the configuration page
  When I visit "admin/config"
  Then I should see the link "Embed buttons"

@api @javascript
Scenario: Administrator should be able to configure the Entity Embed buttons
  When I am on "admin/config"
  And I click "Embed buttons"
  Then I should be on "admin/config/content/embed"
  And I should see the link "Add embed button"
  Then I click "Add embed button"
  And I should be on "admin/config/content/embed/button/add"
  And I fill in "label" with "mybutton"
  And I select "Entity" from "type_id"
  And I wait for AJAX to finish
  And I select "node" from "type_settings[entity_type]"
  And I check the box "type_settings[bundles][article]"
  And I check the box "type_settings[bundles][page]"
  And I check the box "type_settings[display_plugins][entity_reference:entity_reference_entity_view]"
  And I check the box "type_settings[display_plugins][entity_reference:entity_reference_entity_id]"
  And I check the box "type_settings[display_plugins][entity_reference:entity_reference_label]"
  And I press the "Save" button
  Then I should see "mybutton" in the "content"

@api
Scenario: Administrators should be able to enable the entity-embed filter for the basic html text format
  When I am on "admin/config/content/formats/manage/basic_html"
  And I check "filters[entity_embed][status]"
  And I fill in "filters[filter_html][settings][allowed_html]" with " <drupal-entity> "
  And I press "op"
  And I break

@api
Scenario: Administrators should be able to enable the entity-embed filter for the full html text format
  When I am on "admin/config/content/formats/manage/full_html"
  And I check "filters[entity_embed][status]"
  And I press "op"
