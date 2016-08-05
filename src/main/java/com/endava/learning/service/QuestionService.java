package com.endava.learning.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.endava.learning.dao.QuestionDAO;
import com.endava.learning.model.Question;

@Service
public class QuestionService {

    @Autowired
    private QuestionDAO questionDAO;

    public List<Question> getQuestionsByTopic(Long topic_id) {

        return questionDAO.getQuestionsByTopic(topic_id);
    }

    @SuppressWarnings("unchecked")
	public Question addQuestion(Question question) {
        questionDAO.save(question);
        return question;
    }

    public void deleteQuestion(Long question_id) {
        questionDAO.deleteQuestion(question_id);
    }

    public Question getQuestionById(Long question_id) {
        return (Question) questionDAO.findById(question_id);
    }

    public Question updateQuestion(Question question) {
        questionDAO.update(question);
        return question;
    }
}
