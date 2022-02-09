package com.digital_dragon.Digital.Dragon.services;

import com.digital_dragon.Digital.Dragon.mapper.CampaignMapper;
import com.digital_dragon.Digital.Dragon.mapper.CharacterMapper;
import com.digital_dragon.Digital.Dragon.models.User;
import com.digital_dragon.Digital.Dragon.representation.request.CreateCharacterRequest;
import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.WriteResult;
import com.google.firebase.cloud.FirestoreClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.concurrent.ExecutionException;

@Service
public class CharacterService {

    @Autowired
    private UserService userService;

    public void createCharacter(CreateCharacterRequest createCharacterRequest) throws ExecutionException, InterruptedException {
        User user = userService.getUser(createCharacterRequest.getEmail());

        Firestore dbFirestore = FirestoreClient.getFirestore();

        Map<String, Object> character =
                CharacterMapper.createCharacterRequestToModel(createCharacterRequest);

        ApiFuture<WriteResult> collectionsApiFuture =
                dbFirestore.collection("characters").document(character.get("name").toString()).set(character);

        user.getCharacters().add(createCharacterRequest.getName());

        userService.saveUser(user);
    }

}
