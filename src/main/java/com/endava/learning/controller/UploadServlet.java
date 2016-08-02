package com.endava.learning.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.endava.learning.model.Material;
import com.endava.learning.service.MaterialService;
import com.endava.learning.service.TopicService;

@SuppressWarnings("serial")
@MultipartConfig
@Controller
@RequestMapping(value = "/", produces = MediaType.APPLICATION_JSON_VALUE)
public class UploadServlet extends HttpServlet {

	@Autowired
	private MaterialService materialService;

	@Autowired
	private TopicService topicService;

	private String filePath;

	@RequestMapping(value = "upload", method = RequestMethod.GET)
	public ModelAndView handleGet() {
		ModelAndView model = new ModelAndView();
		model.setViewName("upload");
		return model;
	}

	@RequestMapping(value = "upload-material", method = RequestMethod.POST)
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Material material = new Material();
		material.setMaterial_id(((long) (Math.random() * 1000000000)));
		material.setUpload_date(Calendar.getInstance().get(Calendar.YEAR) + "-"
				+ Calendar.getInstance().get(Calendar.MONTH) + "-" + Calendar.getInstance().get(Calendar.DAY_OF_WEEK));
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);

		if (isMultipart) {
			// Create a factory for disk-based file items
			FileItemFactory factory = new DiskFileItemFactory();

			// Create a new file upload handler
			ServletFileUpload upload = new ServletFileUpload(factory);

			FileItemIterator iterator1;
			try {
				iterator1 = upload.getItemIterator(request);
				while (iterator1.hasNext()) {
					FileItemStream item = iterator1.next();
					InputStream stream = item.openStream();
					if (item.isFormField()) {

						if (item.getFieldName().equals("topic")) {
							byte[] str = new byte[stream.available()];
							stream.read(str);
							String topicId = new String(str, "UTF8");

							material.setTopic(topicService.getTopicByID(Long.parseLong(topicId)));

						}
						if (item.getFieldName().equals("material")) {
							byte[] str = new byte[stream.available()];
							stream.read(str);
							String materialName = new String(str, "UTF8");

							material.setTitle(materialName);
						}
					} else {
						if (item.getFieldName().equals("file")) {

							String root = request.getContextPath();
							File path = new File(root + "/uploads");

							if (!path.exists()) {
								boolean status = path.mkdirs();
							}
							File file2 = new File(path + "/" + item.getName());

							material.setLink(file2.getAbsolutePath());

							FileOutputStream fop = null;

							fop = new FileOutputStream(file2);
							if (!file2.exists()) {
								file2.createNewFile();
							}

							int content;
							while ((content = stream.read()) != -1) {
								fop.write(content);
								fop.flush();
							}
							fop.close();
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

				Material createdMaterial = materialService.createMaterial(material);
			} catch (FileUploadException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}