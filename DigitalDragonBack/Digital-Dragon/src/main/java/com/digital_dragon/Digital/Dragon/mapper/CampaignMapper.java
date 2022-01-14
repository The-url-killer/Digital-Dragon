package com.digital_dragon.Digital.Dragon.mapper;

import com.digital_dragon.Digital.Dragon.models.Campaing;
import com.digital_dragon.Digital.Dragon.representation.request.CreateCampaignRequest;

import java.util.ArrayList;

public class CampaignMapper {

    public static Campaing createCampaignRequestToModel(CreateCampaignRequest createCampaignRequest) {
        Campaing campaing = new Campaing();

        campaing.setName(createCampaignRequest.getName());
        campaing.setLore(createCampaignRequest.getLore());
        campaing.setImage(createCampaignRequest.getImage());
        campaing.setCharacters(new ArrayList<>());
        campaing.setMonsters(new ArrayList<>());
        campaing.setPlaces(new ArrayList<>());
        campaing.setLore("");

        return campaing;
    }
}
