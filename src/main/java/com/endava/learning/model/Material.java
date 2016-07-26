package com.endava.learning.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "materials")
public class Material {
	@Id
	@SequenceGenerator(name="material_sequence",sequenceName="material_id_seq", allocationSize=1)
	@GeneratedValue(strategy=GenerationType.IDENTITY,generator="material_sequence")
	@Column(name="material_id", unique=true, nullable=false)
	private Long material_id;
	
	@Column(name = "link")
	private String link;

	@Column(name = "type")
	private int type;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "upload_date")
	private Date upload_date;
	
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

	public Date getUpload_date() {
		return upload_date;
	}

	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
	}

	public User getContent_editor() {
		return content_editor;
	}

	public void setContent_editor(User content_editor) {
		this.content_editor = content_editor;
	}
}