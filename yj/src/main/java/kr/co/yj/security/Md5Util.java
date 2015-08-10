package kr.co.yj.security;

import org.springframework.util.DigestUtils;

public class Md5Util {
	
	public static String md5Text(String password){
		
		String pwd=password+"{yogijogi}";
		
		String md5Text = DigestUtils.md5DigestAsHex(pwd.getBytes());
		
		
		return md5Text;
	}

}
