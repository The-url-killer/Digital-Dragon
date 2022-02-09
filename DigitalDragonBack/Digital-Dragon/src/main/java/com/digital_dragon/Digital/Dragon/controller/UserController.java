package com.digital_dragon.Digital.Dragon.controller;

import com.digital_dragon.Digital.Dragon.representation.request.CreateUserRequest;
import com.digital_dragon.Digital.Dragon.representation.request.LoginRequest;
import com.digital_dragon.Digital.Dragon.services.UserService;
import com.google.cloud.firestore.WriteResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import java.util.concurrent.ExecutionException;

@RestController
@RequestMapping("user")
public class UserController {

    @Autowired
    UserService userService;

//    @GetMapping("/getUserDetails/{id}")
//    public User getExample(@PathVariable String id) throws ExecutionException, InterruptedException {
//        return firebaseService.getUserDetails(id);
//    }

    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("/sign-up")
    public WriteResult signUp(@RequestBody CreateUserRequest createUserRequest) throws ExecutionException, InterruptedException {
        return userService.createUser(createUserRequest);
    }

    @ResponseStatus(HttpStatus.OK)
    @PostMapping("/sign-in")
    public String signIn(@RequestBody LoginRequest loginRequest) throws ExecutionException, InterruptedException {
        return userService.loginUser(loginRequest);
    }

}
