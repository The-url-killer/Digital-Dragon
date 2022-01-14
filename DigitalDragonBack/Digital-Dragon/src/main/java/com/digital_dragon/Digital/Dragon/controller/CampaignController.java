package com.digital_dragon.Digital.Dragon.controller;

import com.digital_dragon.Digital.Dragon.representation.request.CreateCampaignRequest;
import com.digital_dragon.Digital.Dragon.services.CampaignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import java.util.concurrent.ExecutionException;

@RestController
public class CampaignController {

    @Autowired
    private CampaignService campaignService;

    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("/create-campaign")
    public String createCampaign(@RequestBody CreateCampaignRequest createCampaignRequest) throws ExecutionException, InterruptedException {
        return campaignService.createCampaign(createCampaignRequest);
    }
}
