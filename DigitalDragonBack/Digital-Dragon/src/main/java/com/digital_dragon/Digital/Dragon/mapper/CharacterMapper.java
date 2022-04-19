package com.digital_dragon.Digital.Dragon.mapper;

import com.digital_dragon.Digital.Dragon.representation.request.CharacterHomeResponse;
import com.digital_dragon.Digital.Dragon.representation.request.CreateCharacterRequest;
import com.digital_dragon.Digital.Dragon.representation.response.CharacterResponse;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class CharacterMapper {

    public static Map<String, Object> createCharacterRequestToModel(CreateCharacterRequest createCharacterRequest) {
        Map<String, Object> character = new HashMap<>();
        Map<String, Integer> money = new HashMap<>();

        money.put("po", 0);
        money.put("pe", 0);
        money.put("pp", 0);
        money.put("pc", 0);
        money.put("pl", 0);

        character.put("id", UUID.randomUUID().toString());
        character.put("aClass", createCharacterRequest.getClasse());
        character.put("age", createCharacterRequest.getAge());
        character.put("atributes", createCharacterRequest.getAtributes());
        character.put("expertises", createCharacterRequest.getExpertises());
        character.put("level", 1);
        character.put("money", money);
        character.put("name", createCharacterRequest.getName());
        character.put("hair", createCharacterRequest.getHair());
        character.put("campaign", "");
        character.put("height", createCharacterRequest.getHeight());
        character.put("peel", createCharacterRequest.getPeel());
        character.put("race", createCharacterRequest.getRace());
        character.put("ca", 10);
        character.put("lifePoints", 8);
        character.put("speed", 9);
        character.put("notes", new ArrayList<>());
        character.put("lore", createCharacterRequest.getLore());
        character.put("defects", createCharacterRequest.getDefects());
        character.put("personalityTrails", createCharacterRequest.getPersonalityTrails());
        character.put("connections", createCharacterRequest.getConnections());
        character.put("ideas", createCharacterRequest.getIdeas());
        character.put("tendency", createCharacterRequest.getTendency());
        character.put("user", createCharacterRequest.getEmail());
        character.put("speels", new ArrayList<>());
        character.put("itens", new ArrayList<>());
        character.put("pets", new ArrayList<>());
        character.put("alies", new ArrayList<>());
        character.put("image", createCharacterRequest.getImage());

        return character;
    }

    public static CharacterHomeResponse createCharacterRequestToModel(CharacterResponse characterResponse) {
        CharacterHomeResponse character = new CharacterHomeResponse();

        character.setCampaign(characterResponse.getCampaign());
        character.setId(characterResponse.getId());
        character.setName(characterResponse.getName());
        character.setImage(characterResponse.getImage());

        return character;
    }
}
