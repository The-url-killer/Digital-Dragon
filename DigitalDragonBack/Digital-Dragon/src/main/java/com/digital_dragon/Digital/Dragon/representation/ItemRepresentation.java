package com.digital_dragon.Digital.Dragon.representation;

import lombok.Data;

@Data
public class ItemRepresentation {
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
