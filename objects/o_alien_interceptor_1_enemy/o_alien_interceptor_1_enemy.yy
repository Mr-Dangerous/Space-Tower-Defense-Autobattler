{
    "id": "d1f738ba-7528-4a0c-ba44-90f026966ab4",
    "modelName": "GMObject",
    "mvc": "1.0",
    "name": "o_alien_interceptor_1_enemy",
    "eventList": [
        {
            "id": "c6872ed7-67a2-48cf-ab20-71702fbb5eff",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 0,
            "m_owner": "d1f738ba-7528-4a0c-ba44-90f026966ab4"
        },
        {
            "id": "4d256dc2-b35a-45cf-bd9a-6f30ecae110c",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 3,
            "m_owner": "d1f738ba-7528-4a0c-ba44-90f026966ab4"
        }
    ],
    "maskSpriteId": "00000000-0000-0000-0000-000000000000",
    "overriddenProperties": null,
    "parentObjectId": "cd3056d4-9389-4b28-b0d2-16f29fc25e73",
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
            "id": "dbf15444-2671-4e75-9f3f-9c307faeeaea",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "50",
            "varName": "hp",
            "varType": 1
        },
        {
            "id": "a2dd66dc-290a-4fa7-b2d3-13688b7e054f",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "50",
            "varName": "max_hp",
            "varType": 0
        },
        {
            "id": "3fefe855-1a6a-4ebd-bc5c-b27defeb9429",
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
            "id": "0f5819c3-3d01-4dc5-a00c-ca3e0ca640b5",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0.5",
            "varName": "acceleration_rate",
            "varType": 0
        },
        {
            "id": "18ea29b2-f540-4a7b-9f26-8d714fe775e0",
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
            "varType": 1
        },
        {
            "id": "07e03388-543d-4c36-a962-50f98f10c95d",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "noone",
            "varName": "ship_target",
            "varType": 4
        },
        {
            "id": "2242ade7-534f-4128-b045-9778408b9bcd",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "target_acquired",
            "varType": 3
        },
        {
            "id": "ed07885c-78ba-4f95-a9cf-9fe062798755",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "squad_member_number",
            "varType": 1
        },
        {
            "id": "8732551b-ffa4-4260-8033-ae10efedf3ac",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "120",
            "varName": "formation_distance_offset",
            "varType": 1
        },
        {
            "id": "56a7bd89-aeba-46db-bf41-7225732c5c60",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "formation_direction_offset",
            "varType": 1
        },
        {
            "id": "1831ce64-9d31-43ca-b90e-794c4d7bfe0b",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "False",
            "varName": "locked_formation",
            "varType": 3
        },
        {
            "id": "46993d57-1801-438e-bf6b-f3b4a7c73954",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "arrival_counter",
            "varType": 1
        },
        {
            "id": "5fa65d79-b11d-4370-9987-079fb71d8de2",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "formation_locked",
            "varType": 0
        },
        {
            "id": "7ac73054-7f7f-4923-9523-689c3db3894b",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "targeted_squad",
            "varType": 4
        },
        {
            "id": "85203854-b417-40f5-a8fd-b58de44e9d8e",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "interceptor",
            "varName": "class",
            "varType": 2
        },
        {
            "id": "5dbb2f6e-26a3-4df4-b157-7415cafc0d1e",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "target_scan_counter",
            "varType": 1
        },
        {
            "id": "963627c9-973f-4fba-9f0b-ee07e96f4679",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "150",
            "varName": "engagement_range",
            "varType": 1
        },
        {
            "id": "327c8db5-31cc-4ca4-b756-9d6aa2ba3294",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "4",
            "varName": "projectile_speed",
            "varType": 0
        },
        {
            "id": "4fbd1d00-5bb7-483e-b65c-1a3c50a69745",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "90",
            "varName": "accuracy",
            "varType": 1
        },
        {
            "id": "f864ebf8-5977-4566-91f8-79ba112b3946",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "1",
            "varName": "accuracy_factor",
            "varType": 0
        },
        {
            "id": "f10694ed-101b-498d-b926-748c28c3c431",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "missed_shot_direction",
            "varType": 0
        },
        {
            "id": "ec230410-2327-4890-bab3-4e73391f65e1",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "1",
            "varName": "projectile_damage",
            "varType": 0
        },
        {
            "id": "b98837bb-eb05-45e7-b531-7e1b6368d831",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "40",
            "varName": "fire_rate",
            "varType": 1
        },
        {
            "id": "0cb14ace-04af-4231-963a-e977ef61d174",
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
            "id": "8f5d7f9a-c2c1-4dff-a8d1-fe47b63da92b",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "o_bio_ball_enemy",
            "varName": "projectile_type",
            "varType": 5
        },
        {
            "id": "a4a8f958-d2ba-44d2-b382-35ed06642e65",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "manuever_counter",
            "varType": 1
        },
        {
            "id": "d75e0b10-fec0-4b73-8893-bc6af7f11210",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "turn_speed_counter",
            "varType": 1
        },
        {
            "id": "befd8334-c6ea-48c0-8bea-545d6a18d95b",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "150",
            "varName": "weapon_range",
            "varType": 1
        }
    ],
    "solid": false,
    "spriteId": "712126ba-a536-4b4e-a402-545b48a0c37b",
    "visible": true
}