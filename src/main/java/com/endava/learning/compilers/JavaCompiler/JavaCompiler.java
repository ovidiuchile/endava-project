package com.endava.learning.compilers.JavaCompiler;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import org.apache.commons.lang.RandomStringUtils;

public class JavaCompiler {

	private static String getLines(InputStream ins) throws Exception {
		String result = "";
		String line = null;
		BufferedReader in = new BufferedReader(new InputStreamReader(ins));
		while ((line = in.readLine()) != null) {
			result += line + "\n";
		}
		return result;
	}

	private static String runProcess(String command) throws Exception {
		String result = "";
		Process pro = Runtime.getRuntime().exec(command);
		String stream = getLines(pro.getInputStream());
		if (stream != null)
			result += stream;
		stream = getLines(pro.getErrorStream());
		if (stream != null)
			result += stream;
		pro.waitFor();
		return result;
	}

	private static void deleteFiles() {
		try {
			File folder = new File(System.getProperty("catalina.home") + "/webapps/compiler_directory");
			for (final File fileEntry : folder.listFiles()) {
				if (fileEntry.exists()
						&& (fileEntry.getName().contains(".class") || fileEntry.getName().contains(".java"))) {
					fileEntry.delete();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static String compile(String source) {
		if (source.contains("File") || source.contains("Thread") || source.contains("RandomAccessFile")
				|| source.contains("Propert") || source.contains("Process") || source.contains("ScriptEngine")
				|| source.contains("RunTime")) {
			return "You can't use one of the following statements: File, Thread, RandomAccessFile, Property/ies, Process, ScriptEngine, RunTime";
		}

		String result = "";
		PrintWriter writer;
		String javaFileName = RandomStringUtils.randomAlphanumeric(8) + ".java";
		File folder = new File(System.getProperty("catalina.home") + "/webapps/compiler_directory");
		try {
			if (!folder.exists()) {
				folder.mkdir();
			}
			File javaFile = new File(folder.getAbsolutePath() + "/" + javaFileName);
			if (!javaFile.exists()) {
				try {
					javaFile.createNewFile();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			writer = new PrintWriter(javaFile, "UTF-8");
			writer.println(source);
			writer.close();
		} catch (UnsupportedEncodingException | FileNotFoundException e1) {
			e1.printStackTrace();
		}

		try {
			result += runProcess("javac " + folder.getAbsolutePath() + "/" + javaFileName);
			result += runProcess("java -cp " + folder.getAbsolutePath() + " Main");
		} catch (Exception e) {
			result += e.getMessage();
		}
		deleteFiles();
		return result;
	}
}