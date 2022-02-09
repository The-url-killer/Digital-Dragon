package com.digital_dragon.Digital.Dragon.models;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
public class Monster extends BaseCharacter implements Serializable {
  private String campaing;
  private List<Equipment> items;
  private List<Skill> skills;
  private Race race;
  private Class aClass;
}
