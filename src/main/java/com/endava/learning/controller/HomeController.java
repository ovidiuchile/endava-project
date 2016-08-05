package com.endava.learning.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.endava.learning.service.UserService;

@RestController
public class HomeController {
	@Autowired
	UserService userService;

	@RequestMapping("/home")
	public ModelAndView home(HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
        if(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)
        	model.setViewName("redirect:/login");
        else
        	model.setViewName("home");
		return model;
	}
}
