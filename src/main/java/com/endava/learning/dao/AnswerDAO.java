package com.endava.learning.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.endava.learning.model.Answer;

@Repository
public class AnswerDAO extends AbstractDAO{
	@SuppressWarnings("unchecked")
    protected AnswerDAO() {
        super(Answer.class);
    }
	
	public List<Answer> getAnswersByQuestionId(Long question_id){
		return (List<Answer>) em().createQuery("SELECT answer FROM Answer answer WHERE answer.question.id = :question_id")
				.setParameter("question_id", question_id).getResultList();
	}

}
