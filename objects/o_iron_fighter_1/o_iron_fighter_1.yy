{
    "id": "3550b5cc-2495-4121-a6aa-8e2215e8355e",
    "modelName": "GMObject",
    "mvc": "1.0",
    "name": "o_iron_fighter_1",
    "eventList": [
        {
            "id": "760e9c2c-9d45-4c45-9c58-8182d7910ef5",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 0,
            "m_owner": "3550b5cc-2495-4121-a6aa-8e2215e8355e"
        },
        {
            "id": "78757b2f-0349-4918-b3a9-896285b1c553",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 3,
            "m_owner": "3550b5cc-2495-4121-a6aa-8e2215e8355e"
        }
    ],
    "maskSpriteId": "00000000-0000-0000-0000-000000000000",
    "overriddenProperties": null,
    "parentObjectId": "00000000-0000-0000-0000-000000000000",
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
            "id": "a160cc92-a8a9-465d-9753-53f57a8eb273",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "noone",
            "varName": "assigned_grid_space",
            "varType": 4
        },
        {
            "id": "b4d28e0a-6173-4e39-ac34-43e575f48a4d",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "idle_spin",
            "varType": 1
        },
        {
            "id": "7ba64a60-2b3b-42c5-b73a-d6031b871d36",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "idle_turning_counter",
            "varType": 1
        },
        {
            "id": "1482e451-7bc2-4bdb-aa63-265862f3468c",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "target_ship",
            "varType": 0
        },
        {
            "id": "e2191328-cb29-4be2-bdda-46238a17562c",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "120",
            "varName": "attack_range",
            "varType": 0
        },
        {
            "id": "afa8e0ad-ff63-4164-afca-111ae32980b7",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": ".3",
            "varName": "acceleration_rate",
            "varType": 0
        },
        {
            "id": "5c175119-9f47-4f55-a0e2-c5c7dcc5913b",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": ".75",
            "varName": "min_turn_speed",
            "varType": 0
        },
        {
            "id": "47ce24bc-1a8e-46ce-b399-98f188dc43e3",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "2",
            "varName": "max_turn_speed",
            "varType": 0
        },
        {
            "id": "109ab2f7-1f2f-44b1-9498-64bb8004a767",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "1.5",
            "varName": "max_speed",
            "varType": 0
        },
        {
            "id": "a06dc17b-8f0b-4a48-a8f8-c0cc291e8e77",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "2",
            "varName": "turn_speed",
            "varType": 0
        },
        {
            "id": "0d1c463b-84d3-49d1-a18c-6b549163b186",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "fighter",
            "varName": "ship_class",
            "varType": 2
        },
        {
            "id": "bc494619-2886-44ff-bedc-a0e5b744164f",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "iron",
            "varName": "origin",
            "varType": 2
        },
        {
            "id": "61456459-95a7-430e-8336-fff4926de1a6",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "weapon platform",
            "varName": "class",
            "varType": 2
        },
        {
            "id": "51311fb6-44ad-4653-8c89-64e8e80c5863",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "15",
            "varName": "gimbal_max_angle",
            "varType": 0
        },
        {
            "id": "c282d5ed-5516-49ee-a682-2e9685d3683d",
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
            "id": "b68dac11-721a-4a24-8746-4f3446a92be0",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "40",
            "varName": "projectile_damage",
            "varType": 1
        },
        {
            "id": "624424d1-249f-4af7-8b42-047841f4de39",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "o_cannon_shot_player",
            "varName": "projectile_type",
            "varType": 5
        },
        {
            "id": "b4d3a99c-ff2d-4658-91e2-0d1c1ebf5d03",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "50",
            "varName": "fire_rate",
            "varType": 1
        },
        {
            "id": "98e848bc-6e70-4601-9660-54f8e173bd19",
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
            "id": "7cc06711-e168-4666-8684-4388e7917b23",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "hp",
            "varType": 1
        },
        {
            "id": "93e23a63-929f-4730-8b79-f1daa2ad21a4",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "400",
            "varName": "max_hp",
            "varType": 1
        },
        {
            "id": "5823966c-de3f-4645-8154-3e2ab9e57788",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "shields",
            "varType": 1
        },
        {
            "id": "dac50452-8ea9-4857-abcf-14eb6fd17aea",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "200",
            "varName": "max_shields",
            "varType": 1
        },
        {
            "id": "f4935b5c-2a73-44f4-a2de-92b52f12e336",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "2",
            "varName": "shield_recharge_rate",
            "varType": 0
        },
        {
            "id": "d2ebb306-001c-4649-a089-31e6f08dd7ba",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "shield_recharge_delay_counter",
            "varType": 1
        },
        {
            "id": "55f557d7-2f46-447e-8e60-38457843ff9a",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "light",
            "varName": "projectile_damage_type",
            "varType": 2
        },
        {
            "id": "2d26c1f2-10dd-48a1-a21c-cd8c37692b8b",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "300",
            "varName": "ordinance_range",
            "varType": 1
        },
        {
            "id": "217d4838-0ce3-498f-852c-6572642389b0",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "o_torpedo_player",
            "varName": "ordinance_type",
            "varType": 5
        },
        {
            "id": "15929905-c043-45d0-997e-d4197216b309",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "200",
            "varName": "ordinance_damage",
            "varType": 1
        },
        {
            "id": "332dbc46-1196-4122-b97c-07499d369b40",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "ordinance_counter",
            "varType": 1
        },
        {
            "id": "c7f9af62-7912-43cf-9308-212b2458b419",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "250",
            "varName": "ordinance_fire_rate",
            "varType": 1
        },
        {
            "id": "982501a0-788a-43b9-aab7-b4c907bf3414",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "heavy",
            "varName": "ordinance_mass",
            "varType": 2
        },
        {
            "id": "0194ce3b-047a-41a5-97d8-bd79f2bc19ee",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "4",
            "varName": "ordinance_speed",
            "varType": 0
        },
        {
            "id": "83a386cd-b481-48d3-8210-2ce062fd518c",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "4",
            "varName": "ordinance_ammo",
            "varType": 1
        }
    ],
    "solid": false,
    "spriteId": "79dd0d3b-bd32-4b41-b6d2-cc96886d3a8b",
    "visible": true
}