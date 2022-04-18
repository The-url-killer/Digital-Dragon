package com.digital_dragon.Digital.Dragon.services;

import com.digital_dragon.Digital.Dragon.mapper.CampaignMapper;
import com.digital_dragon.Digital.Dragon.mapper.CharacterMapper;
import com.digital_dragon.Digital.Dragon.models.User;
import com.digital_dragon.Digital.Dragon.representation.CampaingResponse;
import com.digital_dragon.Digital.Dragon.representation.request.CreateCharacterRequest;
import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.DocumentSnapshot;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.WriteResult;
import com.google.firebase.cloud.FirestoreClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.concurrent.ExecutionException;

import static com.digital_dragon.Digital.Dragon.mapper.CampaignMapper.campaingResponseToModel;

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
                dbFirestore.collection("characters").document(character.get("id").toString()).set(character);

        user.getCharacters().add(character.get("id").toString());

        userService.saveUser(user);
    }

    public void getCharactersUser(String email) throws ExecutionException, InterruptedException {
        Firestore dbFirestore = FirestoreClient.getFirestore();

        var query = dbFirestore.collection("character").whereEqualTo("email", email).get();

        var snapshot = query.get();

        var documents = snapshot.getDocuments();

//        CampaingResponse campaingResponse = documentSnapshot.toObject(CampaingResponse.class);
//        User master = userService.getUser(campaingResponse.getMaster());

//        return campaingResponseToModel(campaingResponse, master);
    }

}
