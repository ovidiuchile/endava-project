package com.endava.learning.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileUploadException;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.endava.learning.model.Material;
import com.endava.learning.service.FileUploadService;

@Controller
public class FileUploadController {
	private static final Logger LOGGER = Logger.getLogger(FileUploadController.class);

	@Autowired
	private FileUploadService fileUploadService;

	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public String getUploadPage() {
		return "upload";
	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	@ResponseBody
	public void uploadFile(@RequestParam("technology") Long technology_id, @RequestParam("topic") Long topic_id,
			@RequestParam("material") String materialName, @RequestParam("description") String materialDescription,
			@RequestParam("file") MultipartFile file) {

		try {
			Long fileId = fileUploadService.uploadFile(topic_id, materialName, materialDescription, file);
		} catch (IOException | FileUploadException exception) {
			LOGGER.log(org.apache.log4j.Level.ERROR, "Upload has failed", exception);
		}
	}
}