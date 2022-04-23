package com.digital_dragon.Digital.Dragon.services;

import com.digital_dragon.Digital.Dragon.mapper.CharacterMapper;
import com.digital_dragon.Digital.Dragon.models.Skill;
import com.digital_dragon.Digital.Dragon.models.User;
import com.digital_dragon.Digital.Dragon.representation.CharacterRepresentation;
import com.digital_dragon.Digital.Dragon.representation.ItemRepresentation;
import com.digital_dragon.Digital.Dragon.representation.request.CharacterHomeResponse;
import com.digital_dragon.Digital.Dragon.representation.request.CreateItemRequest;
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
import java.util.UUID;
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

        dbFirestore.collection("characters").document(campaingResponse.getId()).set(campaingResponse);
    }

    public void createItem(CreateItemRequest createItemRequest) throws ExecutionException, InterruptedException {
        Firestore dbFirestore = FirestoreClient.getFirestore();

        DocumentReference documentReference = dbFirestore.collection("characters").document(createItemRequest.getId());
        ApiFuture<DocumentSnapshot> future = documentReference.get();

        DocumentSnapshot documentSnapshot = future.get();

        CharacterResponse characterResponse = documentSnapshot.toObject(CharacterResponse.class);

        assert characterResponse != null;

        ItemRepresentation itemRepresentation = new ItemRepresentation();

        List<ItemRepresentation> items = characterResponse.getItens();

        itemRepresentation.setId(UUID.randomUUID().toString());
        itemRepresentation.setName(createItemRequest.getName());
        itemRepresentation.setDescription(createItemRequest.getDescription());
        itemRepresentation.setArmorClass(createItemRequest.getArmorClass());
        itemRepresentation.setDamage(createItemRequest.getDamage());
        itemRepresentation.setDesStealth(createItemRequest.isDesStealth());
        itemRepresentation.setPrice(createItemRequest.getPrice());
        itemRepresentation.setSize(createItemRequest.getSize());
        itemRepresentation.setArmorClass(createItemRequest.getArmorClass());
        itemRepresentation.setTypeEquipment(createItemRequest.getTypeEquipment());
        itemRepresentation.setWeaponClass(createItemRequest.getWeaponClass());
        itemRepresentation.setStrength(createItemRequest.getStrength());

        items.add(itemRepresentation);

        characterResponse.setItens(items);

        dbFirestore.collection("characters").document(characterResponse.getId()).set(characterResponse);
    }

    public void createSkill(Skill skill) throws ExecutionException, InterruptedException {
        Firestore dbFirestore = FirestoreClient.getFirestore();

        DocumentReference documentReference = dbFirestore.collection("characters").document(skill.getId());
        ApiFuture<DocumentSnapshot> future = documentReference.get();

        DocumentSnapshot documentSnapshot = future.get();

        CharacterResponse characterResponse = documentSnapshot.toObject(CharacterResponse.class);

        assert characterResponse != null;

        List<Skill> skills = characterResponse.getSpeels();

        Skill skill1 = new Skill();

        skill1.setId(UUID.randomUUID().toString());
        skill1.setName(skill.getName());
        skill1.setDescription(skill.getDescription());
        skill1.setLevel(skill.getLevel());
        skill1.setClasses(skill.getClasses());
        skill1.setCastTime(skill.getCastTime());
        skill1.setComponents(skill.getComponents());
        skill1.setRange(skill.getRange());
        skill1.setDuration(skill.getDuration());


        skills.add(skill1);

        dbFirestore.collection("characters").document(characterResponse.getId()).set(characterResponse);
    }
}
