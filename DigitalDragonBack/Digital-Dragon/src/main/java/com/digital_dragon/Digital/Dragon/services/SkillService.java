package com.digital_dragon.Digital.Dragon.services;

import com.digital_dragon.Digital.Dragon.mapper.CharacterMapper;
import com.digital_dragon.Digital.Dragon.mapper.SkillMapper;
import com.digital_dragon.Digital.Dragon.mapper.UserMapper;
import com.digital_dragon.Digital.Dragon.models.User;
import com.digital_dragon.Digital.Dragon.representation.request.CreateSkillRequest;
import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.WriteResult;
import com.google.firebase.cloud.FirestoreClient;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class SkillService {

  public void createSkill(CreateSkillRequest createSkillRequest) {
    Firestore dbFirestore = FirestoreClient.getFirestore();

    Map<String, Object> skill = SkillMapper.createSkillRequestToModel(createSkillRequest);

    dbFirestore.collection("skills").document(skill.get("name").toString()).set(skill);
  }
}
