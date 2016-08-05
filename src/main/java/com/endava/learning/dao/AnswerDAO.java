package com.endava.learning.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import com.endava.learning.model.Question;
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
        selectedAnswers.trim();
        List<Answer> answers = new ArrayList<>();
        StringTokenizer ans = new StringTokenizer(selectedAnswers);
        while (ans.hasMoreTokens()) {
            String s = ans.nextToken();
            Long id = Long.parseLong(s);
            answers.add(this.getAnswerById(id));
        }
        return answers;
    }

    public float getAnswerScore(Long id) {
        Question question = (Question) em().createQuery("SELECT answer.question FROM Answer answer WHERE answer.id = :id").setParameter("id", id).getSingleResult();
        Long allQuestions = (Long) em().createQuery("SELECT count(answer.id) FROM Answer answer WHERE answer.question.id = :question_id").setParameter("question_id", question.getId()).getSingleResult();
        Long correctQuestions = (Long) em().createQuery("SELECT count(answer.id) FROM Answer answer WHERE answer.question.id = :question_id AND answer.correct = TRUE").setParameter("question_id", question.getId()).getSingleResult();
        return allQuestions / correctQuestions;
    }

    public List<Float> getCorrectAnswers(String selectedAnswers) {
        selectedAnswers.trim();
        List<Float> answers = new ArrayList<>();
        StringTokenizer ans = new StringTokenizer(selectedAnswers);
        while (ans.hasMoreTokens()) {
            String s = ans.nextToken();
            float id = Long.parseLong(s);
            Answer answer = (Answer) em().createQuery("SELECT answer FROM Answer answer WHERE answer.id = :id").setParameter("id", id).getSingleResult();
            if(answer.isCorrect()){
                answers.add(id);
            }
        }
        return answers;
    }
}
