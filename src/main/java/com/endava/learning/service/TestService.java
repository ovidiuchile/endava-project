package com.endava.learning.service;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.endava.learning.dao.AnswerDAO;
import com.endava.learning.dao.QuestionDAO;
import com.endava.learning.model.Answer;
import com.endava.learning.model.Question;

@Service
public class TestService {

	@Autowired
	private QuestionDAO questionDAO;

	@Autowired
	private AnswerDAO answerDAO;

	public List<Answer> getTestByTopic(Long topic_id) {
		List<Question> questions = questionDAO.getQuestionsByTopic(topic_id);
		List<Answer> testQuestions = new LinkedList<>();
		List<Answer> answers = new LinkedList<>();
		
		if(questions.size() != 0){
		int[] existingQuestions = new int[questions.size()];
		int questionNumber;

		for (int i = 0; i < 10; i++) {
			questionNumber = (int)(Math.random() * questions.size());
			while(existingQuestions[questionNumber] == 1){
				questionNumber = (int)(Math.random() * questions.size());
			}
			answers = answerDAO.getAnswersByQuestionId(questions.get(questionNumber).getId());
			testQuestions.addAll(answers);
			existingQuestions[questionNumber] = 1;
		}

		return testQuestions;
		}
		else{
			try{
				throw new IndexOutOfBoundsException();
			}
			catch(IndexOutOfBoundsException e){
				e.printStackTrace();
			}
			return new ArrayList<>();
		}
	}

}
