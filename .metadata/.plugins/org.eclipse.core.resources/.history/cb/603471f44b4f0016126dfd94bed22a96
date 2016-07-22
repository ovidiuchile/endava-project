package com.endava.learning.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.endava.learning.dao.SimpleDao;

@Controller
public class HomeController {

	@Autowired
	private SimpleDao simpleDao;
	
	@RequestMapping("/")
	public String home(){
		simpleDao.bla();
		return "home";
	}
}
