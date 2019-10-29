{
    "id": "355e71a9-1ecd-44d2-9c41-ca6c10a03e56",
    "modelName": "GMObject",
    "mvc": "1.0",
    "name": "o_enemy_interceptor",
    "eventList": [
        {
            "id": "b185b74d-8e2d-4906-9824-307ab11d52c1",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 3,
            "m_owner": "355e71a9-1ecd-44d2-9c41-ca6c10a03e56"
        },
        {
            "id": "dba44dcd-1034-477e-bac2-64b9d35e6847",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 0,
            "m_owner": "355e71a9-1ecd-44d2-9c41-ca6c10a03e56"
        }
    ],
    "maskSpriteId": "00000000-0000-0000-0000-000000000000",
    "overriddenProperties": null,
    "parentObjectId": "433efea9-6655-4c62-9c69-6b25a7fe7595",
    "persistent": false,
    "physicsAngularDamping": 0.1,
    "physicsDensity": 0.5,
    "physicsFriction": 0.2,
    "physicsGroup": 0,
    "physicsKinematic": false,
    "physicsLinearDamping": 0.1,
    "physicsObject": false,
    "physicsRestitution": 0.1,
    "physicsSensor": false,
    "physicsShape": 1,
    "physicsShapePoints": null,
    "physicsStartAwake": true,
    "properties": [
        {
            "id": "56491afb-608b-4ab0-a36f-5c6d3e46c8b2",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "2",
            "varName": "max_speed",
            "varType": 0
        },
        {
            "id": "f06cef6c-86fe-48d1-85c1-4e9bfb24dac5",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "noone",
            "varName": "target",
            "varType": 4
        },
        {
            "id": "9b6c6ee3-1698-4fc1-80f6-73071b6eaa74",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0.1",
            "varName": "acceleration_rate",
            "varType": 0
        },
        {
            "id": "4fb9556c-1559-41ba-836d-7b236a6ded53",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "100",
            "varName": "range",
            "varType": 0
        },
        {
            "id": "75b92b65-f4ca-4ebe-880d-0aaa59228dfd",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "74",
            "varName": "fire_rate",
            "varType": 1
        },
        {
            "id": "de1c253a-6cd8-43bf-bee0-e2fbfa0e7da6",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "fire_counter",
            "varType": 1
        },
        {
            "id": "af16ade4-a902-4c6c-8821-3b40490dc6a4",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "40",
            "varName": "hp",
            "varType": 1
        },
        {
            "id": "270ef7d0-fd2a-4a1d-b78d-fc49592ead6c",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "5",
            "varName": "turn_speed",
            "varType": 0
        },
        {
            "id": "2825c50d-b18b-4f1c-9bb5-0b02c8a978b6",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "movement_counter",
            "varType": 1
        },
        {
            "id": "7024ec08-4caa-4f8c-8cc3-9af5f2fcc813",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "movement_factor",
            "varType": 0
        },
        {
            "id": "07d24f2d-f80c-42f0-9fa6-f6436811d544",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "direction_changed",
            "varType": 3
        },
        {
            "id": "998f61f7-2936-4f88-83aa-c2147d4f7bd6",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "reengage_counter",
            "varType": 1
        }
    ],
    "solid": false,
    "spriteId": "0aa60298-3eff-4523-8917-29adba648250",
    "visible": true
}