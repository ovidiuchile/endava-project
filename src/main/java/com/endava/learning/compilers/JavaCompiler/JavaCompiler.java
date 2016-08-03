package com.endava.learning.compilers.JavaCompiler;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.lang.reflect.Method;

public class JavaCompiler {
	private final static MemoryJavaCompiler compiler = new MemoryJavaCompiler();

	public static String compile(final String source){
		System.setProperty("java.home", "C:\\Program Files\\Java\\jdk1.8.0_101");
		String finalResult = new String();
		try {
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			PrintStream ps = new PrintStream(baos);
			PrintStream old = System.out;
			System.setOut(ps);
			System.out.flush();
			final Method greeting = compiler.compileStaticMethod("main", "Main", source);
			greeting.invoke(null);
			finalResult = baos.toString();
			System.setOut(old);
		} catch (Exception e) {
		}
		return finalResult;
	}
}
