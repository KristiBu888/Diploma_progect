package com.example.quizgame.service;

import com.example.quizgame.model.AnswerSubmission;
import com.example.quizgame.model.Question;
import com.example.quizgame.model.QuizResult;
import com.example.quizgame.repository.QuestionRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuestionService {
    @Autowired
    private QuestionRepository questionRepository;

    public List<Question> getAllQuestions() {
        return questionRepository.findAll();
    }

    public QuizResult processAnswer(AnswerSubmission submission) {
        Question question = questionRepository.findById(submission.getQuestionId())
                .orElseThrow(() -> new RuntimeException("Question not found"));

        boolean isCorrect = question.getCorrectAnswer().equals(submission.getSelectedAnswer());

        return new QuizResult(isCorrect, question.getCorrectAnswer());
    }
}
