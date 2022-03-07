package com.digital_dragon.Digital.Dragon.controller;

import com.digital_dragon.Digital.Dragon.representation.request.CreateClassRequest;
import com.digital_dragon.Digital.Dragon.services.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("class")
public class ClassController {

  @Autowired private ClassService service;

  @ResponseStatus(HttpStatus.CREATED)
  @RequestMapping("/create")
  public void create(@RequestBody CreateClassRequest createClassRequest) {
    service.createClass(createClassRequest);
  }
}
