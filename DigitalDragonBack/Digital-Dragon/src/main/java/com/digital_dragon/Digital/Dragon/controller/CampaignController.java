package com.digital_dragon.Digital.Dragon.controller;

import com.digital_dragon.Digital.Dragon.models.Campaing;
import com.digital_dragon.Digital.Dragon.representation.CampaingResponse;
import com.digital_dragon.Digital.Dragon.representation.request.CreateCampaignRequest;
import com.digital_dragon.Digital.Dragon.services.CampaignService;
import com.google.cloud.firestore.WriteResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.concurrent.ExecutionException;

@RestController
@RequestMapping("/campaign")
public class CampaignController {

  @Autowired private CampaignService campaignService;

  @ResponseStatus(HttpStatus.CREATED)
  @PostMapping("/create")
  public WriteResult createCampaign(@RequestBody CreateCampaignRequest createCampaignRequest)
      throws ExecutionException, InterruptedException {
    return campaignService.createCampaign(createCampaignRequest);
  }

  @ResponseStatus(HttpStatus.OK)
  @GetMapping("/{id}")
  public Campaing getCampaign(@PathVariable String id)
      throws ExecutionException, InterruptedException {
    return campaignService.getCampaign(id);
  }

  @ResponseStatus(HttpStatus.OK)
  @GetMapping
  public List<CampaingResponse> getAllCampaignsByID()
      throws ExecutionException, InterruptedException {
    return campaignService.getAllCampaingByEmail("diulinho@rei.delas");
  }
}
