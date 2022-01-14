package com.digital_dragon.Digital.Dragon.representation.request;

import lombok.Data;

@Data
public class LoginRequest {
    private String email;
    private String password;
}
