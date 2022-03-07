package com.digital_dragon.Digital.Dragon.representation.request;

import com.digital_dragon.Digital.Dragon.models.Skill;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.List;

@Getter
@NoArgsConstructor
public class CreateRaceRequest {
    private String name;
    private String skillGrowth;
    private String age;
    private String height;
    private String tendency;
    private Double speed;
    private List<String> skills;
    private List<String> languages;
}
