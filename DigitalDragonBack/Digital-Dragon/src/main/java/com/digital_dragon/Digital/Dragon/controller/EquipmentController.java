package com.digital_dragon.Digital.Dragon.controller;

import com.digital_dragon.Digital.Dragon.representation.request.CreateEquipmentRequest;
import com.digital_dragon.Digital.Dragon.services.EquipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("equipment")
public class EquipmentController {

    @Autowired
    private EquipmentService service;

    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("/create")
    public void create(@RequestBody CreateEquipmentRequest createEquipmentRequest) {
        service.createEquipment(createEquipmentRequest);
    }

}
