package com.endava.learning.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UploadController {
	
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public ModelAndView handleGet(){
		ModelAndView model = new ModelAndView();
		model.setViewName("upload");
		return model;
	}

}
