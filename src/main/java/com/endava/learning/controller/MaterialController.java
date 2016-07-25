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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.endava.learning.model.Material;
import com.endava.learning.service.MaterialService;
import com.endava.learning.service.TopicService;

@RestController
@RequestMapping(value = "/", produces = MediaType.APPLICATION_JSON_VALUE)
public class MaterialController {
	
	@Autowired
	private MaterialService materialService;
	
	@Autowired
	private TopicService topicService;
	
	@RequestMapping(value = "technologies/{technology_id}/topics/{topic_id}/materials", method = RequestMethod.GET)
	public HttpEntity<Resources<Resource<Material>>> getMaterialsByTechnologyAndTopic(@PathVariable Long technology_id, @PathVariable Long topic_id){
		List<Material> materials = materialService.getMaterialsByTechnologyAndTopic(technology_id, topic_id);
		Resources<Resource<Material>> materialsResources = Resources.wrap(materials);
		
		return new ResponseEntity<>(materialsResources, HttpStatus.OK);
	}
	
	@RequestMapping(value = "technologies/{technology_id}/topics/{topic_id}/materials", method = RequestMethod.POST, consumes = "application/json")
	public HttpEntity<Resource<Material>> createMaterial(@PathVariable Long topic_id, @RequestBody Material material){

		material.setTopic(topicService.getTopicsByID(topic_id));
		
		Material materialCreated = materialService.createMaterial(material);
		
		
		Resource<Material> materialResource = new Resource<>(materialCreated);
		
		return new ResponseEntity<>(materialResource, HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "technologies/{technology_id}/topics/{topic_id}/materials/{material_id}", method = RequestMethod.GET)
	public HttpEntity<Resource<Material>> getMaterialById(@PathVariable Long technology_id, @PathVariable Long topic_id, @PathVariable Long material_id){
		Material material = materialService.getMaterialById(material_id);
		Resource<Material> materialResource = new Resource<>(material);
	
        //materialResource.add(linkTo(methodOn(MaterialController.class).getMaterialById(technology_id, topic_id, material_id)).withSelfRel());

		return new ResponseEntity<>(materialResource, HttpStatus.OK);
	}
	


}
