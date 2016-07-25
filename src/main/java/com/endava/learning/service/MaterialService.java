package com.endava.learning.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.endava.learning.dao.MaterialDAO;
import com.endava.learning.model.Material;

@Service
public class MaterialService {

	@Autowired
	private MaterialDAO materialDAO;
	
	public List<Material> getMaterialsByTechnologyAndTopic(Long technologyId, Long topicId){
		return materialDAO.getMaterialsByTechnologyAndTopic(technologyId, topicId);
	}

	public Material getMaterialById(Long material_id) {
		return materialDAO.findById(material_id);
	}

	public Material createMaterial(Material material) {
		materialDAO.save(material);
		return material;
	}
}
