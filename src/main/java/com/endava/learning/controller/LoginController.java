package com.endava.learning.controller;

import static org.springframework.hateoas.core.DummyInvocationUtils.methodOn;
import static org.springframework.hateoas.mvc.ControllerLinkBuilder.linkTo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.endava.learning.service.LoginService;

@RestController
@RequestMapping(value = "/", produces = MediaType.APPLICATION_JSON_VALUE)
public class LoginController {

    @Autowired
    private LoginService loginService;
    
    @RequestMapping(value = "users", method = RequestMethod.GET)
    public HttpEntity<Resources<Resource<User>>> getUsers(){

        List<User> users = loginService.getUsers();
        Resources<Resource<User>> usersResources = Resources.wrap(users);

        usersResources.add(linkTo(methodOn(LoginController.class).getUsers()).withRel("custom-self"));

        return new ResponseEntity<>(usersResources, HttpStatus.OK);
    }
    
    @RequestMapping(value = "login", method = RequestMethod.POST)
	public ModelAndView handleRequestPost(HttpServletRequest request) {
		
	    String email = request.getParameter("email_in");
	    String password = request.getParameter("password_in");
	    
	    ModelAndView model = new ModelAndView();

        if(loginService.isValidUser(email, password)) {
            model.setViewName("home");
        } else {
            model.setViewName("login");
            request.setAttribute("error", "Invalid email address or password.");
            request.setAttribute("success", null);
        }

        return model;
	}
    
	@RequestMapping(value = "/")
	public ModelAndView home(){
		ModelAndView model = new ModelAndView();
		model.setViewName("login");
		return model;
	}
}
