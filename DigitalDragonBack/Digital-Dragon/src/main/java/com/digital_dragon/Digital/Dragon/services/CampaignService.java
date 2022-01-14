package com.digital_dragon.Digital.Dragon.services;

import com.digital_dragon.Digital.Dragon.mapper.CampaignMapper;
import com.digital_dragon.Digital.Dragon.models.Campaing;
import com.digital_dragon.Digital.Dragon.models.User;
import com.digital_dragon.Digital.Dragon.representation.request.CreateCampaignRequest;
import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.WriteResult;
import com.google.firebase.cloud.FirestoreClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.concurrent.ExecutionException;

@Service
public class CampaignService {

    @Autowired
    private UserService userService;

    public String createCampaign(CreateCampaignRequest createCampaignRequest) throws ExecutionException, InterruptedException {
        User user = userService.getUser(createCampaignRequest.getEmail());

        Firestore dbFirestore = FirestoreClient.getFirestore();

        Campaing campaing = CampaignMapper.createCampaignRequestToModel(createCampaignRequest);
        campaing.setMaster(user);

        ApiFuture<WriteResult> collectionsApiFuture = dbFirestore.collection("campaign").document().set(campaing);

        return collectionsApiFuture.get().getUpdateTime().toString();
    }
}
