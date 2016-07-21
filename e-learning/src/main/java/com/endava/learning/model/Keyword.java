package com.endava.learning.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "kewywords")
public class Keyword {
	@Id
	private Long keyword_id;
	
	@Column(name = "topic_id")
	private Long topic_id;
	
	@Column(name = "keyword")
	private String keyword;

	public Long getKeyword_id() {
		return keyword_id;
	}

	public void setKeyword_id(Long keyword_id) {
		this.keyword_id = keyword_id;
	}

	public Long getTopic_id() {
		return topic_id;
	}

	public void setTopic_id(Long topic_id) {
		this.topic_id = topic_id;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
}
