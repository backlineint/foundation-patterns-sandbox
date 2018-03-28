#!/bin/bash

lando start

lando composer install

# TODO - create synced volumes rather than symlinking
lando ssh appserver -c "mkdir /app/web/themes/custom"
lando ssh appserver -c "ln -sf /app/foundation_patterns /app/web/themes/custom/foundation_patterns"
lando ssh appserver -c "mkdir /app/web/modules/custom"
lando ssh appserver -c "ln -sf /app/foundation_patterns_config /app/web/modules/custom/foundation_patterns_config"

lando drush si standard -y --db-url='mysql://drupal8:drupal8@database/drupal8' --site-name='Foundation Patterns' --account-name=admin --account-pass=admin