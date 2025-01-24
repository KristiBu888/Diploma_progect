package com.example.quizgame.repository;

import com.example.quizgame.model.User; // Исправлен импорт
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
}