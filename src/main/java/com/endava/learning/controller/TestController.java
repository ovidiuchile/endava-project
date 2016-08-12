package com.endava.learning.controller;

import java.util.List;

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
import com.endava.learning.service.TestService;

@RestController
@RequestMapping(value = "/", produces = MediaType.APPLICATION_JSON_VALUE)
public class TestController {
	@Autowired
	private TestService testService;
	
	@RequestMapping(value = "technologies/{technology_id}/topics/{topic_id}/test", method = RequestMethod.GET)
	public HttpEntity<Resources<Resource<Answer>>> getTest(@PathVariable("technology_id") Long technology_id, @PathVariable("topic_id") Long topic_id){
		List<Answer> questions = testService.getTestByTopic(topic_id);
		Resources<Resource<Answer>> testResource = Resources.wrap(questions);
		return new ResponseEntity<>(testResource, HttpStatus.OK);
	}

}
