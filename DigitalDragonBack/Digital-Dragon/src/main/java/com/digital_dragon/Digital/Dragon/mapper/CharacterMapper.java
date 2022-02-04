package com.digital_dragon.Digital.Dragon.mapper;

import com.digital_dragon.Digital.Dragon.representation.request.CreateCharacterRequest;

import java.util.HashMap;
import java.util.Map;

public class CharacterMapper {

    public static Map<String, Object> createCharacterRequestToModel(CreateCharacterRequest createCharacterRequest) {
        Map<String, Object> character = new HashMap<>();

        character.put("name", createCharacterRequest.getName());
        character.put("atributes", createCharacterRequest.getAtributes());
        character.put("expertises", createCharacterRequest.getExpertises());
        character.put("lore", createCharacterRequest.getLore());
        character.put("race", createCharacterRequest.getRace());
        character.put("aClass", createCharacterRequest.getAClass());

        return character;
    }
}
