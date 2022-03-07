package com.digital_dragon.Digital.Dragon.mapper;

import com.digital_dragon.Digital.Dragon.models.enums.TypeEquipment;
import com.digital_dragon.Digital.Dragon.representation.request.CreateEquipmentRequest;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class EquipmenteMapper {

  public static Map<String, Object> createEquipmentRequestToModel(
      CreateEquipmentRequest createEquipmentRequest) {
    Map<String, Object> equipment = new HashMap<>();

    UUID uuid = UUID.randomUUID();

    equipment.put("id", uuid.toString());
    equipment.put("typeEquipment", createEquipmentRequest.getTypeEquipment());
    equipment.put("name", createEquipmentRequest.getName());
    equipment.put("price", createEquipmentRequest.getPrice());
    equipment.put("size", createEquipmentRequest.getSize());

    if (createEquipmentRequest.getTypeEquipment().equals(TypeEquipment.ARMOR)) {
      equipment.put("armorClass", createEquipmentRequest.getArmorClass());
      equipment.put("strength", createEquipmentRequest.getStrength());
      equipment.put("desStealth", createEquipmentRequest.isDesStealth());
    }

    if (createEquipmentRequest.getTypeEquipment().equals(TypeEquipment.WEAPON)) {
      equipment.put("weaponClass", createEquipmentRequest.getWeaponClass());
      equipment.put("damage", createEquipmentRequest.getDamage());
      equipment.put("description", createEquipmentRequest.getDescription());
    }

    return equipment;
  }
}
