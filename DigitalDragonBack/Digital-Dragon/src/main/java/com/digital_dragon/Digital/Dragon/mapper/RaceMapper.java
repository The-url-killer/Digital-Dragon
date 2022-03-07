package com.digital_dragon.Digital.Dragon.mapper;

import com.digital_dragon.Digital.Dragon.representation.request.CreateRaceRequest;

import java.util.HashMap;
import java.util.Map;

public class RaceMapper {

    public static Map<String, Object> createRaceRequestToMapper(CreateRaceRequest createRaceRequest) {
        Map<String, Object> race = new HashMap<>();

        race.put("name", createRaceRequest.getName());
        race.put("skillGrowth", createRaceRequest.getSkillGrowth());
        race.put("age", createRaceRequest.getAge());
        race.put("heigth", createRaceRequest.getHeight());
        race.put("tendency", createRaceRequest.getTendency());
        race.put("speed", createRaceRequest.getSpeed());
        race.put("skills", createRaceRequest.getSkills());
        race.put("languages", createRaceRequest.getLanguages());

        return race;
    }
}
