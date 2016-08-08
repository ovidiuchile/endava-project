package com.endava.learning.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.endava.learning.model.DownloadPermisions;

@Repository
public class DownloadPermissionsDAO extends AbstractDAO<DownloadPermisions> {
	protected DownloadPermissionsDAO() {
		super(DownloadPermisions.class);
	}
	
	@Transactional
	@SuppressWarnings("unchecked")
	public List<DownloadPermisions> getAllPermissions() {
		return em()
				.createQuery(
						"SELECT d FROM DownloadPermisions d")
				.getResultList();
	}
	
	@Transactional
	@SuppressWarnings("unchecked")
	public List<DownloadPermisions> getPermissions(Long user_id, Long material_id) {
		return em()
				.createQuery(
						"SELECT d FROM DownloadPermisions d WHERE d.user.user_id = :user_id AND d.material.material_id = :material_id")
				.setParameter("user_id", user_id)
				.setParameter("material_id", material_id)
				.getResultList();
	}

	
}
