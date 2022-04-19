package com.digital_dragon.Digital.Dragon.representation.response;

import com.digital_dragon.Digital.Dragon.models.Skill;
import com.digital_dragon.Digital.Dragon.representation.CharacterRepresentation;
import com.digital_dragon.Digital.Dragon.representation.ItemRepresentation;
import lombok.Data;

import java.util.List;
import java.util.Map;

@Data
public class CharacterResponse {
    private String id;
    private String aClass;
    private int age;
    private Map<String, Integer> atributes;
    private Map<String, Boolean> expertises;
    private int level;
    private Map<String, Integer> money;
    private String name;
    private String hair;
    private String campaign;
    private String image;
    private double height;
    private String peel;
    private String race;
    private int ca;
    private int lifePoints;
    private int speed;
    private List<String> notes;
    private String lore;
    private String defects;
    private String personalityTrails;
    private String connections;
    private String ideas;
    private String tendency;
    private List<Skill> speels;
    private List<ItemRepresentation> itens;
    private List<CharacterRepresentation> pets;
    private List<CharacterRepresentation> alies;
    private String user;
}
