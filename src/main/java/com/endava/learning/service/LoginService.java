package com.endava.learning.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.endava.learning.dao.UserDAO;

@Service
public class LoginService {

    @Autowired
    private UserDAO userDAO;

    public boolean isValidUser(String email, String password) {
        return userDAO.isValidUser(email, password);
    }
}
