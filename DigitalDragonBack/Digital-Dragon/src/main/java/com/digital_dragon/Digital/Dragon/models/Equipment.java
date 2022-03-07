package com.digital_dragon.Digital.Dragon.models;

import com.digital_dragon.Digital.Dragon.models.enums.TypeEquipment;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
public class Equipment extends BaseEquipment implements Serializable {

  private String id;
  private TypeEquipment typeEquipment;

  private String armorClass;
  private int strength;
  private boolean desStealth;

  private String weaponClass;
  private String damage;
  private String description;

  public static Equipment createCommon(String name, String price, Double size) {
    return new Equipment(name, price, size, TypeEquipment.COMMON);
  }

  public static Equipment createWeapon(
      String name, String price, Double size, String weaponClass, String damage, String description) {
    return new Equipment(name, price, size, TypeEquipment.WEAPON, damage, weaponClass, description);
  }

  public static Equipment createArmor(
      String name,
      String price,
      Double size,
      String armorClass,
      int strength,
      boolean desStealth) {
    return new Equipment(name, price, size, TypeEquipment.ARMOR, armorClass, strength, desStealth);
  }

  public Equipment(String name, String price, Double size, TypeEquipment typeEquipment) {
    super(name, price, size);
    this.typeEquipment = typeEquipment;
  }

  public Equipment(
      String name,
      String price,
      Double size,
      TypeEquipment typeEquipment,
      String damage,
      String weaponClass,
      String description) {
    super(name, price, size);
    this.typeEquipment = typeEquipment;
    this.weaponClass = weaponClass;
    this.damage = damage;
    this.description = description;
  }

  public Equipment(
      String name,
      String price,
      Double size,
      TypeEquipment typeEquipment,
      String armorClass,
      int strength,
      boolean desStealth) {
    super(name, price, size);
    this.typeEquipment = typeEquipment;
    this.armorClass = armorClass;
    this.strength = strength;
    this.desStealth = desStealth;
  }
}
