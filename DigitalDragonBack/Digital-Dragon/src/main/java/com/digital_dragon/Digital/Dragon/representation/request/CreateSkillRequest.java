package com.digital_dragon.Digital.Dragon.representation.request;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class CreateSkillRequest {
  private String name;
  private Integer level;
  private List<String> classes;
  private String school;
  private String castTime;
  private String range;
  private String components;
  private String duration;
  private String description;
}
