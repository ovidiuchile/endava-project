package com.endava.learning.controller;

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

@RestController
@RequestMapping(value = "/register")
public class UserController {
	@Autowired
	private UserService userService;

	@Autowired
	private EmailService emailService;

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ModelAndView createUser(@RequestParam(value = "name") String name,
			@RequestParam(value = "surname") String surname, @RequestParam(value = "email") String email,
			@RequestParam(value = "phone") String phone, @RequestParam(value = "country") String country,
			@RequestParam(value = "city") String city, @RequestParam(value = "address") String address) {
		if (!userService.emailAlreadyExists(email)) {
			User user = new User();
			user.setName(name);
			user.setSurname(surname);
			user.setEmail(email);
			String password = RandomStringUtils.randomAlphanumeric(16);
			user.setPassword(password);
			user.setPhoneNumber(phone);
			user.setCountry(country);
			user.setCity(city);
			user.setAddress(address);
			emailService.send(email, "E-learning - New acount", "Your password is: " + password);

			// User createdUser = userService.createUser(user);
			// @SuppressWarnings("unused")
			// Resource<User> userResource = new Resource<>(createdUser);
		}
		ModelAndView model = new ModelAndView();
		model.setViewName("login");
		return model;
	}
}
