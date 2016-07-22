package com.endava.learning.dao;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.endava.learning.model.Topic;

@SuppressWarnings("rawtypes")
@Repository
@Transactional
public class TopicDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	protected TopicDAO() {
		super(Topic.class);
	}

}