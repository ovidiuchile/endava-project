package com.endava.learning.controller;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping(value = "/", produces = MediaType.APPLICATION_JSON_VALUE)
public class LoginController {

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public ModelAndView handleRequestGET(HttpServletRequest request) {
        request.setAttribute("error", null);
        request.setAttribute("error2", null);
        request.setAttribute("success", null);
        
        ModelAndView model = new ModelAndView();
        if(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)
        	model.setViewName("login");
        else
        	model.setViewName("redirect:/home");
        return model;
	}
	
	@RequestMapping(value = "/logout")
	public ModelAndView logout(ServletRequest request){
		ModelAndView model = new ModelAndView();
		model.setViewName("redirect:/login");
		return model;
	}

	@RequestMapping(value = "")
	public ModelAndView home() {
		ModelAndView model = new ModelAndView();
		model.setViewName("login");
		return model;
	}
}
