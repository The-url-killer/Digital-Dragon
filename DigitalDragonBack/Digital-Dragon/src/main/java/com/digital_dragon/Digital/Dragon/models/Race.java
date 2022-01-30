package com.digital_dragon.Digital.Dragon.models;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class Race implements Serializable {
  private String name;
  private Integer skillGrowth;
  private Integer age;
  private Double height;
  private String tendency;
  private Double speed;
  private List<Skill> skills;
  private List<String> languages;
}
