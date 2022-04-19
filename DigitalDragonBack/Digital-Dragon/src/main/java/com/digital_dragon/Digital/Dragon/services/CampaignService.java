package com.digital_dragon.Digital.Dragon.services;

import com.digital_dragon.Digital.Dragon.mapper.CampaignMapper;
import com.digital_dragon.Digital.Dragon.models.Places;
import com.digital_dragon.Digital.Dragon.models.User;
import com.digital_dragon.Digital.Dragon.representation.CharacterRepresentation;
import com.digital_dragon.Digital.Dragon.representation.request.*;
import com.digital_dragon.Digital.Dragon.representation.response.CampaingResponse;
import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.*;
import com.google.firebase.cloud.FirestoreClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ExecutionException;

@Service
public class CampaignService {

    @Autowired
    private UserService userService;

    public WriteResult createCampaign(CreateCampaignRequest createCampaignRequest)
            throws ExecutionException, InterruptedException {
        User user = userService.getUser(createCampaignRequest.getEmail());

        Firestore dbFirestore = FirestoreClient.getFirestore();

        Map<String, Object> campaing =
                CampaignMapper.createCampaignRequestToModel(createCampaignRequest);

        ApiFuture<WriteResult> collectionsApiFuture =
                dbFirestore.collection("campaign").document(campaing.get("id").toString()).set(campaing);

        user.getCampaigns().add(campaing.get("id").toString());

        userService.saveUser(user);

        return collectionsApiFuture.get();
    }

    public CampaingResponse getCampaign(String id) throws ExecutionException, InterruptedException {
        Firestore dbFirestore = FirestoreClient.getFirestore();

        DocumentReference documentReference = dbFirestore.collection("campaign").document(id);

        ApiFuture<DocumentSnapshot> future = documentReference.get();

        DocumentSnapshot documentSnapshot = future.get();

        if (!documentSnapshot.exists()) {
            System.out.println("Campanha não existe");
        }

        CampaingResponse campaingResponse = documentSnapshot.toObject(CampaingResponse.class);
//    User master = userService.getUser(campaingResponse.getMaster());

        return campaingResponse;
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

    public void createMonster(CreateMonsterRequest createMonsterRequest) throws ExecutionException, InterruptedException {
        Firestore dbFirestore = FirestoreClient.getFirestore();

        DocumentReference documentReference = dbFirestore.collection("campaign").document(createMonsterRequest.getId());
        ApiFuture<DocumentSnapshot> future = documentReference.get();

        DocumentSnapshot documentSnapshot = future.get();

        CampaingResponse campaingResponse = documentSnapshot.toObject(CampaingResponse.class);

        assert campaingResponse != null;
        List<CharacterRepresentation> monsters = campaingResponse.getMonsters();

        CharacterRepresentation characterRepresentation = new CharacterRepresentation();

        characterRepresentation.setName(createMonsterRequest.getName());
        characterRepresentation.setAclass(createMonsterRequest.getRace());
        characterRepresentation.setId(UUID.randomUUID().toString());
        characterRepresentation.setLevel(createMonsterRequest.getLevel());
        characterRepresentation.setImage(createMonsterRequest.getImage());
        characterRepresentation.setLore(createMonsterRequest.getLore());

        monsters.add(characterRepresentation);

        campaingResponse.setMonsters(monsters);

        dbFirestore.collection("campaign").document(campaingResponse.getId()).set(campaingResponse);
    }

    public void createNpc(CreateNpcRequest createMonsterRequest) throws ExecutionException, InterruptedException {
        Firestore dbFirestore = FirestoreClient.getFirestore();

        DocumentReference documentReference = dbFirestore.collection("campaign").document(createMonsterRequest.getId());
        ApiFuture<DocumentSnapshot> future = documentReference.get();

        DocumentSnapshot documentSnapshot = future.get();

        CampaingResponse campaingResponse = documentSnapshot.toObject(CampaingResponse.class);

        assert campaingResponse != null;
        List<CharacterRepresentation> monsters = campaingResponse.getNpcs();

        CharacterRepresentation characterRepresentation = new CharacterRepresentation();

        characterRepresentation.setName(createMonsterRequest.getName());
        characterRepresentation.setAclass(createMonsterRequest.getAclass());
        characterRepresentation.setId(UUID.randomUUID().toString());
        characterRepresentation.setLevel(createMonsterRequest.getLevel());
        characterRepresentation.setImage(createMonsterRequest.getImage());
        characterRepresentation.setLore(createMonsterRequest.getLore());

        monsters.add(characterRepresentation);

        campaingResponse.setMonsters(monsters);

        dbFirestore.collection("campaign").document(campaingResponse.getId()).set(campaingResponse);
    }

    public void createNote(CreateNoteRequest createMonsterRequest) throws ExecutionException, InterruptedException {
        Firestore dbFirestore = FirestoreClient.getFirestore();

        DocumentReference documentReference = dbFirestore.collection("campaign").document(createMonsterRequest.getId());
        ApiFuture<DocumentSnapshot> future = documentReference.get();

        DocumentSnapshot documentSnapshot = future.get();

        CampaingResponse campaingResponse = documentSnapshot.toObject(CampaingResponse.class);

        assert campaingResponse != null;
        List<String> notes = campaingResponse.getNotes();

        notes.add(createMonsterRequest.getText());

        campaingResponse.setNotes(notes);

       dbFirestore.collection("campaign").document(campaingResponse.getId()).set(campaingResponse);
    }

    public void createPlace(CreatePlaceRequest createMonsterRequest) throws ExecutionException, InterruptedException {
        Firestore dbFirestore = FirestoreClient.getFirestore();

        DocumentReference documentReference = dbFirestore.collection("campaign").document(createMonsterRequest.getId());
        ApiFuture<DocumentSnapshot> future = documentReference.get();

        DocumentSnapshot documentSnapshot = future.get();

        CampaingResponse campaingResponse = documentSnapshot.toObject(CampaingResponse.class);
        System.out.println(campaingResponse.toString());

        assert campaingResponse != null;
        var place = new Places();
        List<Places> places = campaingResponse.getPlaces();

        place.setId(UUID.randomUUID().toString());
        place.setImage(createMonsterRequest.getImage());
        place.setName(createMonsterRequest.getName());
        place.setLore(createMonsterRequest.getLore());

        places.add(place);

        campaingResponse.setPlaces(places);

        dbFirestore.collection("campaign").document(campaingResponse.getId()).set(campaingResponse);
    }
}
