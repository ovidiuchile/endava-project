package com.endava.learning.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.endava.learning.dao.TechnologyDAO;
import com.endava.learning.model.Technology;

@Service
public class TechnologyService {
	@Autowired
	TechnologyDAO technologyDAO;
	
	@SuppressWarnings("unchecked")
	@Transactional
	public void saveTechnology(final Technology technology){
		technologyDAO.save(technology);
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public void updateTechnology(final Technology technology){
		technologyDAO.update(technology);
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public void removeTechnology(final Technology technology){
		technologyDAO.remove(technology);
	}

	@Transactional
	public void deleteTechnology(final Long technology_id){
		technologyDAO.delete(technology_id);
	}
	
	public ArrayList<Technology> getTechnologies() {
		return (ArrayList<Technology>) technologyDAO.getAllTechnologies();
	}
	
	public Technology getTechnologiesByID(Long idTechnology) {
		return (Technology)technologyDAO.findById(idTechnology);
	}

	public void deleteTechnologyByName(String technologyName) {
		technologyDAO.deleteByName(technologyName);
	}
}
