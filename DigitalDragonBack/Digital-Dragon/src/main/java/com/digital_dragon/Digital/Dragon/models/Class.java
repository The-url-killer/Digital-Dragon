package com.digital_dragon.Digital.Dragon.models;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class Class implements Serializable {
  private String name;
  private Double lifePoints;
  private List<String> classVariation;
  private String proficiencies;
  private String equipments;
  private List<String> skills;
}
