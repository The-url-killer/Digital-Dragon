package com.digital_dragon.Digital.Dragon.mapper;

import com.digital_dragon.Digital.Dragon.representation.request.CreateClassRequest;

import java.util.HashMap;
import java.util.Map;

public class ClassMapper {

  public static Map<String, Object> createClassRequestToModel(
      CreateClassRequest createClassRequest) {
    Map<String, Object> class_ = new HashMap<>();

    class_.put("name", createClassRequest.getName());
    class_.put("lifePoints", createClassRequest.getBaseLifePoints());
    class_.put("classVariation", createClassRequest.getClassVariation());
    class_.put("proficiencies", createClassRequest.getProficiences());
    class_.put("equipments", createClassRequest.getEquipments());
    class_.put("skills", createClassRequest.getSkills());

    return class_;
  }
}
