package com.endava.learning.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.endava.learning.model.User;

@Repository
@SuppressWarnings("rawtypes")
@Transactional
public class UserDAO extends AbstractDAO {
	@SuppressWarnings("unchecked")
	protected UserDAO() {
		super(User.class);
	}

	@SuppressWarnings("unchecked")
	public List<User> getUsers() {

		List<User> users = (List<User>) em().createQuery("SELECT user FROM User user ORDER BY user.name, user.surname").getResultList();
		return users;
	}

	public boolean isValidUser(String email, String password) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		return passwordEncoder.matches(password, getUserByEmail(email).getPassword());
	}

	public boolean emailAlreadyExists(String email) {
		return (!em().createQuery("SELECT user FROM User user WHERE user.email like :email")
				.setParameter("email", email).getResultList().isEmpty());
	}

	public User getUserByEmail(String email) {
		User user = null;

		if (!em().createQuery("SELECT user FROM User user WHERE user.email like :email").setParameter("email", email)
				.getResultList().isEmpty()) {
			user = (User) em().createQuery("SELECT user FROM User user WHERE user.email like :email")
					.setParameter("email", email).getSingleResult();
		}
		return user;
	}

	public boolean isValidUserAdmin(String email) {
		return (!em().createQuery("SELECT user FROM User user where user.email like :email")
				.setParameter("email", email).getResultList().isEmpty());
	}

	public void updateType(String email, String type) {

		em().createNativeQuery("UPDATE Users SET user_type = :type WHERE email = :email").setParameter("type", type)
				.setParameter("email", email).executeUpdate();
	}

	public List<User> getUsersSearchResults(String name, String type) {

		List<User> results = new ArrayList<>();

		if (name != null && type != null) {
			@SuppressWarnings("unchecked")
			List<User> keywords = (List<User>) em()
					.createQuery(
							"SELECT user FROM User user WHERE (lower(user.name) LIKE lower(:name) OR lower(user.surname) LIKE lower(:name)) AND lower(user.user_type) LIKE lower(:type) order by user.user_type, user.email")
					.setParameter("name", "%" + name + "%").setParameter("type", "%" + type + "%").getResultList();
			results.addAll(keywords);
		} else if (name == null) {
			@SuppressWarnings("unchecked")
			List<User> keywords = (List<User>) em()
					.createQuery("SELECT user FROM User user WHERE lower(user.user_type) LIKE lower(:type) order by user.user_type, user.email")
					.setParameter("type", "%" + type + "%").getResultList();
			results.addAll(keywords);
		}

		else if (type == null) {
			@SuppressWarnings("unchecked")
			List<User> keywords = (List<User>) em()
					.createQuery(
							"SELECT user FROM User user WHERE lower(user.name) LIKE lower(:name) OR lower(user.surname) LIKE lower(:name) order by user.user_type, user.email")
					.setParameter("name", "%" + name + "%").getResultList();
			results.addAll(keywords);
		}

		return results;
	}
}