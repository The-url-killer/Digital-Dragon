package com.digital_dragon.Digital.Dragon.services;

import com.digital_dragon.Digital.Dragon.mapper.CampaignMapper;
import com.digital_dragon.Digital.Dragon.models.Campaing;
import com.digital_dragon.Digital.Dragon.models.Monster;
import com.digital_dragon.Digital.Dragon.models.Places;
import com.digital_dragon.Digital.Dragon.models.User;
import com.digital_dragon.Digital.Dragon.representation.CampaingResponse;
import com.digital_dragon.Digital.Dragon.representation.request.CreateCampaignRequest;
import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.*;
import com.google.firebase.cloud.FirestoreClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.concurrent.ExecutionException;

import static com.digital_dragon.Digital.Dragon.mapper.CampaignMapper.campaingResponseToModel;

@Service
public class CampaignService {

  @Autowired private UserService userService;

  public WriteResult createCampaign(CreateCampaignRequest createCampaignRequest)
      throws ExecutionException, InterruptedException {
    User user = userService.getUser(createCampaignRequest.getEmail());

    System.out.println(createCampaignRequest);

    Firestore dbFirestore = FirestoreClient.getFirestore();

    Map<String, Object> campaing =
        CampaignMapper.createCampaignRequestToModel(createCampaignRequest);

    ApiFuture<WriteResult> collectionsApiFuture =
        dbFirestore.collection("campaign").document(campaing.get("name").toString()).set(campaing);

    return collectionsApiFuture.get();
  }

  public Campaing getCampaign(String name) throws ExecutionException, InterruptedException {
    Firestore dbFirestore = FirestoreClient.getFirestore();

    DocumentReference documentReference = dbFirestore.collection("campaign").document(name);

    ApiFuture<DocumentSnapshot> future = documentReference.get();

    DocumentSnapshot documentSnapshot = future.get();

    if (!documentSnapshot.exists()) {
      System.out.println("Campanha não existe");
    }

    CampaingResponse campaingResponse = documentSnapshot.toObject(CampaingResponse.class);
    User master = userService.getUser(campaingResponse.getMaster());

    return campaingResponseToModel(campaingResponse, master);
  }

  public List<CampaingResponse> getAllCampaingByEmail(String email)
      throws ExecutionException, InterruptedException {
    Firestore dbFirestore = FirestoreClient.getFirestore();

    var query = dbFirestore.collection("campaign").whereEqualTo("master", email).get();

    var snapshot = query.get();

    var documents = snapshot.getDocuments();

    return mapCampaignsQuery(documents);
  }

  private List<CampaingResponse> mapCampaignsQuery(List<QueryDocumentSnapshot> campaingList) {
    List<CampaingResponse> mapped = new ArrayList<>();

    for (QueryDocumentSnapshot querySnapshot : campaingList) {
      mapped.add(querySnapshot.toObject(CampaingResponse.class));
    }

    return mapped;
  }
}
