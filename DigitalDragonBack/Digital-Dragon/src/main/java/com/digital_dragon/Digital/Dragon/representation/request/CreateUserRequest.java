package com.digital_dragon.Digital.Dragon.representation.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CreateUserRequest {
  private String name;
  private String email;
  private String password;
}
