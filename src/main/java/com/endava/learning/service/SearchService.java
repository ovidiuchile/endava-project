package com.endava.learning.service;

import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.endava.learning.dao.KeywordDAO;
import com.endava.learning.model.Material;

@Service
public class SearchService {

    @Autowired
    private KeywordDAO keywordDAO;

    public List<Material> getSearchResults(String input) {
        return keywordDAO.getSearchResults(input);
    }

    public List<Material> getAdvancedSearchResults(String input, Integer type, String startDate, String finishDate, String contentEditor) {

        return keywordDAO.getAdvancedSearchResults(input, type, startDate, finishDate, contentEditor);
    }
}
