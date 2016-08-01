package com.endava.learning.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.endava.learning.model.Keyword;
import com.endava.learning.model.Material;

@Repository
@SuppressWarnings("rawtypes")
public class KeywordDAO extends AbstractDAO{
	@SuppressWarnings("unchecked")
	protected KeywordDAO() {
 		super(Keyword.class);
 	}

	public List<Material> getSearchResults(String input) {
		input.replaceAll("[^a-zA-Z1-9 ]", "").toLowerCase().split("\\s+");
        StringTokenizer st = new StringTokenizer(input);
		List<Material> results = new ArrayList<>();

		while (st.hasMoreElements()) {

		    String word = st.nextToken();


			@SuppressWarnings("unchecked")
			List<Material> keywords = (List<Material>) em().createQuery("SELECT material FROM Material material WHERE material.title LIKE :word OR material.description LIKE :keyword").setParameter("word", "%" + word + "%").setParameter("keyword", "%" + word + "%").getResultList();

            results.addAll(keywords);
		}
		return results;
	}

	@SuppressWarnings("unchecked")
	public List<Material> getAdvancedSearchResults(String input, Integer type, String date, String contentEditor) {
		input.replaceAll("[^a-zA-Z1-9 ]", "").toLowerCase().split("\\s+");
		StringTokenizer st = new StringTokenizer(input);
		List<Material> results = new ArrayList<>();

        int cttEditor = em().createQuery("SELECT user.user_id FROM User user WHERE concat(user.name, ' ||', user.surname) LIKE :editor").setParameter("editor", contentEditor).getFirstResult();


        String queryString = "SELECT material FROM Material material WHERE (material.title LIKE :word OR material.description LIKE :keyword)";

		if(type.equals(0)){
		    queryString += " AND material.type = 0";
		}
		if(type.equals(1)){
			queryString += " AND material.type = 1";
		}
		if(type.equals(2)){
			queryString += " AND material.type = 2";
		}
		if (date != null) {
            queryString += " AND to_date(material.upload_date, 'DD.MM.YYYY') = :upload_date";
		}
		if (contentEditor != null) {
            queryString += " AND material.content_editor_id = :editorId";
		}
        Query query;
        query = em().createQuery(queryString);
        while (st.hasMoreElements()) {
			String word = st.nextToken();
            query.setParameter("word", "%" + word + "%").setParameter("keyword", "%" + word + "%");
            if (date != null) {
                query.setParameter("upload_date", date);
            }
            if (contentEditor != null) {
                query.setParameter("editorId", cttEditor);
            }
			results.addAll(query.getResultList());
		}
		return results;
	}
}
