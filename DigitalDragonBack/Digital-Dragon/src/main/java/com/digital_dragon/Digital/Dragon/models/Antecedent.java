package com.digital_dragon.Digital.Dragon.models;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class Antecedent implements Serializable {
    private String name;
    private List<String> skillsProficiency;
    private List<String> languages;
    private List<String> personalityTrails;
    private List<String> ideals;
    private List<String> defects;
    private List<String> syncs;
}
