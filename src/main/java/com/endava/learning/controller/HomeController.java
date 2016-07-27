package com.endava.learning.controller;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.endava.learning.service.UserService;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class HomeController {
	@Autowired
	UserService userService;

	@RequestMapping("/home")
	public ModelAndView home(ServletRequest req) {
		ModelAndView model = new ModelAndView();
		model.setViewName("home");
		/*HttpServletRequest request = (HttpServletRequest) req;
		HttpSession session = request.getSession(false);
		String email = (String) session.getAttribute("email");
		
		
		if (email != null) {
			session.setAttribute("usertype", userService.getUserByEmail(email).getUser_type());*/
			return model;
		/*} else {
			return "login";
		}*/
	}
}
