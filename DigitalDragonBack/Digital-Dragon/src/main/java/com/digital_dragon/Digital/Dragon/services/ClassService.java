package com.digital_dragon.Digital.Dragon.services;

import com.digital_dragon.Digital.Dragon.mapper.ClassMapper;
import com.digital_dragon.Digital.Dragon.representation.request.CreateClassRequest;
import com.google.cloud.firestore.Firestore;
import com.google.firebase.cloud.FirestoreClient;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class ClassService {

  public void createClass(CreateClassRequest createClassRequest) {
    Firestore dbFirestore = FirestoreClient.getFirestore();

    Map<String, Object> class_ = ClassMapper.createClassRequestToModel(createClassRequest);

    dbFirestore.collection("classes").document(class_.get("name").toString()).set(class_);

  }
}
