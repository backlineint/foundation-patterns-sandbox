# Foundation Patterns Sandbox

## Installation

* Install [Docker](https://www.docker.com/)
* Add the following line to your hosts file:
        
        192.168.89.89  fpsandbox.dev
        
* On Mac, run:

        sudo ifconfig lo0 alias 192.168.89.89/24

* Create the fpsandbox docker container: 
        
        docker compose up -d

* Install Drupal

        docker exec fpsandbox install-drupal
