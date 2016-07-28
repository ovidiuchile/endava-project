package com.endava.learning.controller;

import javax.servlet.ServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class LogoutController {
	
	@RequestMapping(value = "/logout")
	public ModelAndView logout(ServletRequest req){
		ModelAndView model = new ModelAndView();
		model.setViewName("logout");
		return model;
	}

}
