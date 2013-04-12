package demo;

import java.io.IOException;
import java.security.MessageDigest;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Helpers {

	/**
	 * Provides a handy helper for a common statement.
	 */
	public static void go (String dest, HttpServletRequest req, HttpServletResponse rsp) throws ServletException, IOException {
		req.getRequestDispatcher(dest).forward(req, rsp);
	}
	
	/**
	 * Does a SHA-256 hash
	 */
	public static String hash (String s) {
		String hex = "0123456789abcdef";
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(s.getBytes("UTF-8"));
			byte[] digest = md.digest();
			String result = "";
			for (byte b: digest) {
				int i1 = (int) ((b >> 4) & 0xf);
				int i2 = (int) (b & 0xf);
				result = result + hex.charAt(i1) + hex.charAt(i2);
			}
			return result;
		}
		catch (Exception e) {
			return "";
		}

	}
}
