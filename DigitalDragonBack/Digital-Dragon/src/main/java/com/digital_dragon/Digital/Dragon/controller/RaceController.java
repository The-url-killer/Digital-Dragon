package com.digital_dragon.Digital.Dragon.controller;

import com.digital_dragon.Digital.Dragon.representation.request.CreateRaceRequest;
import com.digital_dragon.Digital.Dragon.services.RaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("race")
public class RaceController {

    @Autowired
    private RaceService service;

    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("/create")
    public void create(@RequestBody CreateRaceRequest createRaceRequest) {
        service.create(createRaceRequest);
    }

}
