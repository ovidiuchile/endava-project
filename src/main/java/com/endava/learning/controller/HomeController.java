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
		/*HttpServletRequest request = (HttpServletRequest) req;
		HttpSession session = request.getSession(false);
		String email = (String) session.getAttribute("email");
		
		
		if (email != null) {
			session.setAttribute("usertype", userService.getUserByEmail(email).getUser_type());
			*/
		model.setViewName("home");
		/*} else {
			model.setViewName("login");
		}*/
		return model;
	}
}
