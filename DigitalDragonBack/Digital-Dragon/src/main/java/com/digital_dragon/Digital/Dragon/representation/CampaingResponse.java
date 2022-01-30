package com.digital_dragon.Digital.Dragon.representation;

import com.digital_dragon.Digital.Dragon.models.Character;
import com.digital_dragon.Digital.Dragon.models.Monster;
import com.digital_dragon.Digital.Dragon.models.Places;
import com.digital_dragon.Digital.Dragon.models.User;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.util.List;

@Data
public class CampaingResponse {
  private String name;
  private String lore;
  private String image;
  private String master;
  private List<Character> characters;
  private List<Monster> monsters;
  private List<Places> places;
  private String notes;
}
