# Foundation Patterns Sandbox

## Prerequistes

* [Docker](https://www.docker.com/) - Choose the edge version for improved 
file syncing performance.

* [Composer](https://getcomposer.org/) - [install globally](https://getcomposer.org/doc/00-intro.md#globally). 

* [Node.js](https://nodejs.org/en/)

* [Bower](https://bower.io/)

(I know, that is a lot of stuff...)

## Installation For Local Development

* Add the following line to your hosts file:
        
        192.168.89.89  fpsandbox.dev
        
* On Mac, run:

        sudo ifconfig lo0 alias 192.168.89.89/24

    You'll need to run this again each time you reboot your machine. To remove this alias, run:

        sudo ifconfig lo0 -alias 192.168.89.89

* Fork and then clone Foundation Patterns Related Projects:

        git clone https://github.com/<your_username>/foundation_patterns.git
        git clone https://github.com/<your_account>/foundation_patterns_config.git

* Create the fpsandbox docker container: 
        
        docker-compose up -d

* Run configuration script:

        ./scripts/configure-dev.sh

If asked to update config options, select n.

You'll now be able to access Drupal at:

    http://fpsandbox:8080

## Stopping / Starting the Container

    docker-compose stop

    docker-compose start

## Removing the Container

    docker-compose rm -s -f -v
 
## Common development tasks

### SSH Into Docker Container

    docker exec -it fpsandbox /bin/bash

### Drush

    docker exec fpsandbox bash -c "drush --root=/var/www/drupalvm/drupal/web <command>"

Export config:

    docker exec fpsandbox bash -c "drush --root=/var/www/drupalvm/drupal/web cex sync -y"

### Watch Tasks

Watch for changes in patterns (rebuilds css, pattern lab, and clears Drupal cache):

    npm run docker:watch