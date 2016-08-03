package com.endava.learning.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.endava.learning.compilers.JavaCompiler.JavaCompiler;

@RestController
@RequestMapping(value = "/compiler")
public class CompilerControler {
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView handleRequestGET(HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		model.setViewName("compiler");
		return model;
	}

	@RequestMapping(value = "/{technology}", method = RequestMethod.POST)
	public ModelAndView forgotPassword(HttpServletRequest request, @PathVariable("technology") String technology) {
		String result = new String();
		String source = request.getParameter("source");
		if (technology.equalsIgnoreCase("java"))
			result = JavaCompiler.compile(source);
		else if (technology.equalsIgnoreCase("js"))
			result = JavaCompiler.compile(source);
		else
			result = "wrong technology";
		request.setAttribute("result", result);

		ModelAndView model = new ModelAndView();
		model.setViewName("compiler");
		return model;
	}
}
