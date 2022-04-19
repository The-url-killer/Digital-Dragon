package com.digital_dragon.Digital.Dragon.representation.request;

import lombok.Data;

@Data
public class CreateMonsterRequest {
    private String id;
    private String name;
    private String lore;
    private String image;
    private String race;
    private String level;
}
