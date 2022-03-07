package com.digital_dragon.Digital.Dragon.services;

import com.digital_dragon.Digital.Dragon.mapper.CharacterMapper;
import com.digital_dragon.Digital.Dragon.mapper.RaceMapper;
import com.digital_dragon.Digital.Dragon.representation.request.CreateRaceRequest;
import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.WriteResult;
import com.google.firebase.cloud.FirestoreClient;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class RaceService {

    public void create(CreateRaceRequest createRaceRequest) {

        Firestore dbFirestore = FirestoreClient.getFirestore();

        Map<String, Object> race =
                RaceMapper.createRaceRequestToMapper(createRaceRequest);

        ApiFuture<WriteResult> collectionsApiFuture =
                dbFirestore.collection("races").document(race.get("name").toString()).set(race);

    }

}
