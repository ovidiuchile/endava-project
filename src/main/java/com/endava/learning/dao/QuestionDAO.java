package com.endava.learning.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.endava.learning.model.Question;

@Repository
@SuppressWarnings("rawtypes")
public class QuestionDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
    protected QuestionDAO() {
        super(Question.class);
    }
	
	@Transactional
	@SuppressWarnings("unchecked")
	public List<Question> getQuestionsByTopic(Long topic_id) {
		return (List<Question>) em().createQuery("SELECT question FROM Question question WHERE question.topic.id = :topic_id")
				.setParameter("topic_id", topic_id).getResultList();
	}

}
