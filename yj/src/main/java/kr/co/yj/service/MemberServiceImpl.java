package kr.co.yj.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.yj.dao.MemberDao;
import kr.co.yj.util.Md5Util;
import kr.co.yj.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDao dao;
	
	//서비스
	
	public void addMember(MemberVO mem) {
		
		String password=mem.getPassword();
		String pwd=Md5Util.md5Text(password);
		mem.setPassword(pwd);
		dao.addMember(mem);
		
	}
}
