 package com.endava.learning.dao;

import com.endava.learning.model.User;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

 @Repository
 @SuppressWarnings("rawtypes")
 @Transactional
public class UserDAO extends AbstractDAO{
 	@SuppressWarnings("unchecked")
	protected UserDAO() {
 		super(User.class);
 	}

 	@SuppressWarnings("unchecked")
 	public List<User> getUsers() {

        List<User> users = (List<User>) em().createQuery("SELECT user FROM User user").getResultList();
        return users;
    }

    public boolean isValidUser(String email, String password) {
        return (!em().createQuery("SELECT user FROM User user where user.email like :email AND user.password LIKE :password").setParameter("email", email).setParameter("password", password).getResultList().isEmpty());
    }

 }