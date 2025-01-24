package com.example.quizgame.model;

public class QuizResult {
    private final boolean correct;
    private final String correctAnswer;

    public QuizResult(boolean correct, String correctAnswer) {
        this.correct = correct;
        this.correctAnswer = correctAnswer;
    }

    // Геттеры
    public boolean isCorrect() {
        return correct;
    }

    public String getCorrectAnswer() {
        return correctAnswer;
    }
}
