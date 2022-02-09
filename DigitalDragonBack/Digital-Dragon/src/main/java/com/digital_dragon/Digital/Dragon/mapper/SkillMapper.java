package com.digital_dragon.Digital.Dragon.mapper;

import com.digital_dragon.Digital.Dragon.representation.request.CreateSkillRequest;

import java.util.HashMap;
import java.util.Map;

public class SkillMapper {

    public static Map<String, Object> createSkillRequestToModel(CreateSkillRequest createSkillRequest) {

        Map<String, Object> skill = new HashMap<>();

        skill.put("name", createSkillRequest.getName());
        skill.put("level", createSkillRequest.getLevel());
        skill.put("classes", createSkillRequest.getClasses());
        skill.put("school", createSkillRequest.getSchool());
        skill.put("castTime", createSkillRequest.getCastTime());
        skill.put("range", createSkillRequest.getRange());
        skill.put("components", createSkillRequest.getComponents());
        skill.put("duration", createSkillRequest.getDuration());
        skill.put("description", createSkillRequest.getDescription());

        return skill;
    }
}
