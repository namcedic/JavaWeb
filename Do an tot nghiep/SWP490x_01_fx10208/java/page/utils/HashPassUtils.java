package page.utils;

import org.apache.commons.codec.digest.DigestUtils;

public class HashPassUtils {

	public static String hashMd5(String password) {
		return DigestUtils.md5Hex(password);
	}
}