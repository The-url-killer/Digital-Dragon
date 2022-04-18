package com.digital_dragon.Digital.Dragon.mapper;

import com.digital_dragon.Digital.Dragon.models.User;
import com.digital_dragon.Digital.Dragon.representation.request.CreateUserRequest;
import com.digital_dragon.Digital.Dragon.representation.response.UserInfosResponse;
import org.springframework.stereotype.Component;

import java.util.ArrayList;

public class UserMapper {

  public static User createUserRequestToModel(CreateUserRequest createUserRequest) {
    User user = new User();

    user.setName(createUserRequest.getName());
    user.setEmail(createUserRequest.getEmail());
    user.setPassword(createUserRequest.getPassword());
    user.setImage("");
    user.setCampaigns(new ArrayList<>());
    user.setCharacters(new ArrayList<>());

    return user;
  }

  public  static UserInfosResponse userModelToUserInfosResponse(User user) {
    var userInfosResponse = new UserInfosResponse();

    userInfosResponse.setImage(user.getImage());
    userInfosResponse.setName(user.getName());
    userInfosResponse.setEmail(user.getEmail());

    return userInfosResponse;
  }
}
