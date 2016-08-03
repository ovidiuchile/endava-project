package com.endava.learning.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.endava.learning.model.Keyword;
import com.endava.learning.model.Material;
import com.endava.learning.model.User;

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

			List<Material> keywords = (List<Material>) em()
					.createQuery(
							"SELECT material FROM Material material WHERE lower(material.title) LIKE :word OR lower(material.description) LIKE :keyword")
					.setParameter("word", "%" + word.toLowerCase() + "%")
					.setParameter("keyword", "%" + word.toLowerCase() + "%").getResultList();

			results.addAll(keywords);
		}
		return results;
	}

	@SuppressWarnings("unchecked")
	public List<Material> getAdvancedSearchResults(String input, Integer type, String startDate, String finishDate,
												   String contentEditor) {
		input.replaceAll("[^a-zA-Z1-9 ]", "").toLowerCase().split("\\s+");
		List<Material> results = new ArrayList<>();
		List<User> cttEditor = new ArrayList<>();
		if (contentEditor != null) {
			cttEditor = (List<User>) em()
					.createQuery(
							"SELECT user FROM User user WHERE user.name LIKE :editor OR user.surname LIKE :editor OR concat(user.name, ' ', user.surname) LIKE :editor")
					.setParameter("editor", "%" + contentEditor + "%").getResultList();
		}
		for (User user : cttEditor) {
			StringTokenizer st = new StringTokenizer(input);
			System.out.println(user.getName());
			while (st.hasMoreElements()) {
				String queryString = "SELECT material FROM Material material";

				if (input != null) {
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
				query = em().createQuery(queryString);
				String word = st.nextToken();

				if (input != null) {
					query.setParameter("word", "%" + word.toLowerCase() + "%").setParameter("keyword",
							"%" + word.toLowerCase() + "%");
				}
				if (startDate != null && finishDate != null) {
					query.setParameter("startDate", startDate);
					query.setParameter("finishDate", finishDate);
				}
				if (contentEditor != null) {
					query.setParameter("editorId", user.getUser_id());
				}
				results.addAll(query.getResultList());
			}
		}
		return results;
	}
}
