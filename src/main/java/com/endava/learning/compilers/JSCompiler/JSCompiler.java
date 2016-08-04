package com.endava.learning.compilers.JSCompiler;

import java.io.StringWriter;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

public class JSCompiler {
	public static String compile(String source) {
		ScriptEngineManager manager = new ScriptEngineManager();
		ScriptEngine engine = manager.getEngineByName("js");
		String finalResult = new String();
		try {
			StringWriter sw = new StringWriter();
			engine.getContext().setWriter(sw);
			engine.eval(source);
			finalResult = sw.toString();
		} catch (ScriptException e) {
			finalResult = e.getMessage();
		} catch (NullPointerException e) {
		}
		return finalResult;
	}
}
