package com.endava.learning.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.endava.learning.service.UserService;

@Controller
public class AdminController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String handleRequestGet(HttpServletRequest request) {
	    return "admin";
	}
	
	@RequestMapping(value = "/admin", method = RequestMethod.POST)
	public String handleRequestPost(HttpServletRequest request) {
		
	    String email = request.getParameter("email");
	    String type = request.getParameter("type_of_user");
	    
	    if(!userService.isValidUserAdmin(email)){
	    	request.setAttribute("error", "Invalid email address.");
	    	request.setAttribute("success", null);
	    }else{
	    	request.setAttribute("error", null);
	    	request.setAttribute("success", email + " was successfully set as " + type);
	    	userService.updateType(email,type);
	    }
	    
	    return "admin";
	}
}
