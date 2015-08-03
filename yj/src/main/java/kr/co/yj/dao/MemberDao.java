package kr.co.yj.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.yj.vo.MemberVO;

public interface MemberDao {

	void addMember(MemberVO mem);
	
	String getMemberPwd(MemberVO mem);
	
	MemberVO getMemberbyemail(String email);
	
	void updatePwd(MemberVO mem);
	
	void modifyinfo(MemberVO mem);
	void updateprofile(MemberVO mem);
	void addtempphoto(HashMap<String, String> map);
	
	ArrayList<String> getTemPhoto(String email);
	void delTemPhoto(String email);
}
