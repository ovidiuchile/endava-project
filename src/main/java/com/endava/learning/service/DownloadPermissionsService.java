package com.endava.learning.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.endava.learning.dao.DownloadPermissionsDAO;
import com.endava.learning.model.DownloadPermissions;

@Service
public class DownloadPermissionsService {
	
	@Autowired
	DownloadPermissionsDAO downloadPermissionsDAO;
	
	@Transactional
	public ArrayList<DownloadPermissions> getPermissions() {
		return (ArrayList<DownloadPermissions>) downloadPermissionsDAO.getAllPermissions();
	}
	
	@Transactional
	public ArrayList<DownloadPermissions> getPermissions(Long user_id, Long material_id) {
		return (ArrayList<DownloadPermissions>) downloadPermissionsDAO.getPermissions(user_id,material_id);
	}
	
	@Transactional
	public void savePermission(final DownloadPermissions downloadPermisions){
		downloadPermissionsDAO.save(downloadPermisions);
	}
	
	@Transactional
	public void updatePermission(final DownloadPermissions downloadPermisions){
		downloadPermissionsDAO.update(downloadPermisions);
	}
	
	public DownloadPermissions getPermissionsByID(Long idPermission) {
		return (DownloadPermissions)downloadPermissionsDAO.findById(idPermission);
	}
	
	@Transactional
	public List<DownloadPermissions> getRequests(){
		return downloadPermissionsDAO.getRequests();
	}
}
