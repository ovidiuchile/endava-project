package com.endava.learning.dao;

import java.util.List;

import com.endava.learning.model.Answer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.endava.learning.model.Question;

@Repository
@SuppressWarnings("rawtypes")
public class QuestionDAO extends AbstractDAO{

    @Autowired
    AnswerDAO answerDAO;

	@SuppressWarnings("unchecked")
    protected QuestionDAO() {
        super(Question.class);
    }
	
	@Transactional
	@SuppressWarnings("unchecked")
	public List<Question> getQuestionsByTopic(Long topic_id) {
		return (List<Question>) em().createQuery("SELECT question FROM Question question WHERE question.topic.id = :topic_id AND to_date(question.end_date, 'YYYY-MM-DD') >= current_date")
				.setParameter("topic_id", topic_id).getResultList();
	}

    public void deleteQuestion(Long question_id) {
        super.delete(question_id);
        List<Answer> answers = answerDAO.getAnswersByQuestionId(question_id);
        for (Answer answer : answers) {
            answerDAO.delete(answer.getId());
        }
    }

    public void updateQuestion(Long question_id) {
        super.update(question_id);
    }
}
