package com.digital_dragon.Digital.Dragon.models;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class Weapons extends BaseEquipment implements Serializable {
  private String type;
  private String damage;
  private String description;

  public Weapons(
      String name, String price, String size, String type, String damage, String description) {
    super(name, price, size);
    this.type = type;
    this.damage = damage;
    this.description = description;
  }

  public Weapons(String type, String damage, String description) {
    this.type = type;
    this.damage = damage;
    this.description = description;
  }

  public Weapons() {}
}
