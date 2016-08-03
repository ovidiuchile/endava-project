package com.endava.learning.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.endava.learning.dao.AnswerDAO;
import com.endava.learning.dao.QuestionDAO;
import com.endava.learning.model.Answer;
import com.endava.learning.model.Question;
import com.endava.learning.model.Test;

@Service
public class TestService {

	@Autowired
	private QuestionDAO questionDAO;
	
	@Autowired
	private AnswerDAO answerDAO;
	
	public Test getTestByTopic(Long topic_id) {
		List<Question> questions = questionDAO.getQuestionsByTopic(topic_id);
		List<Answer> answers = new ArrayList<>();
		Map<Question, List<Answer>> testQuestions = new HashMap<>();
		List<Answer> questionAnswers = new ArrayList<>();
		Integer questionNumber;
		
		for(int i = 0; i < 10; i++){
			questionNumber = (int)(Math.random() * questions.size());
			questionAnswers.clear();
			
			answers = answerDAO.getAnswersByQuestionId(questions.get(questionNumber).getId());
			
			testQuestions.put(questions.get(questionNumber), answers);
			questions.remove(questions.get(questionNumber));
		}
		Test test = new Test();
		test.setQuestions(testQuestions);
		return test;
	}

}
