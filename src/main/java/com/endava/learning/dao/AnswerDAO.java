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

    public List<Float> getCorrectAnswers() {
        List<Float> answers = new ArrayList<>();
        answers.addAll((List<Float>) em().createQuery("SELECT answer.id FROM Answer answer WHERE answer.correct = TRUE").getResultList());
        return answers;
    }

    public Float getScore(List<Answer> answers) {
        List<Long> checkedQuestions = new ArrayList<>();
        float score = 0, selectedCorrectAnswers, selectedWrongAnswers;
        for (Answer selectedAnswer : answers) {
            Long questionId = selectedAnswer.getQuestion().getId();
            if(!checkedQuestions.contains(questionId)){
                checkedQuestions.add(questionId);
                Long correctAnswers = (Long) em().createQuery("SELECT count(answer.id) FROM Answer answer WHERE answer.question.id = :question_id AND answer.correct = TRUE").setParameter("question_id", questionId).getSingleResult();
                selectedCorrectAnswers = selectedWrongAnswers = 0;
                for (Answer answer :answers) {
                    if(answer.getQuestion().getId() == questionId) {
                        if(answer.isCorrect()) {
                            selectedCorrectAnswers++;
                        } else {
                            selectedWrongAnswers++;
                        }
                    }
                }
                if(selectedWrongAnswers >= selectedCorrectAnswers) {
                    score += 0f;
                } else {
                    score += Float.valueOf((10 / correctAnswers) * (selectedCorrectAnswers - selectedWrongAnswers)).floatValue();
                }
            }
        }
        return score;
    }
}
