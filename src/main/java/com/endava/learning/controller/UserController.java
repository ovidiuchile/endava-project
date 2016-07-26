package com.endava.learning.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Resource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.endava.learning.model.User;
import com.endava.learning.service.UserService;

@RestController
@RequestMapping(value = "/register", consumes = "application/json")
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public HttpEntity<Resource<User>> createUser(@RequestParam(value = "name") String name, @RequestParam(value = "surname") String surname, @RequestParam(value = "email") String email,
			@RequestParam(value = "password") String password, @RequestParam(value = "phone") String phone,
			@RequestParam(value = "country") String country, @RequestParam(value = "city") String city, 
			@RequestParam(value = "address") String address){
				
		User user = new User();
		user.setName(name);
		user.setSurname(surname);
		user.setEmail(email);
		user.setPassword(password);
		user.setPhoneNumber(phone);
		user.setCountry(country);
		user.setCity(city);
		user.setAddress(address);
		User createdUser = userService.createUser(user);
		Resource<User> userResource = new Resource<>(createdUser);
		
		return new ResponseEntity<>(userResource, HttpStatus.CREATED);
	}
}
