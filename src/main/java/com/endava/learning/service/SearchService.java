package com.endava.learning.service;

import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.StringTokenizer;

@Service
public class SearchService {

    private DataSource dataSource;

    public DataSource getDataSource() {
        return dataSource;
    }

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public ArrayList<Long> getSearchResults(String input) {
        StringTokenizer st = new StringTokenizer(input);
        ArrayList<Long> results = new ArrayList<>();
        try (Connection connection = dataSource.getConnection()) {
            while (st.hasMoreElements()) {
                String query = "SELECT k.topic_id FROM keywords k WHERE k.keyword LIKE ?";
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
