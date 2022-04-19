package com.digital_dragon.Digital.Dragon.services;

import com.digital_dragon.Digital.Dragon.mapper.CharacterMapper;
import com.digital_dragon.Digital.Dragon.models.User;
import com.digital_dragon.Digital.Dragon.representation.CharacterRepresentation;
import com.digital_dragon.Digital.Dragon.representation.request.CharacterHomeResponse;
import com.digital_dragon.Digital.Dragon.representation.request.CreateNoteRequest;
import com.digital_dragon.Digital.Dragon.representation.response.CampaingResponse;
import com.digital_dragon.Digital.Dragon.representation.request.CreateCharacterRequest;
import com.digital_dragon.Digital.Dragon.representation.response.CharacterResponse;
import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.*;
import com.google.firebase.cloud.FirestoreClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.stream.Collectors;

import static com.digital_dragon.Digital.Dragon.mapper.CharacterMapper.createCharacterRequestToModel;

@Service
public class CharacterService {

    @Autowired
    private UserService userService;

    public void createCharacter(CreateCharacterRequest createCharacterRequest) throws ExecutionException, InterruptedException {
        User user = userService.getUser(createCharacterRequest.getEmail());

        Firestore dbFirestore = FirestoreClient.getFirestore();

        Map<String, Object> character =
                createCharacterRequestToModel(createCharacterRequest);

        dbFirestore.collection("characters").document(String.valueOf(character.get("id"))).set(character);

        user.getCharacters().add(character.get("id").toString());

        userService.saveUser(user);
    }

    public List<CharacterHomeResponse> getCharactersUser(String email) throws ExecutionException, InterruptedException {
        Firestore dbFirestore = FirestoreClient.getFirestore();

        var query = dbFirestore.collection("characters").whereEqualTo("user", email).get();

        var snapshot = query.get();

        var documents = snapshot.getDocuments();

        return mapCharacterQuery(documents).stream().map(CharacterMapper::createCharacterRequestToModel).collect(Collectors.toList());
    }

    public CharacterResponse getCharactera(String id) throws ExecutionException, InterruptedException {
        Firestore dbFirestore = FirestoreClient.getFirestore();

        DocumentReference documentReference = dbFirestore.collection("characters").document(id);

        ApiFuture<DocumentSnapshot> future = documentReference.get();

        DocumentSnapshot documentSnapshot = future.get();

        if (!documentSnapshot.exists()) {
            System.out.println("Campanha não existe");
        }

        return documentSnapshot.toObject(CharacterResponse.class);
//    User master = userService.getUser(campaingResponse.getMaster());
    }


    private List<CharacterResponse> mapCharacterQuery(List<QueryDocumentSnapshot> characterList) {
        List<CharacterResponse> mapped = new ArrayList<>();

        for (QueryDocumentSnapshot querySnapshot : characterList) {
            mapped.add(querySnapshot.toObject(CharacterResponse.class));
        }

        return mapped;
    }

    public void createNote(CreateNoteRequest createMonsterRequest) throws ExecutionException, InterruptedException {
        Firestore dbFirestore = FirestoreClient.getFirestore();

        DocumentReference documentReference = dbFirestore.collection("characters").document(createMonsterRequest.getId());
        ApiFuture<DocumentSnapshot> future = documentReference.get();

        DocumentSnapshot documentSnapshot = future.get();

        CharacterResponse campaingResponse = documentSnapshot.toObject(CharacterResponse.class);

        assert campaingResponse != null;
        List<String> notes = campaingResponse.getNotes();

        notes.add(createMonsterRequest.getText());

        campaingResponse.setNotes(notes);

        ApiFuture<WriteResult> collectionsApiFuture =
                dbFirestore.collection("characters").document(campaingResponse.getId()).set(campaingResponse);
    }

}
