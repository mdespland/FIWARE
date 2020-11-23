# Orion : Le Contect Brocker

 * [Documentation](https://github.com/telefonicaid/fiware-orion/)
 * [Tutorials](https://fiware-tutorials.readthedocs.io/en/latest/getting-started/index.html)
 * [NGSI v2](http://fiware.github.io/specifications/ngsiv2/stable/)

 ## Déploiement via docker

 ```
version: "3" 

services:
  orion:
    image: fiware/orion
    ports:
      - "1026:1026"
    depends_on:
      - mongo
    command: -dbhost mongo

  mongo:
    image: mongo:3.6
    command: --nojournal
 ```

 ```
 cd /opt/FIWARE/orion
 docker-compose up -d
 curl http://127.0.0.1:1026/version
 ```