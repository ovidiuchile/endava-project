package com.endava.learning.service;

import com.endava.learning.dao.KeywordDAO;
import com.endava.learning.model.Keyword;
import com.endava.learning.model.Material;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

@Service
public class SearchService {

    @Autowired
    private KeywordDAO keywordDAO;

    private DataSource dataSource;

    public List<Material> getSearchResults(String input) {
        return keywordDAO.getSearchResults(input);
    }

    public List<Material> getAdvancedSearchResults(String input, boolean typeB, boolean dateB, boolean contentEditorB,
                                                   int type, String date, String contentEditor) {

        return keywordDAO.getAdvancedSearchResults(input, typeB, dateB, contentEditorB, type, date, contentEditor);
    }
}
