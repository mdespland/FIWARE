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

 ## Manipuler les entitées

[NGSI v2](http://fiware.github.io/specifications/ngsiv2/stable/)

Creation d'une entitée Normalized

```
curl -X POST http://127.0.0.1:1026/v2/entities -H "Content-Type: application/json" -d @- <<EOF
{
    "id": "room1",
    "type": "Room",
    "temperature": {
        "value": 23.5,
        "type": "Number"
    },
    "light": {
        "value": true,
        "type": "Boolean"
    }
}
EOF
```

Creation d'une entitée keyValue
```
curl -X POST "http://127.0.0.1:1026/v2/entities?options=keyValues" -H "Content-Type: application/json" -d @- <<EOF
{
    "id": "room2",
    "type": "Room",
    "temperature": 25.3,
    "light": false
}
EOF
```

Lecture de l'entité

```
curl http://127.0.0.1:1026/v2/entities/room1
```

```
curl http://127.0.0.1:1026/v2/entities/room1/attrs/light
```

Mise à jour d'une entitée

```
curl -X PATCH "http://127.0.0.1:1026/v2/entities/room2/attrs" -H "Content-Type: application/json" -d @- <<EOF
{
    "temperature": {
        "value": 26.2,
        "type": "Number"
    },
    "light": {
        "value": false,
        "type": "Boolean"
    }
}
EOF
```

Suppression d'une entitée
```
curl -X DELETE http://127.0.0.1:1026/v2/entities/room1
```

## Simple Query Language

Creation d'un jeu de test


```
curl -X POST http://127.0.0.1:1026/v2/entities -H "Content-Type: application/json" -d @- <<EOF
{
    "id": "room1",
    "type": "Room",
    "temperature": {
        "value": 23.5,
        "type": "Number"
    },
    "light": {
        "value": true,
        "type": "Boolean"
    }
}
EOF
```

```
curl -X POST http://127.0.0.1:1026/v2/entities -H "Content-Type: application/json" -d @- <<EOF
{
    "id": "room3",
    "type": "Room",
    "temperature": {
        "value": 28.5,
        "type": "Number"
    },
    "light": {
        "value": true,
        "type": "Boolean"
    }
}
EOF
```

Recupérer les Room avec temperature>26

```
curl "http://127.0.0.1:1026/v2/entities?type=Room&q=temperature>26"
```

Recupérer les Room avec temperature>26 et light on

```
curl "http://127.0.0.1:1026/v2/entities?type=Room&q=temperature>26;light==true"
```

## Requêtes geographique


Création du jeu de données

```
curl -X POST http://127.0.0.1:1026/v2/entities -H "Content-Type: application/json" -d @- <<EOF
{
    "id": "car1",
    "type": "Car",
    "location": {
        "value": {
            "type": "Point",
            "coordinates": [2.186447514, 41.3763726]
            },
        "type": "geo:json"
    }
}
EOF
```

```
curl -X POST http://127.0.0.1:1026/v2/entities -H "Content-Type: application/json" -d @- <<EOF
{
    "id": "car2",
    "type": "Car",
    "location": {
        "value": {
            "type": "Point",
            "coordinates": [30, 60]
            },
        "type": "geo:json"
    }
}
EOF
```

```
curl "http://127.0.0.1:1026/v2/entities?type=Car&georel=near;maxDistance:1000000&geometry=point&coords=61,31"
```

## Subscription


