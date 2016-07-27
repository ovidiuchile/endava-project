package com.endava.learning.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.endava.learning.model.User;
import com.endava.learning.service.EmailService;
import com.endava.learning.service.UserService;
import com.endava.learning.utils.CryptPassword;

@RestController
@RequestMapping(value = "/")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private EmailService emailService;
	
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public ModelAndView handleRequestPost(HttpServletRequest request) {
	    String name = request.getParameter("name");
		String surname = request.getParameter("surname");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone"); 
		String country = request.getParameter("country");
		String city = request.getParameter("city"); 
		String address = request.getParameter("address");

	    if (!userService.emailAlreadyExists(email)) {
			User user = new User();
			user.setName(name);
			user.setSurname(surname);
			user.setEmail(email);
			String password = RandomStringUtils.randomAlphanumeric(16);
			emailService.send(user.getEmail(), "E-learning - New acount", "Your password is: " + password);
			user.setPassword(CryptPassword.encodeMD5(password));
			user.setPhoneNumber(phone);
			user.setCountry(country);
			user.setCity(city);
			user.setAddress(address);
			user.setUser_id(((long)(Math.random()*1000000000)));
			userService.createUser(user);
			
			//successfully created
			request.setAttribute("error", null);
            request.setAttribute("success", "Successfully created your account. Please, sign in");
		}
	    else{
	    	//insuccessfully created
	    	request.setAttribute("error", "This email address already exists");
            request.setAttribute("success", null);
	    }
		ModelAndView model = new ModelAndView();
		model.setViewName("login");
		return model;
	}
	
}
