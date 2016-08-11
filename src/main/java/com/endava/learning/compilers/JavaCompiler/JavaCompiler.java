package com.endava.learning.compilers.JavaCompiler;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;

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
	
	private static void addTimerClass(File sourceFile) {
		PrintWriter writer = null;
		String timerClass="class TimedExit {Timer timer = new Timer();TimerTask exitApp = new TimerTask() {public void run() {System.exit(123);}};public TimedExit() {timer.schedule(exitApp, new Date(System.currentTimeMillis() + 2 * 1000));}}";
		String imports="import java.util.Date;import java.util.Timer;import java.util.TimerTask;";
		try {
			writer = new PrintWriter(new FileOutputStream(sourceFile), true);
			writer.println(imports);
			writer.println(timerClass);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} finally{
			writer.close();
		}
			
	}

	public static String compile(String source) {
		if (source.contains("File") || source.contains("Thread") || source.contains("RandomAccessFile")
				|| source.contains("Propert") || source.contains("Process") || source.contains("ScriptEngine")
				|| source.contains("RunTime")) {
			return "You can't use one of the following statements: File, Thread, RandomAccessFile, Property/ies, Process, ScriptEngine, RunTime";
		}

		String result = "";
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
			addTimerClass(javaFile);
			String finalSource;

			if(source.indexOf("Main{")>-1)
				finalSource=source.substring(0,source.indexOf("Main{")+5)+"static{TimedExit t = new TimedExit();}"+source.substring(source.indexOf("Main{")+5);
			else if(source.indexOf("Main {")>-1)
				finalSource=source.substring(0,source.indexOf("Main {")+6)+"static{TimedExit t = new TimedExit();}"+source.substring(source.indexOf("Main {")+6);
			else finalSource = source;
			try {
			    Files.write(Paths.get(javaFile.getAbsolutePath()), finalSource.getBytes(), StandardOpenOption.APPEND);
			}catch (IOException e) {
				e.printStackTrace();
			}
		} catch (Exception e1) {
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