package com.example.quizgame.model;

public class AnswerSubmission {
    private Long questionId;
    private String selectedAnswer;

    // Геттеры и сеттеры
    public Long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Long questionId) {
        this.questionId = questionId;
    }

    public String getSelectedAnswer() {
        return selectedAnswer;
    }

    public void setSelectedAnswer(String selectedAnswer) {
        this.selectedAnswer = selectedAnswer;
    }
}

