#!/bin/bash

# TODO - I'd prefer to bake more of this into the Docker build, but this does the trick for now.

# Install Drupal
docker exec fpsandbox bash -c "drush si standard --root=/var/www/drupalvm/drupal/web -y --db-url='mysql://drupal:drupal@localhost/drupal' --site-name='Foundation Patterns' --account-name=admin --account-pass=admin"

# Apply customized settings file that updates location of config sync directory.
docker exec fpsandbox bash -c "chmod u+w /var/www/drupalvm/drupal/web/sites/default/settings.php"
docker exec fpsandbox bash -c "cp /var/www/drupalvm/drupal/web/sites/default/docker.settings.php /var/www/drupalvm/drupal/web/sites/default/settings.php"
docker exec fpsandbox bash -c "chmod u-w /var/www/drupalvm/drupal/web/sites/default/settings.php"

# Install dependencies for Foundation Patterns Theme and Enable
docker exec fpsandbox bash -c "drush --root=/var/www/drupalvm/drupal/web en -y zurb_foundation ui_patterns components foundation_patterns"
docker exec fpsandbox bash -c "drush --root=/var/www/drupalvm/drupal/web cset system.theme default foundation_patterns -y"

# Install dependencies for Foundation Patterns Config Marketing and Enable
docker exec fpsandbox bash -c "drush --root=/var/www/drupalvm/drupal/web en -y foundation_patterns_config_marketing"

# Install Pattern Lab
# Todo - Find a way to prevent this from prompting to update config options.
cd foundation_patterns/pattern-lab && composer install
docker exec fpsandbox bash -c "php /var/www/drupalvm/drupal/web/themes/foundation_patterns/pattern-lab/core/console --generate"