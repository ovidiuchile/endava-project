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
			File folder = new File("compiler_directory");
			for (final File fileEntry : folder.listFiles()) {
				String tempFile = fileEntry.getAbsolutePath();
				// Delete if tempFile exists
				File fileTemp = new File(tempFile);
				if (fileTemp.exists()
						&& (fileTemp.getName().contains(".class") || fileTemp.getName().contains(".java"))) {
					fileTemp.delete();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static String compile(String source) {
		String result = "";
		PrintWriter writer;
		String javaFileName = RandomStringUtils.randomAlphanumeric(8)+".java";
		File folder = new File("compiler_directory");
		try {
			if (!folder.exists()) {
				folder.mkdir();
			}
			File javaFile = new File(folder.getAbsolutePath()+ "/" + javaFileName);
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
			result += runProcess("javac "+folder.getAbsolutePath()+ "/"+ javaFileName);
			result += runProcess("java -cp "+folder.getAbsolutePath()+" Main");
		} catch (Exception e) {
			e.printStackTrace();
		}
		//deleteFiles();
		return result;
	}
}