package com.digital_dragon.Digital.Dragon.models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public abstract class BaseEquipment implements Serializable {
  private String name;
  private String price;
  private Double size;
}
