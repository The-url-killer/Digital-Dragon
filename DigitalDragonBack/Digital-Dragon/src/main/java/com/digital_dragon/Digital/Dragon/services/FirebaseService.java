package com.digital_dragon.Digital.Dragon.services;

import com.digital_dragon.Digital.Dragon.models.User;
import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.DocumentSnapshot;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.WriteResult;
import com.google.firebase.cloud.FirestoreClient;
import org.springframework.stereotype.Service;

import java.util.concurrent.ExecutionException;

@Service
public class FirebaseService {

  public String saveUserDetails(User person) throws ExecutionException, InterruptedException {
    Firestore dbFirestore = FirestoreClient.getFirestore();
    ApiFuture<WriteResult> collectionsApiFuture =
        dbFirestore.collection("users").document().set(person);
    return collectionsApiFuture.get().getUpdateTime().toString();
  }

  public User getUserDetails(String id) throws ExecutionException, InterruptedException {
    Firestore dbFirestore = FirestoreClient.getFirestore();
    DocumentReference documentReference = dbFirestore.collection("users").document(id);
    ApiFuture<DocumentSnapshot> future = documentReference.get();

    DocumentSnapshot documentSnapshot = future.get();

    User person = null;

    if (documentSnapshot.exists()) {
      person = documentSnapshot.toObject(User.class);
      return person;
    } else {
      return null;
    }
  }
}
