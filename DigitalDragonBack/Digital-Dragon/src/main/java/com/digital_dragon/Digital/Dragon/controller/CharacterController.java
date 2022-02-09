package com.digital_dragon.Digital.Dragon.controller;

import com.digital_dragon.Digital.Dragon.representation.request.CreateCharacterRequest;
import com.digital_dragon.Digital.Dragon.services.CharacterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.concurrent.ExecutionException;

@RestController
@RequestMapping("character")
public class CharacterController {

    @Autowired
    CharacterService service;

    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("/create")
    public void createCharacter(@RequestBody CreateCharacterRequest request) throws ExecutionException, InterruptedException {
        service.createCharacter(request);
    }
}
