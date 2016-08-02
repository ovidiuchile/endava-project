package com.endava.learning.controller;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;

import com.endava.learning.model.Material;
import com.endava.learning.service.MaterialService;
import com.endava.learning.service.TopicService;

/**
 * Servlet implementation class UploadServlet
 */
public class UploadServlet extends HttpServlet {
	@Autowired 
	private MaterialService materialService;
	
	@Autowired
	private TopicService topicService;
	
	public void init() {
		getServletContext().getInitParameter("file-upload");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		boolean isMultipart = ServletFileUpload.isMultipartContent(request);

		if (isMultipart) {
			// Create a factory for disk-based file items
			FileItemFactory factory = new DiskFileItemFactory();

			// Create a new file upload handler
			ServletFileUpload upload = new ServletFileUpload(factory);

			try {
				// Parse the request
				List items = upload.parseRequest(request);
				Iterator iterator = items.iterator();
				while (iterator.hasNext()) {
					FileItem item = (FileItem) iterator.next();
					if (!item.isFormField()) {
						String fileName = item.getName();
						String root = getServletContext().getRealPath("/");
						File path = new File(root + "/uploads");
						if (!path.exists()) {
							boolean status = path.mkdirs();
						}

						File uploadedFile = new File(path + "/" + fileName);
						System.out.println(uploadedFile.getAbsolutePath());
						item.write(uploadedFile);
						
						Material material = new Material();
						String topicName = request.getParameter("select_topic");
						String materialName = request.getParameter("material");
						
						material.setTitle("material");
						System.out.println(topicName);
						material.setTopic(topicService.getTopicByID(Long.parseLong(topicName)));
						material.setType(0);
						material.setMaterial_id(((long) (Math.random() * 1000000000)));
						material.setLink(uploadedFile.getAbsolutePath());
						
						material.setUpload_date(Calendar.getInstance().getTime().toString());
						
						
						Material createdMaterial = materialService.createMaterial(material);
					}
					
				}
			} catch (FileUploadException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}