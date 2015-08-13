package kr.co.yj.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.yj.security.MemberDetail;
import kr.co.yj.vo.MemberVO;

public interface MemberDao {

	void addMember(MemberDetail mem);
	
	String getMemberPwd(MemberDetail mem);
	
	MemberDetail getMemberbyemail(String email);
	MemberDetail getMemberbyNo(int no);
	
	void updatePwd(MemberDetail mem);
	
	void modifyinfo(MemberDetail mem);
	void updateprofile(MemberDetail mem);
	void addtempphoto(HashMap<String, Object> map);
	
	ArrayList<String> getTemPhoto(String email);
	void delTemPhoto(String email);
}
