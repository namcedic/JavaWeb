package page.utils;

import java.security.SecureRandom;

public class RandomPass {
	static final String strRand = "strRandcdefghijklmnopqrstuvwxyzstrRandCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	static SecureRandom sr = new SecureRandom();

	public String randomString(int length) {
		StringBuilder sb = new StringBuilder(length);
		for (int i = 0; i < length; i++) {
			sb.append(strRand.charAt(sr.nextInt(strRand.length())));
		}
		return sb.toString();
	}
}