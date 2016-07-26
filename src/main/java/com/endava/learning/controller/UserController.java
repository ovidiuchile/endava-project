package com.endava.learning.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Resource;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.endava.learning.model.User;
import com.endava.learning.service.UserService;

@RestController
@RequestMapping(value = "/")
public class UserController {
	@Autowired
	private UserService userService;
	
	private static boolean x = true;
	
	@RequestMapping(value = "/login2", method = RequestMethod.POST)
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
			String password = RandomStringUtils.random(16);
			user.setPassword(password);
			user.setPhoneNumber(phone);
			user.setCountry(country);
			user.setCity(city);
			user.setAddress(address);
			User createdUser = userService.createUser(user);
			Resource<User> userResource = new Resource<>(createdUser);
			request.setAttribute("error", null);
            request.setAttribute("success", "Successfully created your accound. Please, sign in");
            x = false;
		}
		//insuccessfully created
	    if(x){
	    	request.setAttribute("error", "This email address already exists");
            request.setAttribute("success", null);
	    }
		System.out.println("NEGHINAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
		ModelAndView model = new ModelAndView();
		model.setViewName("login");
		return model;
	}
	
}
