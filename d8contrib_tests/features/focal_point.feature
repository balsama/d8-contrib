@api @d8contrib @focal_point @javascript
Feature: Focal Point
  Administrators with the ability to upload images should be able to select a focal point on an uploaded image.

  Scenario: Administrators can select a focal point on an uploaded image
    Given I am logged in as a user with the "Administrator" role
    And I visit "node/add/article"
    And I fill in "title[0][value]" with "mynode2"
    And I attach the file "drupal8.png" to "files[field_image_0]"
    And I wait for AJAX to finish
    Then I should see the CSS selector ".focal-point-indicator"

