package kr.co.yj.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.co.yj.security.MemberDetail;

public interface MemberService {

	void addMember(MemberDetail mem);
	void sendemail(/*String subject,String text,String from,*/String to);
	
	boolean checkEmail(String email);
	
	MemberDetail loginCheck(String email,String pwd);
	
	String modifyinfo(String name,String pwd,String email);
	
	String profileup(MultipartFile mf,String email) throws Exception;
	MemberDetail getMembyEmail(String email);
	MemberDetail getMembyNO(int no);
	
	void saveTempPhoto(MultipartFile mf,String email,int day) throws Exception;
	
	ArrayList<String> getTemPhoto(String email);
	void delTemPhoto(String email);
	
	void updatePwd(MemberDetail mem);
}
