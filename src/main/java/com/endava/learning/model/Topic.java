package com.endava.learning.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "topics")
public class Topic {
	@Id
	private Long topic_id;

	@Column(name = "technology_id")
	private Long technology_id;
	
	@Column(name = "name")
	private String name;

	public Long getTopic_id() {
		return topic_id;
	}

	public void setTopic_id(Long topic_id) {
		this.topic_id = topic_id;
	}

	public Long getTechnology_id() {
		return technology_id;
	}

	public void setTechnology_id(Long technology_id) {
		this.technology_id = technology_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}