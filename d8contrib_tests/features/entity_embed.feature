@d8contrib @entity_embed
Feature: Administrators can see Entity Embed settings on the configuration screen

@api
Scenario: Administrators should see Embed entity settings when Entity is selected as an embed provider
  Given I am logged in as a user with the "Administrator" role
  And I visit "admin/config/content/embed/button/manage/testbutton"
  And the "label" field should contain "testbutton"
  And the "type_id" field should contain "Entity"
  And the "type_settings[entity_type]" field should contain "node"
  And the "type_settings[bundles][page]" checkbox should be checked
  And the "type_settings[display_plugins][entity_reference:entity_reference_entity_view]" checkbox should be checked
  And the "type_settings[display_plugins][entity_reference:entity_reference_entity_id]" checkbox should be checked
  And the "type_settings[display_plugins][entity_reference:entity_reference_label]" checkbox should be checked

