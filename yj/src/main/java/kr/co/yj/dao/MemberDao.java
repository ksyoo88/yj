package kr.co.yj.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.yj.security.MemberDetail;
import kr.co.yj.vo.MemberVO;

public interface MemberDao {

	void addMember(MemberDetail mem);
	
	String getMemberPwd(MemberVO mem);
	
	MemberVO getMemberbyemail(String email);
	MemberVO getMemberbyNo(int no);
	
	void updatePwd(MemberVO mem);
	
	void modifyinfo(MemberVO mem);
	void updateprofile(MemberVO mem);
	void addtempphoto(HashMap<String, Object> map);
	
	ArrayList<String> getTemPhoto(String email);
	void delTemPhoto(String email);
}
