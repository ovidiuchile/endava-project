package com.endava.learning.compilers.JSCompiler;
import javax.script.Bindings;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

public class JSCompiler {
	public static String compile(String source) {
		ScriptEngineManager manager = new ScriptEngineManager();
		ScriptEngine engine = manager.getEngineByName("js");
		Bindings bindings = engine.createBindings();
		String finalResult = new String();
		try {
			Object result = engine.eval(source, bindings);
			finalResult = result.toString();
		} catch (ScriptException e) {
			finalResult = e.getMessage();
		}catch(NullPointerException e){}
		return finalResult;
	}
}
