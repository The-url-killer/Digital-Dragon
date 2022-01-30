package com.digital_dragon.Digital.Dragon.mapper;

import com.digital_dragon.Digital.Dragon.models.Campaing;
import com.digital_dragon.Digital.Dragon.models.Monster;
import com.digital_dragon.Digital.Dragon.models.Places;
import com.digital_dragon.Digital.Dragon.models.User;
import com.digital_dragon.Digital.Dragon.representation.CampaingResponse;
import com.digital_dragon.Digital.Dragon.representation.request.CreateCampaignRequest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CampaignMapper {

  public static Map<String, Object> createCampaignRequestToModel(
      CreateCampaignRequest createCampaignRequest) {
    Map<String, Object> map = new HashMap<>();

    List<Character> list = new ArrayList<>();
    List<Monster> monsterList = new ArrayList<>();
    List<Places> places = new ArrayList<>();

    map.put("name", createCampaignRequest.getName());
    map.put("lore", createCampaignRequest.getHistory());
    map.put("image", createCampaignRequest.getImage());
    map.put("characters", list);
    map.put("master", createCampaignRequest.getEmail());
    map.put("monsters", monsterList);
    map.put("places", places);
    map.put("notes", "");

    return map;
  }

  public static Campaing campaingResponseToModel(CampaingResponse campaingResponse, User master) {
    Campaing campaing = new Campaing();

    campaing.setName(campaingResponse.getName());
    campaing.setLore(campaingResponse.getLore());
    campaing.setImage(campaingResponse.getImage());
    campaing.setCharacters(campaingResponse.getCharacters());
    campaing.setMonsters(campaingResponse.getMonsters());
    campaing.setPlaces(campaingResponse.getPlaces());
    campaing.setMaster(master);
    campaing.setNotes(campaingResponse.getNotes());

    return campaing;
  }
}
