package com.digital_dragon.Digital.Dragon.mapper;

import com.digital_dragon.Digital.Dragon.representation.request.CreateCharacterRequest;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class CharacterMapper {

    public static Map<String, Object> createCharacterRequestToModel(CreateCharacterRequest createCharacterRequest) {
        Map<String, Object> character = new HashMap<>();

        character.put("id", UUID.randomUUID().toString());
        character.put("name", createCharacterRequest.getName());
        character.put("atributes", createCharacterRequest.getAtributes());
        character.put("expertises", createCharacterRequest.getExpertises());
        character.put("campaingn", null);
        character.put("tendecy", createCharacterRequest.getTendecy());
        character.put("age", createCharacterRequest.getAge());
        character.put("heigth", createCharacterRequest.getHeigth());
        character.put("peel", createCharacterRequest.getPeel());
        character.put("hair", createCharacterRequest.getHair());
        character.put("lore", createCharacterRequest.getLore());
        character.put("race", createCharacterRequest.getRace());
        character.put("_class", createCharacterRequest.get_class());

        return character;
    }
}
