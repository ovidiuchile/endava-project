package com.endava.learning.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.endava.learning.dao.TopicDAO;
import com.endava.learning.model.Topic;

@Service
public class TopicService {
	@Autowired
	TopicDAO topicDAO;
	
	@SuppressWarnings("unchecked")
	@Transactional
	public void saveTopic(final Topic topic){
		topicDAO.save(topic);
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public void updateTopic(final Topic topic){
		topicDAO.update(topic);
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public void removeTopic(final Topic topic){
		topicDAO.remove(topic);
	}

	@Transactional
	public void deleteTopic(final Long topic_id){
		topicDAO.delete(topic_id);
	}
	
	public ArrayList<Topic> getTopics(Long idTechnology) {
		return (ArrayList<Topic>) topicDAO.getAllTopicForTechnology(idTechnology);
	}
	
	public Topic getTopicByID(Long idTopic) {
		return (Topic)topicDAO.findById(idTopic);
	}

	public Topic getTopicByName(String topicName) {
		return topicDAO.getTopicByName(topicName);
	}
}
