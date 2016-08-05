package com.endava.learning.service;

import com.endava.learning.dao.AnswerDAO;
import com.endava.learning.model.Answer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;

@Service
public class AnswerService {

    @Autowired
    private AnswerDAO answerDAO;

    public List<Answer> getAnswersByQuestionId(Long question_id) {
        return answerDAO.getAnswersByQuestionId(question_id);
    }

    public Answer addAnswer(Answer answer) {
        answerDAO.save(answer);
        return answer;
    }

    public Answer updateAnswer(Answer answer) {
        answerDAO.update(answer);
        return answer;
    }

    public Answer getAnswerById(Long answer_id) {
        return answerDAO.getAnswerById(answer_id);
    }

    public void deleteAnswer(Long answer_id) {
        answerDAO.delete(answer_id);
    }

    public List<Answer> getSelectedAnswers(String selectedAnswers) {
        return answerDAO.getSelectedAnswers(selectedAnswers);
    }

    public List<Float> getCorrectAnswers() {
        return answerDAO.getCorrectAnswers();
    }

    public Float getScore(List<Answer> answers) {
        return answerDAO.getScore(answers);
    }
}
