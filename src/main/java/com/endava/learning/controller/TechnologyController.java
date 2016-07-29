package com.endava.learning.controller;

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
import org.springframework.web.bind.annotation.RestController;

import com.endava.learning.model.Technology;
import com.endava.learning.service.TechnologyService;

@RestController
@RequestMapping(value = "/", produces = MediaType.APPLICATION_JSON_VALUE)
public class TechnologyController {

	@Autowired
	TechnologyService technologyService;

	@RequestMapping(value = "technologies", method = RequestMethod.GET)
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

	@RequestMapping(value = "technologies", method = RequestMethod.POST)
	public HttpEntity<Resource<Technology>> addTechnology(HttpServletRequest request) {
		Technology technology = new Technology();
		technology.setName(request.getParameter("technology"));
		technology.setTechnology_id(((long)(Math.random()*1000000000)));
		technologyService.saveTechnology(technology);
		Resource<Technology> technologyResource = new Resource<>(technology);

		return new ResponseEntity<>(technologyResource, HttpStatus.CREATED);
	}

	@RequestMapping(value = "technologies/{technology_id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE)
	public HttpEntity<Resource<Technology>> updateTechnology(@RequestBody Technology technology,
			@PathVariable("technology_id") Long technology_id) {

		Technology finalTech = technologyService.getTechnologiesByID(technology_id);
		if(technology.getName()!=null)
			finalTech.setName(technology.getName());

		technologyService.updateTechnology(finalTech);

		Resource<Technology> technologyResouce = new Resource<>(finalTech);

		return new ResponseEntity<>(technologyResouce, HttpStatus.CREATED);
	}

	@RequestMapping(value = "technologies/{technology_id}", method = RequestMethod.DELETE)
	public HttpEntity<Resource<Technology>> deleteTopic(@PathVariable("technology_id") Long technology_id) {
		technologyService.deleteTechnology(technology_id);

		return new ResponseEntity<>(HttpStatus.OK);
	}

}
