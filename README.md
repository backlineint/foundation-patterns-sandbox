# Foundation Patterns Sandbox

## Installation For Local Development

* Install [Docker](https://www.docker.com/) - Choose the edge version for improved 
file syncing performance.

* Add the following line to your hosts file:
        
        192.168.89.89  fpsandbox.dev
        
* On Mac, run:

        sudo ifconfig lo0 alias 192.168.89.89/24

    You'll need to run this again each time you reboot your machine. To remove this alias, run:

        sudo ifconfig lo0 -alias 192.168.89.89

* Clone Foundation Patterns Related Projects:

        git clone https://github.com/backlineint/foundation_patterns.git
        git clone https://github.com/backlineint/foundation_patterns_config.git

* Create the fpsandbox docker container: 
        
        docker compose up -d

* Run configuration script:

        ./scripts/configure-dev.sh

If asked to update config options, select n.

You'll now be able to access Drupal at:

    http://fpsandbox:8080

## Stopping / Starting the Container

    docker compose stop

    docker compose start

## Removing the Container

    docker-compose rm -s -f -v