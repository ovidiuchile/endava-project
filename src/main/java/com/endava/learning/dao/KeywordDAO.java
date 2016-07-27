package com.endava.learning.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.stereotype.Repository;

import com.endava.learning.model.Keyword;

@Repository
@SuppressWarnings("rawtypes")
public class KeywordDAO extends AbstractDAO{
	@SuppressWarnings("unchecked")
	protected KeywordDAO() {
 		super(Keyword.class);
 	}

	public List<Keyword> getSearchResults(String input) {
		input.toLowerCase();
        StringTokenizer st = new StringTokenizer(input);
		List<Keyword> results = new ArrayList<>();

		while (st.hasMoreElements()) {
		    @SuppressWarnings("unchecked")
			List<Keyword> keywords = (List<Keyword>) em().createQuery("SELECT keyword FROM Keyword keyword WHERE keyword.keyword LIKE :keyword").setParameter("keyword", input).getResultList();
            results.addAll(keywords);
		}
		return results;
	}
}
