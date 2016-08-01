package com.endava.learning.controller;

import javax.servlet.ServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.endava.learning.service.UserService;

@RestController
public class HomeController {
	@Autowired
	UserService userService;

	@RequestMapping("/")
	public ModelAndView home(ServletRequest req) {
		ModelAndView model = new ModelAndView();

		model.setViewName("home");
		return model;
	}
}
