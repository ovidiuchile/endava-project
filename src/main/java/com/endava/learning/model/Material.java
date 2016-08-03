package com.endava.learning.model;

import java.io.File;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "materials")
public class Material {
	
	public static final String LOCATION = System.getProperty("catalina.home") + File.separator + "uploads";
	
	@Id
	@Column(name="material_id", unique=true, nullable=false)
	private Long material_id;

	@Column(name = "link")
	private String link;

	@Column(name = "type")
	private int type;

	@Column(name = "title")
	private String title;

	@Column(name = "description")
	private String description;

	@Column(name = "upload_date")
	private String upload_date;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@ManyToOne
	@JoinColumn(name = "topic_id")
	private Topic topic;

	public Topic getTopic() {
		return topic;
	}

	public void setTopic(Topic topic) {
		this.topic = topic;
	}

	public Long getMaterial_id() {
		return material_id;
	}

	public void setMaterial_id(Long material_id) {
		this.material_id = material_id;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	@OneToOne
	@JoinColumn(name = "content_editor_id")
	private User content_editor;

	public String getUpload_date() {
		return upload_date;
	}

	public void setUpload_date(String date) {
		this.upload_date = date;
	}

	public User getContent_editor() {
		return content_editor;
	}

	public void setContent_editor(User content_editor) {
		this.content_editor = content_editor;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
}