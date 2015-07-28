package kr.co.yj.service;

import kr.co.yj.vo.MemberVO;

public interface MemberService {

	void addMember(MemberVO mem);
	void sendemail(/*String subject,String text,String from,*/String to);
	
	boolean checkEmail(String email);
	
	MemberVO loginCheck(String email,String pwd);
}
