package com.endava.learning.controller;

import java.io.IOException;
import java.util.Calendar;

import javax.mail.MethodNotSupportedException;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileUploadException;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.endava.learning.model.Material;
import com.endava.learning.model.Technology;
import com.endava.learning.model.Topic;
import com.endava.learning.service.FileUploadService;
import com.endava.learning.service.MaterialService;
import com.endava.learning.service.TechnologyService;
import com.endava.learning.service.TopicService;
import com.endava.learning.service.UserService;

@Controller
public class UpdateController {
	private static final Logger LOGGER = Logger.getLogger(UpdateController.class);

	@Autowired
	private FileUploadService fileUploadService;

	@Autowired
	private TechnologyService technologyService;
	
	@Autowired
	private MaterialService materialService;

	@Autowired
	private TopicService topicService;
	
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public ModelAndView getUploadPage() {
		ModelAndView model = new ModelAndView();
		model.setViewName("upload");
		return model;
	}

	@RequestMapping(value = "/upload-technology", method = RequestMethod.POST)
	public ModelAndView addTechnology(@RequestParam("technology") String technologyName) {
		Technology technology = new Technology();
		technology.setName(technologyName);
		technology.setTechnology_id(((long) (Math.random() * 1000000000)));
		technologyService.saveTechnology(technology);

		ModelAndView model = new ModelAndView();
		model.setViewName("upload");
		return model;
	}

	@RequestMapping(value = "/upload-topic", method = RequestMethod.POST)
	public ModelAndView addTopic(@RequestParam("technology") String technology,
			@RequestParam("topic") String topicName) {

		Topic topic = new Topic();
		topic.setName(topicName);
		topic.setTechnology(technologyService.getTechnologiesByID(Long.parseLong(technology)));
		topic.setTopic_id(((long) (Math.random() * 1000000000)));
		topicService.saveTopic(topic);

		ModelAndView model = new ModelAndView();
		model.setViewName("upload");
		return model;
	}

	@RequestMapping(value = "/upload-material", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView uploadFile(@RequestParam("technology") Long technology_id, @RequestParam("topic") Long topic_id,
			@RequestParam("material") String materialName, @RequestParam("description") String materialDescription,
			@RequestParam("file") MultipartFile file, HttpServletRequest request) {

		Material material = new Material();
		material.setMaterial_id(((long)(Math.random()*1000000000)));
		material.setTopic(topicService.getTopicByID(topic_id));
		material.setDescription(materialDescription);
		material.setTitle(materialName);
		material.setUpload_date(Calendar.getInstance().get(Calendar.YEAR) + "-"
				+ Calendar.getInstance().get(Calendar.MONTH) + "-" + Calendar.getInstance().get(Calendar.DAY_OF_WEEK));
        
		if(file.getContentType().contains("image")){
        	material.setType(0);
        }
        else{
        	if(file.getContentType().contains("video")){
        		material.setType(1);
        	}
        	else{
        		if(file.getContentType().contains("powerpoint") || file.getContentType().contains("pdf")){
        			material.setType(2);
        		}
        		else{
        			material.setType(-1);
        		}
        	}
        }
		try {
			String fileLink = fileUploadService.uploadFile(file);
			material.setLink(fileLink);
		} catch (IOException | FileUploadException exception) {
			LOGGER.log(org.apache.log4j.Level.ERROR, "Upload has failed", exception);
			exception.printStackTrace();
		}
		
		material.setContent_editor(userService.getUserById(Long.parseLong(request.getSession().getAttribute("id").toString())));
		materialService.createMaterial(material);
		
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
	public ModelAndView deleteTopic(@RequestParam("technology") String technology,
			@RequestParam("topic") String topic_id, @RequestParam("_method") String method) {
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
	
	@RequestMapping(value = "/delete-material", method = RequestMethod.POST)
	public ModelAndView deleteMaterial(@RequestParam("technology")String technology, @RequestParam("topic")String topic, @RequestParam("material")String material){
		materialService.deleteMaterial(Long.parseLong(material));
		ModelAndView model = new ModelAndView();
		model.setViewName("delete");
		return model;
	}
}