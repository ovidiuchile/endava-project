package com.endava.learning.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "topics")
public class Topic {
	@Id
	@Column(name = "topic_id", updatable = false)
	private Long id;

	@Column(name = "name")
	private String name;

	@ManyToOne
	@JoinColumn(name = "technology_id")
	private Technology technology;

	public Long getTopic_id() {
		return id;
	}

	public void setTopic_id(Long topic_id) {
		this.id = topic_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Technology getTechnology() {
		return technology;
	}

	public void setTechnology(Technology technology) {
		this.technology = technology;
	}

}