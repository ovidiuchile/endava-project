package com.endava.learning.controller;

import java.util.List;

import javax.mail.MethodNotSupportedException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Resource;
import org.springframework.hateoas.Resources;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.endava.learning.model.Answer;
import com.endava.learning.model.Question;
import com.endava.learning.service.AnswerService;
import com.endava.learning.service.QuestionService;
import com.endava.learning.service.TopicService;

@RestController
@RequestMapping(value = "/", produces = MediaType.APPLICATION_JSON_VALUE)
public class QuestionController {

	@Autowired
	private QuestionService questionService;

	@Autowired
	private TopicService topicService;

	@Autowired
	private AnswerService answerService;

	@RequestMapping(value = "technologies/{technology_id}/topics/{topic_id}/questions", method = RequestMethod.GET)
	public HttpEntity<Resources<Resource<Question>>> getQuestionsByTopic(
			@PathVariable("technology_id") Long technology_id, @PathVariable("topic_id") Long topic_id) {
		List<Question> questions = questionService.getQuestionsByTopic(topic_id);
		Resources<Resource<Question>> questionResource = Resources.wrap(questions);

		return new ResponseEntity<>(questionResource, HttpStatus.OK);
	}

	@RequestMapping(value = "technologies/{technology_id}/topics/{topic_id}/questions", method = RequestMethod.POST, consumes = "application/json")
	public HttpEntity<Resource<Question>> addQuestion(@PathVariable Long technology_id, @PathVariable Long topic_id,
			@RequestBody Question question) {

		question.setTopic(topicService.getTopicByID(topic_id));
		question.setId(((long) (Math.random() * 1000000000)));
		Question createdQuestion = questionService.addQuestion(question);

		Resource<Question> questionResource = new Resource<>(createdQuestion);
		return new ResponseEntity<>(questionResource, HttpStatus.CREATED);
	}

	@RequestMapping(value = "technologies/{technology_id}/topics/{topic_id}/questions/{question_id}", method = RequestMethod.PUT, consumes = "application/json")
	public HttpEntity<Resource<Question>> updateQuestion(@PathVariable Long technology_id, @PathVariable Long topic_id,
			@PathVariable Long question_id, @RequestBody Question question) {

		Question existingQuestion = questionService.getQuestionById(question_id);

		if (question.getId() == null) {
			question.setId(question_id);
		}
		if (question.getTopic() == null) {
			question.setTopic(existingQuestion.getTopic());
		}
		if (question.getQuestion_text() == null) {
			question.setQuestion_text(existingQuestion.getQuestion_text());
		}
		if (question.getStart_date() == null) {
			question.setStart_date(existingQuestion.getStart_date());
		}
		if (question.getEnd_date() == null) {
			question.setEnd_date(existingQuestion.getEnd_date());
		}

		Question updatedQuestion = questionService.updateQuestion(question);

		Resource<Question> questionResource = new Resource<>(updatedQuestion);
		return new ResponseEntity<>(questionResource, HttpStatus.OK);
	}

	@RequestMapping(value = "technologies/{technology_id}/topics/{topic_id}/questions/{question_id}", method = RequestMethod.DELETE, consumes = "application/json")
	public HttpEntity<Resource<Question>> deleteQuestion(@PathVariable Long technology_id, @PathVariable Long topic_id,
			@PathVariable Long question_id) {
		questionService.deleteQuestion(question_id);
		return new ResponseEntity<>(HttpStatus.OK);
	}

	@RequestMapping(value = "add_question", method = RequestMethod.GET)
	public ModelAndView getAdd_question() {
		ModelAndView model = new ModelAndView();
		model.setViewName("add_question");
		return model;
	}

	@RequestMapping(value = "add_question", method = RequestMethod.POST)
	public ModelAndView addQuestion(HttpServletRequest request) {

		System.out.println("POST");
		Question question = new Question();
		question.setQuestion_text(request.getParameter("question"));
		question.setStart_date(request.getParameter("start_date"));
		question.setEnd_date(request.getParameter("end_date"));

		System.out.println("tech " + request.getParameter("technology") + "topic " + request.getParameter("topic"));
		try {
			this.addQuestion(Long.parseLong(request.getParameter("technology")),
					Long.parseLong(request.getParameter("topic")), question);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		question = questionService.getQuestionById(question.getId());
		Answer answer;
		for (int i = 0; i < 5; i++) {
			answer = new Answer();
			// System.out.println("answer text" + request.getParameter("answer "
			// + (i + 1)));
			answer.setAnswer_text(request.getParameter("answer " + (i + 1)));
			System.out.println("answer text : " + answer.getAnswer_text());
			answer.setQuestion(question);
			answer.setId(((long) (Math.random() * 1000000000)));
			System.out.println("id = " + answer.getId());

			System.out.println("answer" + (i + 1));
			System.out.println("correct: " + request.getParameter("answer" + (i + 1)));
			if (request.getParameter("answer" + (i + 1)).equals("correct")) {
				answer.setCorrect(true);
			} else {
				answer.setCorrect(false);
			}
			answerService.addAnswer(answer);
		}

		ModelAndView model = new ModelAndView();
		model.setViewName("add_question");
		return model;
	}
	
	@RequestMapping(value = "delete_question", method = RequestMethod.GET)
	public ModelAndView deleteQuestion(){
		ModelAndView model = new ModelAndView();
		model.setViewName("delete_question");
		return model;
	}
	
	@RequestMapping(value = "delete_question", method = RequestMethod.POST)
	public ModelAndView deleteQuestion(@RequestParam("technology")String technologyId, 
			@RequestParam("topic")String topicId, @RequestParam("question")String questionId, @RequestParam("_method") String method){
		if (method.equals("DELETE")) {
			questionService.deleteQuestion(Long.parseLong(questionId));
		} else {
			try {
				throw new MethodNotSupportedException();
			} catch (MethodNotSupportedException e) {
				e.printStackTrace();
			}
		}
		
		
		ModelAndView model = new ModelAndView();
		model.setViewName("delete_question");
		return model;
		
	}

}
