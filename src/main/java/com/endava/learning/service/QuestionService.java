package com.endava.learning.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.endava.learning.dao.AnswerDAO;
import com.endava.learning.dao.QuestionDAO;
import com.endava.learning.model.Answer;
import com.endava.learning.model.Question;

@Service
public class QuestionService {

	@Autowired
	private QuestionDAO questionDAO;
	
	@Autowired
	private AnswerDAO answerDAO;
	
	public Map<Question, Answer> getTestByTopic(Long topic_id) {
		List<Question> questions = questionDAO.getQuestionsByTopic(topic_id);
		List<Answer> answers = new ArrayList<>();
		Map<Question, Answer> test = new TreeMap<>();
		Integer questionNumber, answerNumber;
		
		for(int i = 0; i < 10; i++){
			questionNumber = (int)(Math.random() * questions.size());
			answers = answerDAO.getAnswersByQuestionId(questions.get(questionNumber).getId());
			answerNumber = (int)(Math.random() * answers.size());
			while(!answers.get(answerNumber).getCorrect()){
				answerNumber = (int)(Math.random() * answers.size());
			}
			test.put(questions.get(questionNumber), answers.get(answerNumber));
			answers.remove(answers.get(answerNumber));
			
			for(int j = 0; j < 4; j++){
				answerNumber = (int)(Math.random() * answers.size());
				test.put(questions.get(questionNumber), answers.get(answerNumber));
				answers.remove(answers.get(answerNumber));
			}
			
			questions.remove(questions.get(questionNumber));
		}
		return test;
	}

}
