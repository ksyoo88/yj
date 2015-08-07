package kr.co.yj.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.co.yj.vo.MemberVO;

public interface MemberService {

	void addMember(MemberVO mem);
	void sendemail(/*String subject,String text,String from,*/String to);
	
	boolean checkEmail(String email);
	
	MemberVO loginCheck(String email,String pwd);
	
	String modifyinfo(String name,String pwd,String email);
	
	String profileup(MultipartFile mf,String email) throws Exception;
	MemberVO getMembyEmail(String email);
	
	void saveTempPhoto(MultipartFile mf,String email,String day) throws Exception;
	
	ArrayList<String> getTemPhoto(String email);
	void delTemPhoto(String email);
}
