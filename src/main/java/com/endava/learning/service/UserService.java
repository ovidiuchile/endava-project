package com.endava.learning.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.endava.learning.dao.UserDAO;
import com.endava.learning.model.User;

@Service
public class UserService {
	@Autowired
	private UserDAO userDAO;

	@SuppressWarnings("unchecked")
	public User createUser(User user) {
		userDAO.save(user);
		return user;
	}
<<<<<<< HEAD
	
=======


	public boolean emailAlreadyExists(String email) {
		return userDAO.emailAlreadyExists(email);
	}

	public User getUserByEmail(String email) {
		return userDAO.getUserByEmail(email);

>>>>>>> 5337712a3059aa8df3d7baf82fa72dd1a603b518
	public boolean isValidUserAdmin(String email){
		return userDAO.isValidUserAdmin(email);
	}
	
	public void updateType(String email, String type){
		userDAO.updateType(email,type);
<<<<<<< HEAD
	}

	public boolean emailAlreadyExists(String email) {
		return userDAO.emailAlreadyExists(email);
=======
>>>>>>> 5337712a3059aa8df3d7baf82fa72dd1a603b518
	}
}
