package com.digital_dragon.Digital.Dragon.models;

import lombok.Data;

import java.io.Serializable;

@Data
public class Skill implements Serializable {
    private Integer level;
    private String castTime;
    private String range;
    private String components;
    private String duration;
    private String description;
}
