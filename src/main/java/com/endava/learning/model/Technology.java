package com.endava.learning.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "technologies")
public class Technology {

	@Id
	@SequenceGenerator(name = "technologies_seq", sequenceName = "technologies_seq", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "technologies_seq")
	@Column(name = "technology_id", updatable = false)
	private Long id;

	@Column(name = "name")
	private String name;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "technology")
	private List<Topic> topics = new ArrayList<Topic>(1);

	public Long getTechnology_id() {
		return id;
	}

	public void setTechnology_id(Long technology_id) {
		this.id = technology_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}