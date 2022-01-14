package com.digital_dragon.Digital.Dragon.representation.request;

import lombok.Data;

@Data
public class CreateUserRequest {
    private String name;
    private String email;
    private String password;
}
