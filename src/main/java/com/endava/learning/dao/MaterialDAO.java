package com.endava.learning.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.endava.learning.model.Material;

@Repository
public class MaterialDAO extends AbstractDAO<Material> {
	
	protected MaterialDAO() {
		super(Material.class);
	}
	
	@SuppressWarnings("unchecked")
	public List<Material> getMaterialsByTechnologyAndTopic(Long technologyId, Long topic_id){
		return (List<Material>) em().createQuery("SELECT material FROM Material material where material.topic.id = :id")
				.setParameter("id", topic_id).getResultList();
	}
}
