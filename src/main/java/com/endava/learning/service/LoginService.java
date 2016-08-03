package com.endava.learning.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.endava.learning.dao.UserDAO;
import com.endava.learning.model.User;

@Service
public class LoginService {

    @Autowired
    private UserDAO userDAO;

    public boolean isValidUser(String email, String password) {
        return userDAO.isValidUser(email, password);
    }
}
