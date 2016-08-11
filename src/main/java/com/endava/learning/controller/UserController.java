package com.endava.learning.controller;

import static org.springframework.hateoas.core.DummyInvocationUtils.methodOn;
import static org.springframework.hateoas.mvc.ControllerLinkBuilder.linkTo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Resource;
import org.springframework.hateoas.Resources;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.endava.learning.model.User;
import com.endava.learning.service.EmailService;
import com.endava.learning.service.LoginService;
import com.endava.learning.service.UserService;


@RestController
@RequestMapping(value = "/" ,produces = MediaType.APPLICATION_JSON_VALUE)
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private EmailService emailService;
	
	@Autowired
	private LoginService loginService;

	@RequestMapping(value = "users", method = RequestMethod.GET)
	public HttpEntity<Resources<Resource<User>>> getUsers() {

		List<User> users = userService.getUsers();
		Resources<Resource<User>> usersResources = Resources.wrap(users);

		usersResources.add(linkTo(methodOn(UserController.class).getUsers()).withRel("custom-self"));

		return new ResponseEntity<>(usersResources, HttpStatus.OK);
	}

	@RequestMapping(value = "register", method = RequestMethod.POST)
	public ModelAndView handleRequestPost(HttpServletRequest request) {
	    String name = request.getParameter("name");
		String surname = request.getParameter("surname");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone"); 
		String country = request.getParameter("country");
		String city = request.getParameter("city"); 
		String address = request.getParameter("address");
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	    if (!userService.emailAlreadyExists(email)) {
			User user = new User();
			user.setName(name);
			user.setSurname(surname);
			user.setEmail(email);
			String password = RandomStringUtils.randomAlphanumeric(16);
			emailService.send(user.getEmail(), "E-learning - New acount", "Your password is: " + password);
			user.setPassword(passwordEncoder.encode(password));
			user.setPhoneNumber(phone);
			user.setCountry(country);
			user.setCity(city);
			user.setAddress(address);
			user.setUser_type("Normal user");
			user.setUser_id(((long)(Math.random()*1000000000)));
			userService.createUser(user);
			
			//successfully created
			request.getSession().setAttribute("error", null);
			request.setAttribute("error2", null);
            request.setAttribute("success", "Successfully created your accound. Please, sign in");
		}
		//insuccessfully created
	    else{
	    	request.setAttribute("error", "This email address already exists");
	    	request.setAttribute("error2", "This email address already exists");
            request.setAttribute("success", null);
	    }
		ModelAndView model = new ModelAndView();
		model.setViewName("login");
		return model;
	}
	
	
	@RequestMapping(value = "forgot-password", method = RequestMethod.GET)
	public ModelAndView newPassordGet(HttpServletRequest request) {
		
		ModelAndView model = new ModelAndView();
		request.getSession().setAttribute("error", null);
		model.setViewName("forgot_password");
		return model;
	}
	
	@RequestMapping(value = "change-password", method = RequestMethod.GET)
	public ModelAndView changePassordGet(HttpServletRequest request) {
		
		ModelAndView model = new ModelAndView();
		model.setViewName("change_password");
		return model;
	}
	
	@RequestMapping(value = "forgot-password", method = RequestMethod.POST)
	public ModelAndView forgotPassword(HttpServletRequest request) {

		String email = request.getParameter("email");
		ModelAndView model = new ModelAndView();
		model.setViewName("forgot_password");
		
		request.setAttribute("msg", "If there exists an user registered with this email, a new password will be sent to him.");
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		if (userService.emailAlreadyExists(email)) {
			String password = RandomStringUtils.randomAlphanumeric(16);
			User updatedUser = userService.getUserByEmail(email);
			updatedUser.setPassword(passwordEncoder.encode(password));
			userService.updateUser(updatedUser);
			emailService.send(email, "E-learning - New password", "Your password is: " + password);
		} 
		
		return model;
	}

	@RequestMapping(value = "change-password", method = RequestMethod.POST)
	public ModelAndView changePassword(HttpServletRequest request) {

		String email = request.getParameter("email");
		String oldPassword = request.getParameter("old_password");
		String newPassword = request.getParameter("new_password");

		ModelAndView model = new ModelAndView();
		model.setViewName("change_password");
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		if (loginService.isValidUser(email, oldPassword)) {
			User updatedUser = userService.getUserByEmail(email);
			updatedUser.setPassword(passwordEncoder.encode(newPassword));
			userService.updateUser(updatedUser);
			emailService.send(email, "E-learning - New password", "Your password is: " + newPassword);
			request.setAttribute("msg", "Password changed");
		} else {
			request.setAttribute("msg", "Invalid email address or old password.");
		}
		return model;
	}
	
	@RequestMapping(value = "users/{user_id}", method = RequestMethod.DELETE)
	public HttpEntity<Resource<User>> deleteUser(@PathVariable("user_id") Long user_id) {
		userService.deleteUser(user_id);

		return new ResponseEntity<>(HttpStatus.OK);
	}
}
