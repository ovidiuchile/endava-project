package com.endava.learning.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.endava.learning.dao.UserDAO;
import com.endava.learning.model.User;

@Service
public class UserService {
	@Autowired
	private UserDAO userDAO;

	public User createUser(User user) {
		userDAO.save(user);
		return user;
	}

	public boolean emailAlreadyExists(String email) {
		return userDAO.emailAlreadyExists(email);
	}

	public User getUserByEmail(String email) {
		return userDAO.getUserByEmail(email);
	}
}
