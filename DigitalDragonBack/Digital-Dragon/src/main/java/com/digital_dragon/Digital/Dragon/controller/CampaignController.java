package com.digital_dragon.Digital.Dragon.controller;

import com.digital_dragon.Digital.Dragon.models.Campaing;
import com.digital_dragon.Digital.Dragon.representation.request.*;
import com.digital_dragon.Digital.Dragon.representation.response.CampaingResponse;
import com.digital_dragon.Digital.Dragon.services.CampaignService;
import com.digital_dragon.Digital.Dragon.services.CharacterService;
import com.google.cloud.firestore.WriteResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.concurrent.ExecutionException;

@RestController
@RequestMapping("campaign")
public class CampaignController {

  @Autowired private CampaignService campaignService;
  @Autowired private CharacterService characterService;


  @ResponseStatus(HttpStatus.CREATED)
  @PostMapping("/create")
  public WriteResult createCampaign(@RequestBody CreateCampaignRequest createCampaignRequest)
      throws ExecutionException, InterruptedException {
    return campaignService.createCampaign(createCampaignRequest);
  }

  @ResponseStatus(HttpStatus.OK)
  @GetMapping("/{id}")
  public CampaingResponse getCampaign(@PathVariable String id)
      throws ExecutionException, InterruptedException {
    return campaignService.getCampaign(id);
  }

  @ResponseStatus(HttpStatus.OK)
  @GetMapping("/get-campaigns/{email}")
  public List<CampaingResponse> getAllCampaignsByID(@PathVariable String email)
      throws ExecutionException, InterruptedException {
    return campaignService.getAllCampaingByEmail(email);
  }

  @ResponseStatus(HttpStatus.CREATED)
  @PostMapping("/create-monster")
  public String createMonster(@RequestBody CreateMonsterRequest campaing)
      throws ExecutionException, InterruptedException {
    campaignService.createMonster(campaing);
    return "KLPVADNKPVNDAKPVNAPK";
  }

  @ResponseStatus(HttpStatus.CREATED)
  @PostMapping("/create-npc")
  public String createNpc(@RequestBody CreateNpcRequest campaing)
          throws ExecutionException, InterruptedException {
    campaignService.createNpc(campaing);
    return "KLPVADNKPVNDAKPVNAPK";
  }

  @ResponseStatus(HttpStatus.CREATED)
  @PostMapping("/create-note")
  public String getMonsters(@RequestBody CreateNoteRequest note)
          throws ExecutionException, InterruptedException {
    if (note.getType().equals("campaign")) {
      campaignService.createNote(note);
    } else {
      characterService.createNote(note);
    }

    return "madonkdan";
  }

  @ResponseStatus(HttpStatus.CREATED)
  @PostMapping("/create-place")
  public String getPlace(@RequestBody CreatePlaceRequest placeRequest)
          throws ExecutionException, InterruptedException {
    campaignService.createPlace(placeRequest);

    return "madonkdan";
  }

}
