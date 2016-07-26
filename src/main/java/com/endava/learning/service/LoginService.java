package com.endava.learning.service;

import com.endava.learning.dao.UserDAO;
import com.endava.learning.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.util.List;

@Service
public class LoginService {

    @Autowired
    private UserDAO userDAO;

    public boolean isValidUser(String email, String password) {
        return userDAO.isValidUser(email, password);
    }

    public List<User> getUsers(){
        return userDAO.getUsers();
    }
}
