package com.endava.learning.controller;

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
import org.springframework.web.bind.annotation.RestController;

import com.endava.learning.model.Topic;
import com.endava.learning.service.TechnologyService;
import com.endava.learning.service.TopicService;

@RestController
@RequestMapping(value = "/", produces = MediaType.APPLICATION_JSON_VALUE)
public class TopicController {

	@Autowired
	TopicService topicService;

	@Autowired
	TechnologyService technologyService;

	@RequestMapping(value = "technologies/{technology_id}/topics", method = RequestMethod.GET)
	public HttpEntity<Resources<Resource<Topic>>> getTopicsForTechnology(
			@PathVariable("technology_id") Long technology_id) {

		Resources<Resource<Topic>> topicResources = Resources.wrap(topicService.getTopics(technology_id));

		return new ResponseEntity<>(topicResources, HttpStatus.OK);
	}

	@RequestMapping(value = "technologies/{technology_id}/topics/{topic_id}", method = RequestMethod.GET)
	public HttpEntity<Resource<Topic>> getTopicsForTechnologyByID(@PathVariable("topic_id") Long topic_id) {

		Resource<Topic> topicResource = new Resource<>(topicService.getTopicByID(topic_id));

		return new ResponseEntity<>(topicResource, HttpStatus.OK);
	}
	
	@RequestMapping(value = "technologies/{technology_id}/topics/{topic_id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE)
	public HttpEntity<Resource<Topic>> updateTopic(@RequestBody Topic topic,
			@PathVariable("technology_id") Long technology_id, @PathVariable("topic_id") Long topic_id) {

		Topic finalTopic = topicService.getTopicByID(topic_id);
		if(topic.getName()!=null)
			finalTopic.setName(topic.getName());

		topicService.updateTopic(finalTopic);

		Resource<Topic> topicResouce = new Resource<>(finalTopic);

		return new ResponseEntity<>(topicResouce, HttpStatus.CREATED);
	}

	@RequestMapping(value = "technologies/{technology_id}/topics/{topic_id}", method = RequestMethod.DELETE)
	public HttpEntity<Resource<Topic>> deleteTopic(@PathVariable("topic_id") Long topic_id) {
		topicService.deleteTopic(topic_id);

		return new ResponseEntity<>(HttpStatus.OK);
	}

}
