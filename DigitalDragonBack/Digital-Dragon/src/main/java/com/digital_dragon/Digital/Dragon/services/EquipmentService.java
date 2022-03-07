package com.digital_dragon.Digital.Dragon.services;

import com.digital_dragon.Digital.Dragon.mapper.EquipmenteMapper;
import com.digital_dragon.Digital.Dragon.representation.request.CreateEquipmentRequest;
import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.WriteResult;
import com.google.firebase.cloud.FirestoreClient;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class EquipmentService {

  public void createEquipment(CreateEquipmentRequest createEquipmentRequest) {
    Firestore dbFirestore = FirestoreClient.getFirestore();

    Map<String, Object> equipment = EquipmenteMapper.createEquipmentRequestToModel(createEquipmentRequest);

    ApiFuture<WriteResult> collectionsApiFuture =
            dbFirestore.collection("equipments").document(equipment.get("id").toString()).set(equipment);
  }
}
