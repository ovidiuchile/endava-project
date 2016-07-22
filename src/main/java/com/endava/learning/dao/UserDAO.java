 package com.endava.learning.dao;

import com.endava.learning.model.User;

@SuppressWarnings("rawtypes")
public class UserDAO extends AbstractDAO{
 	@SuppressWarnings("unchecked")
	protected UserDAO() {
 		super(User.class);
 	}
 }