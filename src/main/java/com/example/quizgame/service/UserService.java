package com.example.quizgame.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.quizgame.model.User;
import com.example.quizgame.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }
}