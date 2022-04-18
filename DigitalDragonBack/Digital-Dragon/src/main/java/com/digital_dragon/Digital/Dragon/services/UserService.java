package com.digital_dragon.Digital.Dragon.services;

import com.digital_dragon.Digital.Dragon.mapper.UserMapper;
import com.digital_dragon.Digital.Dragon.models.User;
import com.digital_dragon.Digital.Dragon.representation.request.CreateUserRequest;
import com.digital_dragon.Digital.Dragon.representation.request.LoginRequest;
import com.digital_dragon.Digital.Dragon.representation.response.UserInfosResponse;
import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.DocumentSnapshot;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.WriteResult;
import com.google.firebase.cloud.FirestoreClient;
import org.springframework.stereotype.Service;

import java.util.concurrent.ExecutionException;

import static com.digital_dragon.Digital.Dragon.mapper.UserMapper.userModelToUserInfosResponse;

@Service
public class UserService {

  public WriteResult createUser(CreateUserRequest createUserRequest)
      throws ExecutionException, InterruptedException {
    Firestore dbFirestore = FirestoreClient.getFirestore();

    User user = UserMapper.createUserRequestToModel(createUserRequest);
    ApiFuture<WriteResult> collectionsApiFuture =
        dbFirestore.collection("user").document(createUserRequest.getEmail()).set(user);

    return collectionsApiFuture.get();
  }

  public String loginUser(LoginRequest loginRequest)
      throws ExecutionException, InterruptedException {
    User user = getUser(loginRequest.getEmail());

    assert user != null;
    if (!user.getPassword().equals(loginRequest.getPassword())) {
      return "Usuário ou senha inválida";
    }

    return user.getEmail();
  }

  public User getUser(String email) throws ExecutionException, InterruptedException {
    Firestore dbFirestore = FirestoreClient.getFirestore();
    DocumentReference documentReference = dbFirestore.collection("user").document(email);

    ApiFuture<DocumentSnapshot> future = documentReference.get();

    DocumentSnapshot documentSnapshot = future.get();

    if (!documentSnapshot.exists()) {
      System.out.println("Usuário não existe");
    }

    return documentSnapshot.toObject(User.class);
  }

  public UserInfosResponse getuserInfos(String email) throws ExecutionException, InterruptedException {
    var user = getUser(email);

    return userModelToUserInfosResponse(user);
  }

  public void saveUser(User user) throws ExecutionException, InterruptedException {
    Firestore dbFirestore = FirestoreClient.getFirestore();

    dbFirestore.collection("user").document(user.getEmail()).set(user);
  }
}
