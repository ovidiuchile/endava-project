package com.endava.learning.controller;

import org.springframework.hateoas.Resource;
import org.springframework.hateoas.Resources;
import org.springframework.http.HttpEntity;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping(value = "/", produces = MediaType.APPLICATION_JSON_VALUE)
public class QuestionController {
	
	/*@RequestMapping(value = "technologies/{technology_id}/topics/{topic_id}/test")
	public ModelAndView getTest(){
		ModelAndView model = new ModelAndView();
		model.setViewName("test");
		return model;
	}*/
	
	@RequestMapping(value = "technologies/{technology_id}/topics/{topic_id}/test", method = RequestMethod.GET)
	public HttpEntity<Resources<Resource<Question>>> getTest(){
		
	}

}
