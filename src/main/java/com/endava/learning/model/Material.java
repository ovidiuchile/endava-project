package com.endava.learning.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "materials")
public class Material {
	@Id
	private Long material_id;
	
	@Column(name = "topic_id")
	private Long topic_id;
	
	@Column(name = "link")
	private String link;

	public Long getMaterial_id() {
		return material_id;
	}

	public void setMaterial_id(Long material_id) {
		this.material_id = material_id;
	}

	public Long getTopic_id() {
		return topic_id;
	}

	public void setTopic_id(Long topic_id) {
		this.topic_id = topic_id;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

}