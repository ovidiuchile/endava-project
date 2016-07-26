package com.endava.learning.utils;

import java.security.MessageDigest;

import org.springframework.stereotype.Service;

@Service
public class CryptPassword {

	public static String encodeMD5(String password) {
		String encoding = "";
		try {
			MessageDigest m = MessageDigest.getInstance("MD5");
			m.update((password.getBytes("UTF8")));
			byte s[] = m.digest();
			for (int i = 0; i < s.length; i++) {
				encoding += Integer.toHexString((0x000000ff & s[i]) | 0xffffff00).substring(6);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return encoding.substring(0, 20);
	}

	public static boolean matches(String arg0, String arg1) {

		return (encodeMD5(arg0).equals(arg1)) ? true : false;
	}
}
