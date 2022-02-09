package com.digital_dragon.Digital.Dragon.controller;

import com.digital_dragon.Digital.Dragon.representation.request.CreateSkillRequest;
import com.digital_dragon.Digital.Dragon.services.SkillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("skill")
public class SkillController {

  @Autowired private SkillService service;

  @ResponseStatus(HttpStatus.CREATED)
  @PostMapping("/create")
  public void createSkill(@RequestBody CreateSkillRequest createSkillRequest) {
    service.createSkill(createSkillRequest);
  }
}
