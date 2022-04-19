package com.digital_dragon.Digital.Dragon.controller;

import com.digital_dragon.Digital.Dragon.representation.request.CharacterHomeResponse;
import com.digital_dragon.Digital.Dragon.representation.request.CreateCharacterRequest;
import com.digital_dragon.Digital.Dragon.representation.response.CharacterResponse;
import com.digital_dragon.Digital.Dragon.services.CharacterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.concurrent.ExecutionException;

@RestController
public class CharacterController {

    @Autowired
    CharacterService service;

    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("/create")
    public void createCharacter(@RequestBody CreateCharacterRequest request) throws ExecutionException, InterruptedException {
        service.createCharacter(request);
    }

    @ResponseStatus(HttpStatus.OK)
    @GetMapping("/get-characters/{email}")
    public List<CharacterHomeResponse> getCharacter(@PathVariable String email) throws ExecutionException, InterruptedException {
        return service.getCharactersUser(email);
    }

    @ResponseStatus(HttpStatus.OK)
    @GetMapping("/get-character/{id}")
    public CharacterResponse getCharactera(@PathVariable String id) throws ExecutionException, InterruptedException {
        return service.getCharactera(id);
    }
}
