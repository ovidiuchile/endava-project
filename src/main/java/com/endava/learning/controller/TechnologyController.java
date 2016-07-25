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

import com.endava.learning.model.Technology;
import com.endava.learning.service.TechnologyService;

@RestController
@RequestMapping(value = "/", produces = MediaType.APPLICATION_JSON_VALUE)
public class TechnologyController {

	@Autowired
	TechnologyService technologyService;

	@RequestMapping(value = "technologies/", method = RequestMethod.GET)
	public HttpEntity<Resources<Resource<Technology>>> getTechnologies() {

		Resources<Resource<Technology>> topicResources = Resources.wrap(technologyService.getTechnologies());

		return new ResponseEntity<>(topicResources, HttpStatus.OK);
	}
	
	@RequestMapping(value = "technologies/{technology_id}", method = RequestMethod.GET)
	public HttpEntity<Resource<Technology>> getTopicsForTechnologyByID(
			@PathVariable("technology_id") Long technology_id) {

		Resource<Technology> technologyResource = new Resource<>(technologyService.getTechnologiesByID(technology_id));

		return new ResponseEntity<>(technologyResource, HttpStatus.OK);
	}

}
