package com.endava.learning.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.endava.learning.model.Material;

@SuppressWarnings("rawtypes")
@Repository
public class MaterialDAO extends AbstractDAO<Material> {
	
	@SuppressWarnings("unchecked")
	protected MaterialDAO() {
		super(Material.class);
	}
	
	@SuppressWarnings("unchecked")
	public List<Material> getMaterialsByTechnologyAndTopic(Long technologyId, Long topic_id){
		return em().createQuery("SELECT material FROM Material material where material.topic.topic_id = :topic_id")
				.setParameter("topic_id", topic_id).getResultList();
	}
}
