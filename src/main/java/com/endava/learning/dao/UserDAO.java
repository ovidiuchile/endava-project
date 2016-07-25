 package com.endava.learning.dao;

import org.springframework.stereotype.Repository;

import com.endava.learning.model.User;

@SuppressWarnings("rawtypes")
@Repository
public class UserDAO extends AbstractDAO{
 	@SuppressWarnings("unchecked")
	protected UserDAO() {
 		super(User.class);
 	}
 }