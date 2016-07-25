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
		Material createdMaterial = materialService.createMaterial(material);
		
		Resource<Material> materialResource = new Resource<>(createdMaterial);
		return new ResponseEntity<>(materialResource, HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "technologies/{technology_id}/topics/{topic_id}/materials/{material_id}", method = RequestMethod.GET)
	public HttpEntity<Resource<Material>> getMaterialById(@PathVariable Long technology_id, @PathVariable Long topic_id, @PathVariable Long material_id){
		Material material = materialService.getMaterialById(material_id);
		Resource<Material> materialResource = new Resource<>(material);
		
		return new ResponseEntity<>(materialResource, HttpStatus.OK);
	}
	
	@RequestMapping(value = "technologies/{technology_id}/topics/{topic_id}/materials/{material_id}", method = RequestMethod.PUT, consumes = "application/json")
	public HttpEntity<Resource<Material>> updateMaterial(@PathVariable Long technology_id, 
			@PathVariable Long topic_id, @PathVariable Long material_id, @RequestBody Material material){
		Material existingMaterial = materialService.getMaterialById(material_id);
		

		if(material.getMaterial_id() == null){
			material.setMaterial_id(material_id);
		}
		
		if(material.getTitle() == null){
			material.setTitle(existingMaterial.getTitle());
		}
		if(material.getLink() == null){
			material.setLink(existingMaterial.getLink());
		}
		if(material.getUpload_date() == null){
			material.setUpload_date(existingMaterial.getUpload_date());
		}
		if(material.getContent_editor() == null){
			material.setContent_editor(existingMaterial.getContent_editor());
		}
		if(material.getTopic() == null){
			material.setTopic(existingMaterial.getTopic());
		}
		
		Material updatedMaterial = materialService.updateMaterial(material);
		
		Resource<Material> materialResource = new Resource<>(updatedMaterial);
		return new ResponseEntity<>(materialResource, HttpStatus.OK);
	}
	
	@RequestMapping(value = "technologies/{technology_id}/topics/{topic_id}/materials/{material_id}", method = RequestMethod.DELETE, consumes = "application/json")
	public HttpEntity<Resource<Material>> deleteMaterial(@PathVariable Long technology_id, @PathVariable Long topic_id, @PathVariable Long material_id){
		materialService.deleteMaterial(material_id);
		return new ResponseEntity<>(HttpStatus.OK);
	}
}
