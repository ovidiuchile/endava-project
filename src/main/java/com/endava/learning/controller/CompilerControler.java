package com.endava.learning.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.endava.learning.compilers.JSCompiler.JSCompiler;
import com.endava.learning.compilers.JavaCompiler.JavaCompiler;

@RestController
@RequestMapping(value = "/", produces = MediaType.APPLICATION_JSON_VALUE)
public class CompilerControler {
	@RequestMapping(value = "compiler", method = RequestMethod.GET)
	public ModelAndView compilerGET(HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		model.setViewName("compiler");
		return model;
	}

	@RequestMapping(value = "compiler", method = RequestMethod.POST)
	public ModelAndView compilerPOST(HttpServletRequest request) {
		String result = new String();
		String source = request.getParameter("source");
		String technology = request.getParameter("technology");
		
		if (technology.equalsIgnoreCase("java"))
			result = JavaCompiler.compile(source);
		else if (technology.equalsIgnoreCase("js"))
			result = JSCompiler.compile(source);
		else
			result = "wrong technology";
		request.setAttribute("result", result);
		request.setAttribute("source", source);
		
		
		
		ModelAndView model = new ModelAndView();
		model.setViewName("compiler");
		return model;
	}
}
