package com.endava.learning.controller;

import java.io.IOException;

import javax.mail.MethodNotSupportedException;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileUploadException;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Resource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.endava.learning.model.Technology;
import com.endava.learning.model.Topic;
import com.endava.learning.service.FileUploadService;
import com.endava.learning.service.TechnologyService;
import com.endava.learning.service.TopicService;

@Controller
public class UpdateController {
	private static final Logger LOGGER = Logger.getLogger(UpdateController.class);

	@Autowired
	private FileUploadService fileUploadService;
	
	@Autowired
	private TechnologyService technologyService;
	
	@Autowired
	private TopicService topicService;

	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public ModelAndView getUploadPage() {
		ModelAndView model = new ModelAndView();
		model.setViewName("upload");
		return model;
	}
	
	@RequestMapping(value = "/upload-technology", method = RequestMethod.POST)
	public ModelAndView addTechnology(@RequestParam("technology")String technologyName) {
		Technology technology = new Technology();
		technology.setName(technologyName);
		technology.setTechnology_id(((long) (Math.random() * 1000000000)));
		technologyService.saveTechnology(technology);

		ModelAndView model = new ModelAndView();
		model.setViewName("upload");
		return model;
	}
	
	@RequestMapping(value = "/upload-topic", method = RequestMethod.POST)
	public ModelAndView addTopic(@RequestParam("technology")String technology, @RequestParam("topic")String topicName) {

		Topic topic = new Topic();
        topic.setName(topicName);
        topic.setTechnology(technologyService.getTechnologiesByID(Long.parseLong(technology)));
		topic.setTopic_id(((long)(Math.random()*1000000000)));
		topicService.saveTopic(topic);

		Resource<Topic> topicResource = new Resource<>(topic);
		ModelAndView model = new ModelAndView();
		model.setViewName("upload");
		return model;
	}
	
	@RequestMapping(value = "/upload-material", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView uploadFile(@RequestParam("technology") Long technology_id, @RequestParam("topic") Long topic_id,
			@RequestParam("material") String materialName, @RequestParam("description") String materialDescription,
			@RequestParam("file") MultipartFile file, HttpServletRequest request) {

		System.out.println(topic_id);
		try {
			@SuppressWarnings("unused")
			Long fileId = fileUploadService.uploadFile(topic_id, materialName, materialDescription, file);
		} catch (IOException | FileUploadException exception) {
			LOGGER.log(org.apache.log4j.Level.ERROR, "Upload has failed", exception);
		}
		
		ModelAndView model = new ModelAndView();
		model.setViewName("upload");
		return model;
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView getDeletePage() {
		ModelAndView model = new ModelAndView();
		model.setViewName("delete");
		return model;
	}
	
	
	@RequestMapping(value = "/delete-technology", method = RequestMethod.POST)
	public ModelAndView deleteTechnology(@RequestParam("technology") String technology_id,
			@RequestParam("_method") String method) {
		if (method.equals("DELETE")) {
			technologyService.deleteTechnology(Long.parseLong(technology_id));
		} else {
			try {
				throw new MethodNotSupportedException();
			} catch (MethodNotSupportedException e) {
				e.printStackTrace();
			}
		}
		
		ModelAndView model = new ModelAndView();
		model.setViewName("delete");
		return model;
	}
	
	@RequestMapping(value = "/delete-topic", method = RequestMethod.POST)
	public ModelAndView deleteTopic(@RequestParam("technology")String technology, @RequestParam("topic")String topic_id, @RequestParam("_method") String method){
		if (method.equals("DELETE")) {
			topicService.deleteTopic(Long.parseLong(topic_id));
		} else {
			try {
				throw new MethodNotSupportedException();
			} catch (MethodNotSupportedException e) {
				e.printStackTrace();
			}
		}
		
		ModelAndView model = new ModelAndView();
		model.setViewName("delete");
		return model;
	}
}