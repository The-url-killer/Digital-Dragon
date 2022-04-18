package com.digital_dragon.Digital.Dragon.models;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class User implements Serializable {
  private String email;
  private String name;
  private String password;
  private String image;
  private List<String> characters;
  private List<String> campaigns;
}
