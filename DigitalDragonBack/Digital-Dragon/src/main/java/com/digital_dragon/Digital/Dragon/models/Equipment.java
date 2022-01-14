package com.digital_dragon.Digital.Dragon.models;

import com.digital_dragon.Digital.Dragon.models.enums.TypeEquipment;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class Equipment extends BaseEquipment implements Serializable {

    private TypeEquipment typeEquipment;

    private String armorClass;
    private String strength;
    private boolean desStealth;

    private String damage;
    private String description;

    public static Equipment createCommon(String name, String price, String size) {
        return new Equipment(name, price, size, TypeEquipment.COMMON);
    }

    public static Equipment createWeapon(String name, String price, String size, String damage, String description) {
        return new Equipment(name, price, size, TypeEquipment.WEAPON,damage, description);
    }

    public static Equipment createArmor(String name, String price, String size, String armorClass, String strength, boolean desStealth) {
        return new Equipment(name, price, size, TypeEquipment.ARMOR, armorClass, strength, desStealth);
    }

    public Equipment() {
    }

    public Equipment(String name, String price, String size, TypeEquipment typeEquipment) {
        super(name, price, size);
        this.typeEquipment = typeEquipment;
    }

    public Equipment(String name, String price, String size, TypeEquipment typeEquipment, String damage, String description) {
        super(name, price, size);
        this.typeEquipment = typeEquipment;
        this.damage = damage;
        this.description = description;
    }

    public Equipment(String name, String price, String size, TypeEquipment typeEquipment, String armorClass, String strength, boolean desStealth) {
        super(name, price, size);
        this.typeEquipment = typeEquipment;
        this.armorClass = armorClass;
        this.strength = strength;
        this.desStealth = desStealth;
    }
}
