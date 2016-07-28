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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.endava.learning.model.User;
import com.endava.learning.service.EmailService;
import com.endava.learning.service.LoginService;
import com.endava.learning.service.UserService;
import com.endava.learning.utils.CryptPassword;

@RestController
@RequestMapping(value = "/", produces = MediaType.APPLICATION_JSON_VALUE)
public class LoginController {

	@Autowired
	private LoginService loginService;

	@Autowired
	private EmailService emailService;

	@Autowired
	private UserService userService;

	@RequestMapping(value = "users", method = RequestMethod.GET)
	public HttpEntity<Resources<Resource<User>>> getUsers() {

		List<User> users = loginService.getUsers();
		Resources<Resource<User>> usersResources = Resources.wrap(users);

		usersResources.add(linkTo(methodOn(LoginController.class).getUsers()).withRel("custom-self"));

        return new ResponseEntity<>(usersResources, HttpStatus.OK);
    }
    
    @RequestMapping(value = "login", method = RequestMethod.GET)
	public ModelAndView handleRequestGET(HttpServletRequest request) {
        request.setAttribute("error", null);
        request.setAttribute("error2", null);
        request.setAttribute("success", null);
        
        ModelAndView model = new ModelAndView();
        model.setViewName("login");
        return model;
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public ModelAndView handleRequestPost(HttpServletRequest request) {

		String email = request.getParameter("email_in");
		String password = request.getParameter("password_in");

		ModelAndView model = new ModelAndView();

		if (loginService.isValidUser(email, password)) {
			model.setViewName("home");
		} else {
			model.setViewName("login");
			request.setAttribute("error", "Invalid email address or password.");
			request.setAttribute("success", null);
		}
		return model;
	}

	@RequestMapping(value = "forgot-password", method = RequestMethod.POST)
	public ModelAndView forgotPassword(HttpServletRequest request) {

		String email = request.getParameter("email");
		ModelAndView model = new ModelAndView();
		model.setViewName("forgot_password");
		
		request.setAttribute("msg", "If there exists an user registered with this email, a new password will be sent to him.");
		
		if (userService.emailAlreadyExists(email)) {
			String password = RandomStringUtils.randomAlphanumeric(16);
			User updatedUser = userService.getUserByEmail(email);
			updatedUser.setPassword(CryptPassword.encodeMD5(password));
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
		
		if (loginService.isValidUser(email, oldPassword)) {
			User updatedUser = userService.getUserByEmail(email);
			updatedUser.setPassword(CryptPassword.encodeMD5(newPassword));
			userService.updateUser(updatedUser);
			emailService.send(email, "E-learning - New password", "Your password is: " + newPassword);
			request.setAttribute("msg", "Password changed");
		} else {
			request.setAttribute("msg", "Invalid email address or old password.");
		}
		return model;
	}

	@RequestMapping(value = "")
	public ModelAndView home() {
		ModelAndView model = new ModelAndView();
		model.setViewName("login");
		return model;
	}
}
