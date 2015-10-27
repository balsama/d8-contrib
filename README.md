## Install

1. Download this module and place it in your modules directory
2. From docroot:

```
drush make --no-core -y modules/d8contrib/d8contrib.make
drush en -y d8contrib
```
## Test
1. Move the `d8contrib_tests` directory into docroot.
2. From within the moved `d8contrib_tests` directory, run `composer install`.
3. Execute the test scenarios tagged as d8contrib:

```
bin/behat --tags=d8contrib --profile=dev
```

