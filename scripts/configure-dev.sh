#!/bin/bash

# TODO - I'd prefer to bake more of this into the Docker build, but this does the trick for now.
# All of this could live in an alternative to install-drupal.

# Install Drupal
docker exec fpsandbox install-drupal

# Symlink Foundation Patterns code so Drupal can use it.
docker exec fpsandbox ln -s /var/www/foundation_patterns /var/www/drupalvm/drupal/web/themes/foundation_patterns
docker exec fpsandbox mkdir /var/www/drupalvm/drupal/web/modules/custom
docker exec fpsandbox ln -s /var/www/foundation_patterns_config /var/www/drupalvm/drupal/web/modules/custom/foundation_patterns_config

# Install dependencies for Foundation Patterns Theme and Enable
docker exec fpsandbox bash -c "drush --root=/var/www/drupalvm/drupal/web dl -y zurb_foundation ui_patterns-8.x-1.x-dev components foundation_patterns"
docker exec fpsandbox bash -c "drush --root=/var/www/drupalvm/drupal/web en -y zurb_foundation ui_patterns components foundation_patterns"
docker exec fpsandbox bash -c "drush --root=/var/www/drupalvm/drupal/web cset system.theme default foundation_patterns -y"

# Install dependencies for Foundation Patterns Config Marketing and Enable
docker exec fpsandbox bash -c "drush --root=/var/www/drupalvm/drupal/web en -y foundation_patterns_config_marketing"