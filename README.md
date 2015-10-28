## Current Build
[![Build Status](https://travis-ci.org/balsama/d8contrib.svg?branch=8.x-1.x)](https://travis-ci.org/balsama/d8contrib)  
[See it on Travis](https://travis-ci.org/balsama/d8contrib)

## Background
The purpose of this module is to gather resources and test the readiness of
critical Drupal 8 contrib modules as identified by our internal D8 DC Tracker.

It should be installed on top of Lightning. Modules to be tested that are *not*
included as part of Lightning are automatically pulled in via this module's make
file. See the contained make file for the specific versions/commits that are
used.

Functional tests are included for each module. See the #tests section below for
instructions on how to run the tests locally, or reference the Travis.ci status
above for the latest build results.

## Coverage
Currently, this module has feature test coverage for the following modules:

### Passing
* Address
* Field Collection
* Focus Point
* Embed

### Need work (tests not included)
* Entity Embed
* Entity Browser

**Entity Embed Active Bugs**  
* Embed button does not work (2596487) - Active
* Prevent the same field formatter from showing up multiple times (2350493) - Active
* <drupal-entity>is not replaced when twig debugging is enabled (2541984) - Active
* <drupal-entity> tag not being automatically added when an Entity Embed button is added to active editor toolbar (2554687) - Active
* Manual embed should not get an option to Edit Entity (2544018) - Active

**Entity Browser Active Bugs**  
* Modal display assumes single-step workflow (2403331)
* Clicking "Save" on an Entity Browser saves the Entity Browser entity (2600708)
* $instance_uuid not passed to RegisterJSCallbacks::__construct() in built in Displays (2600706)

See the `d8contrib.make` file for exact versions or commit hashes tested against.

## Install

1. Download this module and place it in your modules directory
2. From docroot:

```
drush make --no-core -y modules/d8contrib/d8contrib.make

#install address dependencies
php modules/composer_manager/scripts/init.php
composer drupal-update commerceguys/intl commerceguys/addressing commerceguys/zone

drush en -y d8contrib
```
## Test
1. Move the `d8contrib_tests` directory into docroot.
2. Copy the `behat.local.example.yml` file to `behat.local.yml` and update
   `BASE_PATH` to match your installation.
3. From within the moved `d8contrib_tests` directory, run `composer install`.
4. Execute the test scenarios tagged as d8contrib:

```
bin/behat --tags=d8contrib --profile=dev
```

