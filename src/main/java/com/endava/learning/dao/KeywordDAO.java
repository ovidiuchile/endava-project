package com.endava.learning.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.persistence.Query;

import com.endava.learning.model.User;
import org.springframework.stereotype.Repository;

import com.endava.learning.model.Keyword;
import com.endava.learning.model.Material;

@Repository
@SuppressWarnings("rawtypes")
public class KeywordDAO extends AbstractDAO {
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

			List<Material> keywords = (List<Material>) em().createQuery("SELECT material FROM Material material WHERE lower(material.title) LIKE :word OR lower(material.description) LIKE :keyword").setParameter("word", "%" + word.toLowerCase() + "%").setParameter("keyword", "%" + word.toLowerCase() + "%").getResultList();

			results.addAll(keywords);
		}
		return results;
	}

	@SuppressWarnings("unchecked")
	public List<Material> getAdvancedSearchResults(String input, Integer type, String startDate, String finishDate, String contentEditor) {
		input.replaceAll("[^a-zA-Z1-9 ]", "").toLowerCase().split("\\s+");
		StringTokenizer st = new StringTokenizer(input);
		List<Material> results = new ArrayList<>();
		System.out.println("okkkkkkk");
		User cttEditor = null;
		if (contentEditor != null) {
			cttEditor = (User) em().createQuery("SELECT user FROM User user WHERE user.name LIKE :editor")
					.setParameter("editor", contentEditor).getSingleResult();
			System.out.println("ceditor: " + cttEditor.getUser_id());
		}

		while (st.hasMoreElements()) {
			System.out.println("while");
			String queryString = "SELECT material FROM Material material";

			if (input != null){
				queryString += " WHERE (lower(material.title) LIKE :word OR lower(material.description) LIKE :keyword)";

			}

			if (type.equals(0)) {
				queryString += " AND material.type = 0";
			}
			if (type.equals(1)) {
				queryString += " AND material.type = 1";
			}
			if (type.equals(2)) {
				queryString += " AND material.type = 2";
			}
			if (startDate != null && finishDate != null) {
				queryString += " AND to_date(material.upload_date, 'YYYY-MM-DD') BETWEEN to_date(:startDate, 'YYYY-MM-DD') AND to_date(:finishDate, 'YYYY-MM-DD')";
			}
			if (contentEditor != null) {
				queryString += " AND material.content_editor.user_id = :editorId";
			}
			Query query;
			System.out.println(queryString);
			query = em().createQuery(queryString);
			String word = st.nextToken();

            if(input != null) {
				query.setParameter("word", "%" + word.toLowerCase() + "%").setParameter("keyword", "%" + word.toLowerCase() + "%");
			}
            if (startDate != null && finishDate != null) {
                query.setParameter("startDate", startDate);
                query.setParameter("finishDate", finishDate);
            }
            if (contentEditor != null) {
                query.setParameter("editorId", cttEditor.getUser_id());
            }

			results.addAll(query.getResultList());
		}
		return results;
	}
}
