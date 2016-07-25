package com.endava.learning.service;

import com.endava.learning.dao.KeywordDAO;
import com.endava.learning.model.Keyword;
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

    public List<Keyword> getSearchResults(String input) {
        return keywordDAO.getSearchResults(input);
    }

    public List<Long> getAdvancedSearchResults(String input, String param) {
        StringTokenizer st = new StringTokenizer(input);
        ArrayList<Long> results = new ArrayList<>();
        String query;
        try (Connection connection = dataSource.getConnection()) {
            if(param.equals("training")){
                query = "SELECT t.topic_id, m.material_id from Topics t JOIN Keywords k ON k.topic_id = t.topic_id\n" +
                        "  JOIN Materials m ON m.topic_id = t.topic_id\n" +
                        "  JOIN Technologies te ON t.technology_id = te.technology_id\n" +
                        "  WHERE k.keyword LIKE ? AND te.name like ?;";
            } else {
                if(param.equals("date")){
                    query = "SELECT t.topic_id, m.material_id from Topics t JOIN Keywords k ON k.topic_id = t.topic_id\n" +
                            "  JOIN Materials m ON m.topic_id = t.topic_id\n" +
                            "  WHERE k.keyword LIKE ? AND m.upload_date = ?;";
                } else {
                    query = "SELECT t.topic_id, m.material_id from Topics t JOIN Keywords k ON k.topic_id = t.topic_id\n" +
                            "  JOIN Materials m ON m.topic_id = t.topic_id\n" +
                            "  JOIN  Users u on m.content_editor_id = u.user_id\n" +
                            "  WHERE k.keyword LIKE ? AND m.content_editor_id = ?;";
                }
            }
            while (st.hasMoreElements()) {
                PreparedStatement statement = connection.prepareStatement(query);
                statement.setString(1, st.nextElement().toString());
                ResultSet resultSet = statement.executeQuery();
                while(resultSet.next()) {
                    results.add(resultSet.getLong("TOPIC_ID"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return results;
    }
}
