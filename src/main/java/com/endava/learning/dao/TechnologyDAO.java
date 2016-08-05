package com.endava.learning.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.endava.learning.model.Technology;

@SuppressWarnings("rawtypes")
@Repository
@Transactional
public class TechnologyDAO extends AbstractDAO {
	@SuppressWarnings("unchecked")
	protected TechnologyDAO() {
		super(Technology.class);
	}
	
	@Transactional
	@SuppressWarnings("unchecked")
	public List<Technology> getAllTechnologies() {
		return em()
				.createQuery(
						"SELECT t FROM Technology t")
				.getResultList();
	}
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Technology> getTechnologyByName(String technologyName){
		return em().createQuery("SELECT t FROM Technology t WHERE t.name LIKE :technologyName")
				.setParameter("technologyName", technologyName).getResultList();
	}

	@Transactional
	public void deleteByName(String technologyName) {
		List<Technology> technologies = this.getTechnologyByName(technologyName);
		for(Technology technology : technologies){
			em().remove(findById(technology.getTechnology_id()));
		}
	}
}
