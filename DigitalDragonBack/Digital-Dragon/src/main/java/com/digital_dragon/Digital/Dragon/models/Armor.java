package com.digital_dragon.Digital.Dragon.models;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class Armor extends BaseEquipment implements Serializable {
    private String armorClass;
    private String strength;
    private Boolean desStealth;

    public Armor(String name, String price, String size) {
        super(name, price, size);
    }

    public Armor(String name, String price, String size, String armorClass, String strength, Boolean desStealth) {
        super(name, price, size);
        this.armorClass = armorClass;
        this.strength = strength;
        this.desStealth = desStealth;
    }

    public Armor() {
        super();
    }
}
