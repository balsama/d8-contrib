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
* Focal Point
* Embed
* Configuration Update Manager

### Limited test coverage
* Entity Embed
* Entity Browser

### Need work (tests not included)
* Entity Print

### Roadmap (next month)
* Metatag
* Calendar
* Views data export

See the `d8contrib.make` file for exact versions or commit hashes tested against.

## Install

1. Download this module and place it in your modules directory
2. From docroot:

```
drush make --no-core -y modules/d8contrib/d8contrib.make

#install address dependencies
php modules/composer_manager/scripts/init.php
composer drupal-update commerceguys/intl commerceguys/addressing commerceguys/zone mikehaertl/phpwkhtmltopdf

drush en -y d8contrib
```
## Test
1. Move the `d8contrib_tests` directory into docroot.
2. Copy the `behat.local.example.yml` file to `behat.local.yml` and update
   `BASE_PATH` to match your installation.
3. From within the moved `d8contrib_tests` directory, run `composer install`.
4. Start the selenium-server-standalone `bin/selenium-server-standalone -port 4445`
5. Execute the test scenarios tagged as d8contrib:

```
bin/behat --tags=d8contrib --profile=dev
```
