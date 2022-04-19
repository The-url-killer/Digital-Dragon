package com.digital_dragon.Digital.Dragon.representation.request;

import lombok.Data;

@Data
public class CreateNoteRequest {
    private String text;
    private String id;
    private String type;
}
