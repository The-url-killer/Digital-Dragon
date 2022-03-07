package com.digital_dragon.Digital.Dragon.representation.request;

import com.digital_dragon.Digital.Dragon.models.enums.TypeEquipment;
import com.google.firebase.database.annotations.NotNull;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CreateEquipmentRequest {

  @NotNull private TypeEquipment typeEquipment;
  @NotNull private String name;
  @NotNull private String price;
  @NotNull private Double size;

  private String armorClass;
  private int strength;
  private boolean desStealth;

  private String weaponClass;
  private String damage;
  private String description;
}
