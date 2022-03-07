package com.digital_dragon.Digital.Dragon.models;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class CommonItem extends BaseEquipment implements Serializable {
  public CommonItem(String name, String price, Double size) {
    super(name, price, size);
  }

  public CommonItem() {}
}
