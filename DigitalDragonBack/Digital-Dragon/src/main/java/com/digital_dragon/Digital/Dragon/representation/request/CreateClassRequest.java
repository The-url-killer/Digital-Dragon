package com.digital_dragon.Digital.Dragon.representation.request;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class CreateClassRequest {
    private String name;
    private Double baseLifePoints;
    private List<String> classVariation;
    private String proficiences;
    private String equipments;
    private List<String> skills;
}
