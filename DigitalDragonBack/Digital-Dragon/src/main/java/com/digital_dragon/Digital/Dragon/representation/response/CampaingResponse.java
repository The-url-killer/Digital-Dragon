package com.digital_dragon.Digital.Dragon.representation.response;

import com.digital_dragon.Digital.Dragon.models.Character;
import com.digital_dragon.Digital.Dragon.models.Monster;
import com.digital_dragon.Digital.Dragon.models.Places;
import com.digital_dragon.Digital.Dragon.models.User;
import com.digital_dragon.Digital.Dragon.representation.CharacterRepresentation;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.util.List;

@Data
public class CampaingResponse {
  private String id;
  private String name;
  private String lore;
  private String image;
  private String master;
  private List<CharacterRepresentation> characters;
  private List<CharacterRepresentation> monsters;
  private List<Places> places;
  private List<CharacterRepresentation> npcs;
  private List<String> notes;
}
