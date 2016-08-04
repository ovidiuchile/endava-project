package com.endava.learning.dao;

import java.util.List;
import java.util.StringTokenizer;

import org.springframework.stereotype.Repository;

import com.endava.learning.model.Answer;

@SuppressWarnings("rawtypes")
@Repository
public class AnswerDAO extends AbstractDAO{
	@SuppressWarnings("unchecked")
    protected AnswerDAO() {
        super(Answer.class);
    }
	
	@SuppressWarnings("unchecked")
	public List<Answer> getAnswersByQuestionId(Long question_id){
		return (List<Answer>) em().createQuery("SELECT answer FROM Answer answer WHERE answer.question.id = :question_id")
				.setParameter("question_id", question_id).getResultList();
	}

	public Answer getAnswerById(Long answer_id) {
		return (Answer) em().createQuery("SELECT answer FROM Answer answer WHERE answer.id = :answer_id")
                .setParameter("answer_id", answer_id).getSingleResult();
	}

    public void deleteQuestion(Long answer_id) {
    }

    public List<Answer> getSelectedAnswers(String selectedAnswers) {
        List<Answer> answers = null;
        StringTokenizer ans = new StringTokenizer(selectedAnswers, ",");
        while (ans.hasMoreElements()) {
            System.out.println(ans.nextElement());
            answers.add(this.getAnswerById((Long) ans.nextElement()));
        }
        return answers;
    }
}
