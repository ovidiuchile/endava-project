package com.endava.learning.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Resource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.endava.learning.model.User;
import com.endava.learning.service.UserService;

@RestController
@RequestMapping(value = "/register", consumes = "application/json")
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public HttpEntity<Resource<User>> createUser(@RequestBody User user){
		User createdUser = userService.createUser(user);
		Resource<User> userResource = new Resource<>(createdUser);
		
		return new ResponseEntity<>(userResource, HttpStatus.CREATED);
	}
}
