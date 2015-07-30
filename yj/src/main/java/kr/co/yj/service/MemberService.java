package kr.co.yj.service;

import org.springframework.web.multipart.MultipartFile;

import kr.co.yj.vo.MemberVO;

public interface MemberService {

	void addMember(MemberVO mem);
	void sendemail(/*String subject,String text,String from,*/String to);
	
	boolean checkEmail(String email);
	
	MemberVO loginCheck(String email,String pwd);
	
	void modifyinfo(String name,String pwd,String email);
	
	void profileup(MultipartFile mf,String email) throws Exception;
	MemberVO getMembyEmail(String email);
}
