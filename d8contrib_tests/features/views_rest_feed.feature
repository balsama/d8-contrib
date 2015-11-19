@api @d8contrib @views_rest_feed
  Feature: Views Rest Feed
  Administrators should be able to add a "REST Export Feed" display to a view
  and the feed should be available at the defined URL in the correct format.

@api
  Scenario: As an administrator, I should be able to add a REST Export Feed
  display to a view.
    Given I am logged in as a user with the "Administrator" role
    And I visit "admin/structure/views/view/content"
    And I press "edit-displays-top-add-display-rest-export-attachment"
    Then I should be on "admin/structure/views/view/content/edit/rest_export_attachment_1"
    And I visit "admin/structure/views/nojs/display/content/rest_export_attachment_1/style_options"
    And I select "csv" from "style_options[formats][csv]"
    And I press "edit-submit-views-ui-edit-display-form"
    Then I should be on "admin/structure/views/view/content/edit/rest_export_attachment_1"
    And I should see "You have unsaved changes"
    And I visit "admin/structure/views/nojs/display/content/rest_export_attachment_1/displays"
    And I select "page_1" from "displays[page_1]"
    And I press "edit-submit-views-ui-edit-display-form"
    Then I should be on "admin/structure/views/view/content/edit/rest_export_attachment_1"
    And I should see "You have unsaved changes"
    And I visit "admin/structure/views/nojs/display/content/rest_export_attachment_1/path"
    And I fill in "path" with "myfeed.csv"
    And I press "edit-submit-views-ui-edit-display-form"
    Then I should be on "admin/structure/views/view/content/edit/rest_export_attachment_1"
    And I should see "You have unsaved changes"
    And I visit "admin/structure/views/nojs/display/content/rest_export_attachment_1/access"
    And I select "none" from "access[type]"
    And I press "edit-submit-views-ui-edit-display-form"
    Then I should be on "admin/structure/views/view/content/edit/rest_export_attachment_1"
    And I should see "You have unsaved changes"
    And I press "edit-actions-submit"
    Then I should see "The view Content has been saved"

@api
  Scenario: As a user, I should be able to download a CSV from the defined path.
    Given I am an anonymous user
    When I visit "myfeed.csv"
    Then I should get a 200 HTTP response

@api
  Scenario: As an administrator, I should be able to change the request format.
    Given I am logged in as a user with the "Administrator" role
    And I visit "admin/structure/views/nojs/display/content/rest_export_attachment_1/style_options"
    And I select "json" from "style_options[formats][json]"
    And I press "edit-submit-views-ui-edit-display-form"
    Then I should be on "admin/structure/views/view/content/edit/rest_export_attachment_1"
    And I should see "You have unsaved changes"
    And I visit "admin/structure/views/nojs/display/content/rest_export_attachment_1/path"
    And I fill in "path" with "myfeed.json"
    And I press "edit-submit-views-ui-edit-display-form"
    Then I should be on "admin/structure/views/view/content/edit/rest_export_attachment_1"
    And I should see "You have unsaved changes"
    And I press "edit-actions-submit"
    Then I should see "The view Content has been saved"

@api
  Scenario: As a user, I should no longer be able to visit the CSV download and
  I should be able to view the json feed.
    Given I am an anonymous user
    When I go to "myfeed.csv"
    Then I should get a 404 HTTP response
    When I visit "myfeed.json"
    Then I should get a 200 HTTP response

