package com.digital_dragon.Digital.Dragon.models;

import lombok.Data;

import java.io.Serializable;

@Data
public class Places implements Serializable {
    private String image;
    private String name;
    private String lore;
}
