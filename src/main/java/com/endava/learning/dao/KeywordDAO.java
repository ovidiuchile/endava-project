package com.endava.learning.dao;

import com.endava.learning.model.Keyword;
import com.endava.learning.model.Material;
import org.springframework.stereotype.Repository;

import javax.persistence.Query;
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

	public List<Material> getSearchResults(String input) {
		input.replaceAll("[^a-zA-Z1-9 ]", "").toLowerCase().split("\\s+");
        StringTokenizer st = new StringTokenizer(input);
		List<Material> results = new ArrayList<>();

		while (st.hasMoreElements()) {
		    String word = st.nextToken();
			List<Material> keywords = (List<Material>) em().createQuery("SELECT material FROM Material material WHERE lower(material.title) LIKE :word OR lower(material.description) LIKE :keyword").setParameter("word", "%" + word + "%").setParameter("keyword", "%" + word + "%").getResultList();
            results.addAll(keywords);
		}
		return results;
	}

	public List<Material> getAdvancedSearchResults(String input, boolean typeB, boolean dateB, boolean contentEditorB,
                                                   int type, String date, String contentEditor) {
		input.replaceAll("[^a-zA-Z1-9 ]", "").toLowerCase().split("\\s+");
		StringTokenizer st = new StringTokenizer(input);
		List<Material> results = new ArrayList<>();

        int cttEditor = em().createQuery("SELECT user.user_id FROM User user WHERE lower(concat(user.name, ' ||', user.surname)) LIKE :editor").setParameter("editor", contentEditor).getFirstResult();


        String queryString = "SELECT material FROM Material material WHERE (lower(material.title) LIKE :word OR lower(material.description) LIKE :keyword)";

		if(typeB){
		    queryString += " AND material.type = :materialType";
		}
		if (dateB) {
            queryString += " AND to_date(material.upload_date, 'DD.MM.YYYY') = :upload_date";
		}
		if (contentEditorB) {
            queryString += " AND material.content_editor_id = :editorId";
		}
        Query query;
        query = em().createQuery(queryString);
        while (st.hasMoreElements()) {
			String word = st.nextToken();
            query.setParameter("word", "%" + word + "%").setParameter("keyword", "%" + word + "%");
            if(typeB){
                query.setParameter("materialType", type);
            }
            if (dateB) {
                query.setParameter("upload_date", date);
            }
            if (contentEditorB) {
                query.setParameter("editorId", cttEditor);
            }
			results.addAll(query.getResultList());
		}
		return results;
	}
}
