package com.endava.learning.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.endava.learning.model.Topic;

@SuppressWarnings("rawtypes")
@Repository
@Transactional
public class TopicDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	protected TopicDAO() {
		super(Topic.class);
	}
	
	@Transactional
	@SuppressWarnings("unchecked")
	public List<Topic> getAllTopicForTechnology(Long idTechnology) {
		return em()
				.createQuery(
						"SELECT t FROM Topic t where t.technology.id = :idTechnology")
				.setParameter("idTechnology", idTechnology)
				.getResultList();
	}

}