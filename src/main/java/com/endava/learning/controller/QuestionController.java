package com.endava.learning.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Resource;
import org.springframework.hateoas.Resources;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.endava.learning.model.Answer;
import com.endava.learning.model.Question;
import com.endava.learning.service.QuestionService;

@RestController
@RequestMapping(value = "/", produces = MediaType.APPLICATION_JSON_VALUE)
public class QuestionController {
	@Autowired
	private QuestionService questionService;
	
	/*@RequestMapping(value = "technologies/{technology_id}/topics/{topic_id}/test")
	public ModelAndView getTest(){
		ModelAndView model = new ModelAndView();
		model.setViewName("test");
		return model;
	}*/
	
	@RequestMapping(value = "technologies/{technology_id}/topics/{topic_id}/test", method = RequestMethod.GET)
	public HttpEntity<Resources<Resource<Question>>> getTest(@PathVariable("technology_id") Long technology_id, @PathVariable("topic_id") Long topic_id){
		Map<Question, Answer> questions = questionService.getTestByTopic(topic_id);		
		Resources<Resource<Question>> questionResources = Resources.wrap(questions);
		return new ResponseEntity<>(questionResources, HttpStatus.OK);
	}

}
