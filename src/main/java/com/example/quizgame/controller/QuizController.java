package com.example.quizgame.controller;

import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.quizgame.model.AnswerSubmission;
import com.example.quizgame.model.Question;
import com.example.quizgame.model.QuizResult;
import com.example.quizgame.service.QuestionService;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*")
public class QuizController {
    private final QuestionService questionService;

    public QuizController(QuestionService questionService) {
        this.questionService = questionService;
    }

    @GetMapping("/questions")
    public List<Question> getQuestions() {
        return questionService.getAllQuestions();
    }

    @PostMapping("/submit")
    public QuizResult submitAnswer(@RequestBody AnswerSubmission submission) {
        return questionService.processAnswer(submission);
    }
}