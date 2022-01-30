package com.digital_dragon.Digital.Dragon.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class Campaing implements Serializable {
  private String name;
  private String lore;
  private String image;
  private User master;
  private List<Character> characters;
  private List<Monster> monsters;
  private List<Places> places;
  private String notes;
}
