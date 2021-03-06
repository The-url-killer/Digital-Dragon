package com.digital_dragon.Digital.Dragon.models;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class Race implements Serializable {
  private String name;
  private String skillGrowth;
  private String age;
  private String height;
  private String tendency;
  private Double speed;
  private List<String> skills;
  private List<String> languages;
}
