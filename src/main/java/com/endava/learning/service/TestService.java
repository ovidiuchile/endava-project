package com.endava.learning.service;

import java.util.ArrayList;
import java.util.List;
import java.util.SortedMap;
import java.util.TreeMap;

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
		List<Answer> testQuestions = new ArrayList<>();
		List<Question> questions = questionDAO.getQuestionsByTopic(topic_id);
		List<Answer> answers = new ArrayList<>();
		int questionNumber;
		try {
			for (int i = 0; i < 10; i++) {
				questionNumber = (int) (Math.random() * questions.size());
				answers = answerDAO.getAnswersByQuestionId(questions.get(questionNumber).getId());
				testQuestions.addAll(answers);
				questions.remove(questions.get(questionNumber));
			}
		} catch (IndexOutOfBoundsException e) {
			e.printStackTrace();
		}
		
		return testQuestions;
	}

}
