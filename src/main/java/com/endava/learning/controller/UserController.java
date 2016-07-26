package com.endava.learning.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	    

<<<<<<< HEAD
	    if (!userService.emailAlreadyExists(email)) {
=======
	@Autowired
	private EmailService emailService;

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ModelAndView createUser(@RequestParam(value = "name") String name,
			@RequestParam(value = "surname") String surname, @RequestParam(value = "email") String email,
			@RequestParam(value = "phone") String phone, @RequestParam(value = "country") String country,
			@RequestParam(value = "city") String city, @RequestParam(value = "address") String address) {
		ModelAndView model = new ModelAndView();
		model.setViewName("login");
		if (!userService.emailAlreadyExists(email)) {
>>>>>>> 5337712a3059aa8df3d7baf82fa72dd1a603b518
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
<<<<<<< HEAD
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
=======
			user.setUser_id(((long)(Math.random()*1000000000)));

			userService.createUser(user);
		}
		
>>>>>>> 5337712a3059aa8df3d7baf82fa72dd1a603b518
		return model;
	}
	
}
