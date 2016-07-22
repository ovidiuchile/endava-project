package com.endava.learning.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="technologies")
public class Technology {
	@Id
	private Long technology_id;
	
	@Column(name = "name")
	private String name;

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
