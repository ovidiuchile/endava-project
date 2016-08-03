package com.endava.learning.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.endava.learning.dao.UserDAO;
import com.endava.learning.model.User;
import com.endava.learning.utils.CryptPassword;

import java.util.List;

@Service
public class UserService {
	@Autowired
	private UserDAO userDAO;

	@SuppressWarnings("unchecked")
	public User createUser(User user) {
		userDAO.save(user);
		return user;
	}

	@SuppressWarnings("unchecked")
	public User updateUser(User user) {
		userDAO.update(user);
		return user;
	}

	public boolean emailAlreadyExists(String email) {
		return userDAO.emailAlreadyExists(email);
	}

	public User getUserByEmail(String email) {
		return userDAO.getUserByEmail(email);
	}

	public boolean isValidUserAdmin(String email) {
		return userDAO.isValidUserAdmin(email);
	}

	public void updateType(String email, String type) {
		userDAO.updateType(email, type);
	}

	public User loginUser(String email, String password) {
		if (password == null || email == null) {
			return null;
		}
		User currentUser = getUserByEmail(email);
		if (currentUser == null) {
			return null;
		}
		return CryptPassword.matches(password, currentUser.getPassword()) ? currentUser : null;
	}
	
	@Transactional
	public void deleteUser(final Long user_id){
		userDAO.delete(user_id);
	}

	public List<User> getUsers(){
		return userDAO.getUsers();
	}
}
