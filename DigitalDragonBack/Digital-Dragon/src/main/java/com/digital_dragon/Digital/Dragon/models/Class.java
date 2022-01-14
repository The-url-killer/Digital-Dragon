package com.digital_dragon.Digital.Dragon.models;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class Class implements Serializable {
    private String name;
    private Double lifePoints;
    private List<String> proficiencies;
    private List<Equipment> equipments;
    private List<Skill> skills;
}
