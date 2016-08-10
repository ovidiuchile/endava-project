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
		String defaultJava="class Main{\n\tpublic static void main(String[] args){\n\t\t\n\t}\n}";
		ModelAndView model = new ModelAndView();
		request.setAttribute("source1", defaultJava);
		model.setViewName("compiler");
		return model;
	}

	@RequestMapping(value = "compiler", method = RequestMethod.POST)
	public ModelAndView compilerPOST(HttpServletRequest request) {
		String result = new String();
		String source1 = request.getParameter("source1");
		String source2 = request.getParameter("source2");
		String technology = request.getParameter("technology");
		
		if (technology.equalsIgnoreCase("java")){
			result = JavaCompiler.compile(source1);
			request.setAttribute("selected_div", "$('#text-area-compiler-2').hide();$('#text-area-compiler-1').show();");
		}else if (technology.equalsIgnoreCase("js")){
			result = JSCompiler.compile(source2);
			request.setAttribute("selected_div", "$('#text-area-compiler-1').hide();$('#text-area-compiler-2').show();");
		}else
			result = "wrong technology";
		
		request.setAttribute("result", result);
		request.setAttribute("source1", source1);
		request.setAttribute("source2", source2);
		request.setAttribute("option", technology);
		
		ModelAndView model = new ModelAndView();
		model.setViewName("compiler");
		return model;
	}
}
