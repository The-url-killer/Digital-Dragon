package com.digital_dragon.Digital.Dragon.representation.request;

import lombok.Getter;
import lombok.Setter;

import java.util.Map;

@Getter
@Setter
public class CreateCharacterRequest {
  private String classe;
  private int age;
  private Map<String, Integer> atributes;
  private Map<String, Boolean> expertises;
  private String name;
  private String hair;
  private double height;
  private String peel;
  private String race;
  private String image;
  private String lore;
  private String defects;
  private String personalityTrails;
  private String connections;
  private String ideas;
  private String tendency;
  private String email;
}
