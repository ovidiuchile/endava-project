package com.endava.learning.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class Test {
	Map<Question, List<Answer>> questions = new HashMap<>();

	public Map<Question, List<Answer>> getQuestions() {
		return questions;
	}

	public void setQuestions(Map<Question, List<Answer>> questions) {
		this.questions = questions;
	}
}
