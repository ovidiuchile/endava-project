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
import org.springframework.web.servlet.ModelAndView;

import com.endava.learning.model.DownloadPermissions;
import com.endava.learning.service.DownloadPermissionsService;
import com.endava.learning.service.MaterialService;
import com.endava.learning.service.UserService;

@RestController
@RequestMapping(value = "/", produces = MediaType.APPLICATION_JSON_VALUE)
public class DownloadController {

	@Autowired
	DownloadPermissionsService downloadPermissionsService;

	@Autowired
	MaterialService materialService;

	@Autowired
	UserService userService;

	@RequestMapping(value = "downloadPermissions", method = RequestMethod.GET)
	public HttpEntity<Resources<Resource<DownloadPermissions>>> getPermissions() {

		Resources<Resource<DownloadPermissions>> downloadsResources = Resources
				.wrap(downloadPermissionsService.getPermissions());

		return new ResponseEntity<>(downloadsResources, HttpStatus.OK);
	}

	@RequestMapping(value = "downloadPermissionsUM", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public HttpEntity<Resources<Resource<DownloadPermissions>>> getPermisions(
			@RequestParam(value = "user_id", required = true) Long user_id,
			@RequestParam(value = "material_id", required = true) Long material_id) {

		Resources<Resource<DownloadPermissions>> downloadsResources = Resources
				.wrap(downloadPermissionsService.getPermissions(user_id, material_id));

		return new ResponseEntity<>(downloadsResources, HttpStatus.OK);
	}

	@RequestMapping(value = "downloadPermissionsUM", method = RequestMethod.POST)
	public HttpEntity<Resource<DownloadPermissions>> addPermissions(
			@RequestParam(value = "user_id", required = true) Long user_id,
			@RequestParam(value = "material_id", required = true) Long material_id) {
			
		Resource<DownloadPermissions> permissionResource;
		
		if (downloadPermissionsService.getPermissions(user_id, material_id).isEmpty()) {
			DownloadPermissions downloadPermisions = new DownloadPermissions();
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
	public HttpEntity<Resource<DownloadPermissions>> updatePermissions(
			@RequestBody DownloadPermissions downloadPermisions, @PathVariable("permission_id") Long permission_id) {

		DownloadPermissions finalDownloadPermisions = downloadPermissionsService.getPermissionsByID(permission_id);
		if (downloadPermisions.getPermission() != null)
			finalDownloadPermisions.setPermission(downloadPermisions.getPermission());

		downloadPermissionsService.updatePermission(finalDownloadPermisions);

		Resource<DownloadPermissions> permissionsResource = new Resource<>(finalDownloadPermisions);

		return new ResponseEntity<>(permissionsResource, HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "requests", method = RequestMethod.GET)
	public ModelAndView getRequestsPage(){
		ModelAndView model = new ModelAndView();
		model.setViewName("download_requests");
		return model;
	}
	
	@RequestMapping(value = "requests", method = RequestMethod.GET)
	public HttpEntity<Resources<Resource<DownloadPermissions>>> getRequests() {

		Resources<Resource<DownloadPermissions>> downloadsResources = Resources
				.wrap(downloadPermissionsService.getRequests());

		return new ResponseEntity<>(downloadsResources, HttpStatus.OK);
	}
}
