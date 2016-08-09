package com.endava.learning.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.endava.learning.dao.DownloadPermissionsDAO;
import com.endava.learning.model.DownloadPermisions;

@Service
public class DownloadPermissionsService {
	
	@Autowired
	DownloadPermissionsDAO downloadPermissionsDAO;
	
	@Transactional
	public ArrayList<DownloadPermisions> getPermissions() {
		return (ArrayList<DownloadPermisions>) downloadPermissionsDAO.getAllPermissions();
	}
	
	@Transactional
	public ArrayList<DownloadPermisions> getPermissions(Long user_id, Long material_id) {
		return (ArrayList<DownloadPermisions>) downloadPermissionsDAO.getPermissions(user_id,material_id);
	}
	
	@Transactional
	public void savePermission(final DownloadPermisions downloadPermisions){
		downloadPermissionsDAO.save(downloadPermisions);
	}
	
	@Transactional
	public void updatePermission(final DownloadPermisions downloadPermisions){
		downloadPermissionsDAO.update(downloadPermisions);
	}
	
	public DownloadPermisions getPermissionsByID(Long idPermission) {
		return (DownloadPermisions)downloadPermissionsDAO.findById(idPermission);
	}
}
