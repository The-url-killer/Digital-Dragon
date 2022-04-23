package com.digital_dragon.Digital.Dragon.models;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class Skill implements Serializable {
  private String id;
  private Integer level;
  private String name;
  private List<String> classes;
  private String school;
  private String castTime;
  private String range;
  private String components;
  private String duration;
  private String description;
}
