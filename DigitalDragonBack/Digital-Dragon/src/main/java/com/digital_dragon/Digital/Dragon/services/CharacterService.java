package com.digital_dragon.Digital.Dragon.services;

import com.digital_dragon.Digital.Dragon.representation.request.CreateCharacterRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.concurrent.ExecutionException;

@Service
public class CharacterService {

    @Autowired
    private UserService userService;

    public void createCharacter(CreateCharacterRequest createCharacterRequest) throws ExecutionException, InterruptedException {
        userService.getUser(createCharacterRequest.getEmail());
    }

}
