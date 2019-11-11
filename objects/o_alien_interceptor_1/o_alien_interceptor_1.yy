{
    "id": "a3f7b244-3196-4d42-bb4f-9a1d26aa3e66",
    "modelName": "GMObject",
    "mvc": "1.0",
    "name": "o_alien_interceptor_1",
    "eventList": [
        {
            "id": "5b1d4247-93c4-4053-83bd-9ea10e807dfc",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 0,
            "m_owner": "a3f7b244-3196-4d42-bb4f-9a1d26aa3e66"
        },
        {
            "id": "bc159637-7968-4253-8375-bb25d79bc876",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 3,
            "m_owner": "a3f7b244-3196-4d42-bb4f-9a1d26aa3e66"
        }
    ],
    "maskSpriteId": "00000000-0000-0000-0000-000000000000",
    "overriddenProperties": null,
    "parentObjectId": "bee9d98a-e631-4685-b169-4aa9a3025427",
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
            "id": "1e0a6eaa-609b-43c2-8986-3dcd041f89bf",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "squad_object",
            "varType": 4
        },
        {
            "id": "13f003f1-df14-4b03-a2fc-ccec3cfa7a8c",
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
            "id": "156ed171-dd5a-4cad-a7de-fbb35c72216b",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "max_hp",
            "varType": 0
        },
        {
            "id": "9071621c-b086-47bc-b4e5-fc6d144cb3e8",
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
            "id": "d57a9593-991b-489b-b10c-2421a1398023",
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
            "id": "35ec7789-e33c-423c-8522-4621f14bab15",
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
            "id": "df424fe9-35c0-4a84-a439-384414c2c870",
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
            "id": "48a0c055-5cd9-437c-9077-d9777e93826d",
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
            "id": "de82cc7a-6a80-4932-80a1-57ba0dd8cf89",
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
            "id": "d7d4868d-f372-4f87-9f89-19302edc05bd",
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
            "id": "02e9a517-6bc0-445d-aaf4-7381018620e1",
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
            "id": "bd950dcd-40ad-4e7d-a7d7-09680cf78a50",
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
            "id": "5e8a293f-a71c-4a84-86b3-85486c2f5d26",
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
            "id": "0454bc5e-de34-492a-b913-28f9f24231ab",
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
            "id": "b7305bb4-4705-4fc4-a71d-f183bc6ab1d8",
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
            "id": "f2bc1ef3-6f89-4ec6-8548-19849cd1a71c",
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
            "id": "ed96d561-caf0-47d4-8188-d8126282008e",
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
            "id": "f877b587-8637-45ec-9807-b6b95c0aa973",
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
            "id": "b94baa04-dbf0-4413-a5a0-97c291963df8",
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
            "id": "0a584f55-eff6-47cd-b715-324cfbe1f60c",
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
            "id": "a1b53f57-bf82-4ad9-a607-f0a91ee1c54d",
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
            "id": "4555b443-0808-4d20-a282-f3875f0f7db7",
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
            "id": "d4c93f9d-cb52-4213-9a74-43ce59dcd36e",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "4",
            "varName": "projectile_damage",
            "varType": 0
        },
        {
            "id": "756698b1-675b-4210-9ea0-e7c43017585b",
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
            "id": "d63c785b-965c-44e1-a8e6-1216e4f29129",
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
            "id": "83d7cb10-067a-42d5-acfc-eb114ca85511",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "o_bio_ball_player",
            "varName": "projectile_type",
            "varType": 5
        }
    ],
    "solid": false,
    "spriteId": "712126ba-a536-4b4e-a402-545b48a0c37b",
    "visible": true
}