@api @d8contrib @focal_point
Feature: Focal Point
  Administrators with the ability to configure styles that can be used for
  resizing or adjusting new images should be able to see the focal point crop
  and focal point scale and crop styles.

@api
Scenario: Focal Point Scale and Crop effect is exists for Medium image style
  Given I am logged in as a user with the "Administrator" role
  And I visit "admin/config/media/image-styles/manage/medium"
  And I should see the CSS selector "select"
  Then I select "Focal Point Scale and Crop" from "new"

@api
Scenario: Focal Point Scale and Crop effect exists for Large image style
  Given I am logged in as a user with the "Administrator" role
  And I visit "admin/config/media/image-styles/manage/large"
  And I should see the CSS selector "select"
  Then I select "Focal Point Scale and Crop" from "new"

@api
Scenario: Focal Point Scale and Crop effect exists for Thumbnail image style
  Given I am logged in as a user with the "Administrator" role
  And I visit "admin/config/media/image-styles/manage/thumbnail"
  And I should see the CSS selector "select"
  Then I select "Focal Point Scale and Crop" from "new"

@api
Scenario: Focal Point Crop effect exists for Medium image style
  Given I am logged in as a user with the "Administrator" role
  And I visit "admin/config/media/image-styles/manage/medium"
  And I should see the CSS selector "select"
  Then I select "Focal Point Crop" from "new"

@api
Scenario: Focal Point Crop effect exists for Large image style
  Given I am logged in as a user with the "Administrator" role
  And I visit "admin/config/media/image-styles/manage/large"
  And I should see the CSS selector "select"
  Then I select "Focal Point Crop" from "new"

@api
Scenario: Focal Point Crop effect exists for Thumbnail image style
  Given I am logged in as a user with the "Administrator" role
  And I visit "admin/config/media/image-styles/manage/thumbnail"
  And I should see the CSS selector "select"
  Then I select "Focal Point Crop" from "new"

