package com.endava.learning.dao;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.endava.learning.model.Topic;

@Repository
@Transactional
public class TopicDAO extends AbstractDAO{
	
	protected TopicDAO() {
		super(Topic.class);
	}

}
