package com.digital_dragon.Digital.Dragon.models;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public abstract class BaseEquipment implements Serializable {
  private String name;
  private String price;
  private String size;
  private String type;

  public BaseEquipment(String name, String price, String size) {
    this.name = name;
    this.price = price;
    this.size = size;
  }

  public BaseEquipment() {}
}
