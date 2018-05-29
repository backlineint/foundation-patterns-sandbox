#!/bin/bash

cd ../drupal-project

# Clone projects first?

lando start

#lando composer install

lando drush si standard -y --db-url='mysql://drupal8:drupal8@database/drupal8' --site-name='Foundation Patterns' --account-name=admin --account-pass=admin

# Install required modules and themes
# Todo - install with config instead.

lando drush en -y components ui_patterns

lando drush theme:enable -y zurb_foundation,foundation_patterns

lando drush cset system.theme default foundation_patterns -y

lando drush en -y foundation_patterns_config_marketing

lando drush cr