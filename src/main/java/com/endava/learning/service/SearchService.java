package com.endava.learning.service;

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

    @SuppressWarnings("unused")
	private DataSource dataSource;

    public List<Material> getSearchResults(String input) {
        return keywordDAO.getSearchResults(input);
    }

    public List<Material> getAdvancedSearchResults(String input, boolean typeB, boolean dateB, boolean contentEditorB,
                                                   int type, String date, String contentEditor) {

        return keywordDAO.getAdvancedSearchResults(input, typeB, dateB, contentEditorB, type, date, contentEditor);
    }
}
