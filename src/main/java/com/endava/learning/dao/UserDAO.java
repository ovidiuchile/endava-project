 package com.endava.learning.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.endava.learning.model.User;
import com.endava.learning.utils.CryptPassword;

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
        return (!em().createQuery("SELECT user FROM User user where user.email like :email AND user.password LIKE :password")
        		.setParameter("email", email).setParameter("password", CryptPassword.encodeMD5(password)).getResultList().isEmpty());
    }
<<<<<<< HEAD
    
=======


	public boolean emailAlreadyExists(String email) {
		return (!em().createQuery("SELECT user FROM User user WHERE user.email like :email").setParameter("email", email).getResultList().isEmpty());
	}

	public User getUserByEmail(String email) {
		return em().find(User.class, email);
	}

>>>>>>> 5337712a3059aa8df3d7baf82fa72dd1a603b518
    public boolean isValidUserAdmin(String email) {
        return (!em().createQuery("SELECT user FROM User user where user.email like :email" ).setParameter("email", email).getResultList().isEmpty());
    }
    
    public void updateType(String email, String type){
    	
    	System.out.println(em().createNativeQuery("UPDATE Users SET user_type = :type WHERE email = :email").setParameter("type", type).setParameter("email", email).executeUpdate());
    }
<<<<<<< HEAD
	public boolean emailAlreadyExists(String email) {
		return (!em().createQuery("SELECT user FROM User user WHERE user.email like :email").setParameter("email", email).getResultList().isEmpty());
	}
=======

>>>>>>> 5337712a3059aa8df3d7baf82fa72dd1a603b518
 }