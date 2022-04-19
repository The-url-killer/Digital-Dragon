package com.digital_dragon.Digital.Dragon.representation.request;

import lombok.Data;

@Data
public class CreatePlaceRequest {
    private String id;
    private String name;
    private String lore;
    private String image;
}
