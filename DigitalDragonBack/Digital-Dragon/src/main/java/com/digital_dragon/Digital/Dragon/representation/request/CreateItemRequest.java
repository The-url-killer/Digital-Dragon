package com.digital_dragon.Digital.Dragon.representation.request;

import lombok.Data;

@Data
public class CreateItemRequest {
    private String id;
    private String name;
    private String price;
    private double size;
    private String typeEquipment;
    private String description;
    private String damage;
    private String weaponClass;
    private boolean desStealth;
    private String armorClass;
    private int strength;
}
