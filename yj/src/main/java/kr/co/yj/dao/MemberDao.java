package kr.co.yj.dao;

import kr.co.yj.vo.MemberVO;

public interface MemberDao {

	void addMember(MemberVO mem);
	
	String getMemberPwd(MemberVO mem);
	
	MemberVO getMemberbyemail(String email);
	
	void updatePwd(MemberVO mem);
	
	void modifyinfo(MemberVO mem);
	void updateprofile(MemberVO mem);
}
