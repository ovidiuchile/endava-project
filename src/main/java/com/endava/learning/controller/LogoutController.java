package com.endava.learning.controller;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class LogoutController {
	
	@RequestMapping(value = "/logout")
	public ModelAndView logout(ServletRequest req){
		HttpServletRequest request = (HttpServletRequest) req;
		HttpSession session = request.getSession(false);
		session.removeAttribute("email");
		
		ModelAndView model = new ModelAndView();
		model.setViewName("login");
		return model;
	}

}
