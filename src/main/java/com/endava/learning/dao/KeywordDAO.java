package com.endava.learning.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.persistence.Query;

import com.endava.learning.model.User;
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
		System.out.println("okkkkkkk");
		User cttEditor = null;
		if(contentEditor != null) {
			cttEditor = (User) em().createQuery("SELECT user FROM User user WHERE user.name LIKE :editor").setParameter("editor", contentEditor).getSingleResult();
			System.out.println("ceditor: " + cttEditor.getUser_id());
		}

        while (st.hasMoreElements()) {
			System.out.println("while");
			String queryString = "SELECT material FROM Material material";

			if (input != null){
				queryString += " WHERE (material.title LIKE :word OR material.description LIKE :keyword)";
			}

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
				queryString += " AND material.upload_date = :upload_date";
			}
			if (contentEditor != null) {
				queryString += " AND material.content_editor.user_id = :editorId";
			}
			Query query;
			System.out.println(queryString);
			query = em().createQuery(queryString);
			String word = st.nextToken();
            if(input != null) {
				query.setParameter("word", "%" + word + "%").setParameter("keyword", "%" + word + "%");
			}
            if (date != null) {
                query.setParameter("upload_date", date);
            }
            if (contentEditor != null) {
                query.setParameter("editorId", cttEditor.getUser_id());
            }
			results.addAll(query.getResultList());
		}
		return results;
	}
}
