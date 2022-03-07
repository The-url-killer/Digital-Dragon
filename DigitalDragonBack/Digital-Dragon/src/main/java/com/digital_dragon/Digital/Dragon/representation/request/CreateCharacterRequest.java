package com.digital_dragon.Digital.Dragon.representation.request;

import com.digital_dragon.Digital.Dragon.models.Class;
import com.digital_dragon.Digital.Dragon.models.Race;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.Map;

@Getter
@Setter
public class CreateCharacterRequest {
  private String email;
  private String name;
  private String tendecy;
  private Integer age;
  private Double heigth;
  private Double size;
  private String eyes;
  private String peel;
  private String hair;
  private Map<String, Integer> atributes;
  private Map<String, Boolean> expertises;
  private String lore;
  private String race;
  private String _class;
}
