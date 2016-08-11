package com.endava.learning.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.endava.learning.dao.KeywordDAO;
import com.endava.learning.dao.UserDAO;
import com.endava.learning.model.Material;
import com.endava.learning.model.User;

@Service
public class SearchService {

    @Autowired
    private KeywordDAO keywordDAO;
    
    @Autowired
    private UserDAO userDAO;

    public List<Material> getAdvancedSearchResults(String input, Integer type, String startDate, String finishDate, String contentEditor) {

        return keywordDAO.getAdvancedSearchResults(input, type, startDate, finishDate, contentEditor);
    }
    
    public List<User> getUsersSearchResults(String name, String type) {
        
    	return userDAO.getUsersSearchResults(name, type);
    }
}
