package com.endava.learning.model;

import java.util.HashMap;
import java.util.Map;


public class Test {
	Map<Question, Answer> questions = new HashMap<>();

	public Map<Question, Answer> getQuestions() {
		return questions;
	}

	public void setQuestions(Map<Question, Answer> questions) {
		this.questions = questions;
	}
}
