package com.endava.learning.controller;


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

import com.endava.learning.model.Topic;
import com.endava.learning.service.TopicService;

@RestController
@RequestMapping(value = "/", produces = MediaType.APPLICATION_JSON_VALUE)
public class TopicControler {
	
	@Autowired
	TopicService topicService;
	
	@RequestMapping(value = "technologies/{technology_id}/topics", method = RequestMethod.GET)
	public HttpEntity<Resources<Resource<Topic>>> getTopicsForTechnology(
			@PathVariable("technology_id") Long technology_id) {
	
		Resources<Resource<Topic>> topicResources = Resources.wrap(topicService.getTopics(technology_id));
		
		return new ResponseEntity<>(topicResources, HttpStatus.OK);
	}

}
