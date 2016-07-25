package com.endava.learning.dao;

import com.endava.learning.model.Keyword;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

@Repository
@SuppressWarnings("rawtypes")
public class KeywordDAO extends AbstractDAO{
	@SuppressWarnings("unchecked")
	protected KeywordDAO() {
 		super(Keyword.class);
 	}

	public List<Keyword> getSearchResults(String input) {
		StringTokenizer st = new StringTokenizer(input);
		List<Keyword> results = new ArrayList<>();

		while (st.hasMoreElements()) {
			List<Keyword> keywords = em().createQuery("SELECT k FROM Keyword k JOIN Topic t ON k.topic_id = t.id WHERE  = :keyword").getResultList();
			results.add((Keyword) keywords);
		}
		return results;
	}
}
