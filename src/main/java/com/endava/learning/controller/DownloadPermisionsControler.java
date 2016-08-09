package com.endava.learning.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Resource;
import org.springframework.hateoas.Resources;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.endava.learning.model.DownloadPermisions;
import com.endava.learning.service.DownloadPermissionsService;
import com.endava.learning.service.MaterialService;
import com.endava.learning.service.UserService;

@RestController
@RequestMapping(value = "/", produces = MediaType.APPLICATION_JSON_VALUE)
public class DownloadPermisionsControler {

	@Autowired
	DownloadPermissionsService downloadPermissionsService;

	@Autowired
	MaterialService materialService;

	@Autowired
	UserService userService;

	@RequestMapping(value = "downloadPermissions", method = RequestMethod.GET)
	public HttpEntity<Resources<Resource<DownloadPermisions>>> getPermissions() {

		Resources<Resource<DownloadPermisions>> downloadsResources = Resources
				.wrap(downloadPermissionsService.getPermissions());

		return new ResponseEntity<>(downloadsResources, HttpStatus.OK);
	}

	@RequestMapping(value = "downloadPermissionsUM", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public HttpEntity<Resources<Resource<DownloadPermisions>>> getPermisions(
			@RequestParam(value = "user_id", required = true) Long user_id,
			@RequestParam(value = "material_id", required = true) Long material_id) {

		Resources<Resource<DownloadPermisions>> downloadsResources = Resources
				.wrap(downloadPermissionsService.getPermissions(user_id, material_id));

		return new ResponseEntity<>(downloadsResources, HttpStatus.OK);
	}

	@RequestMapping(value = "downloadPermissionsUM", method = RequestMethod.POST)
	public HttpEntity<Resource<DownloadPermisions>> addPermissions(
			@RequestParam(value = "user_id", required = true) Long user_id,
			@RequestParam(value = "material_id", required = true) Long material_id) {
			
		Resource<DownloadPermisions> permissionResource;
		
		if (downloadPermissionsService.getPermissions(user_id, material_id).isEmpty()) {
			DownloadPermisions downloadPermisions = new DownloadPermisions();
			downloadPermisions.setPermission_id(((long) (Math.random() * 1000000000)));
			downloadPermisions.setMaterial(materialService.getMaterialById(material_id));
			downloadPermisions.setUser(userService.getUserById(user_id));
			downloadPermisions.setPermission(false);
			downloadPermissionsService.savePermission(downloadPermisions);
			permissionResource = new Resource<>(downloadPermisions);
		}else{
			permissionResource = new Resource<>(downloadPermissionsService.getPermissions(user_id, material_id).get(0));
		}

		return new ResponseEntity<>(permissionResource, HttpStatus.CREATED);
	}

	@RequestMapping(value = "downloadPermissionsUM/{permission_id}", method = RequestMethod.PUT)
	public HttpEntity<Resource<DownloadPermisions>> updatePermissions(
			@RequestBody DownloadPermisions downloadPermisions, @PathVariable("permission_id") Long permission_id) {

		DownloadPermisions finalDownloadPermisions = downloadPermissionsService.getPermissionsByID(permission_id);
		if (downloadPermisions.getPermission() != null)
			finalDownloadPermisions.setPermission(downloadPermisions.getPermission());

		downloadPermissionsService.updatePermission(finalDownloadPermisions);

		Resource<DownloadPermisions> permissionsResouce = new Resource<>(finalDownloadPermisions);

		return new ResponseEntity<>(permissionsResouce, HttpStatus.CREATED);
	}
}
