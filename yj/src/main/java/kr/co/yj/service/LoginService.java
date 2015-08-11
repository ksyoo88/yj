package kr.co.yj.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.co.yj.dao.MemberDao;
import kr.co.yj.security.MemberDetail;
import kr.co.yj.vo.MemberVO;

@Service
public class LoginService implements UserDetailsService {
	
	static final Logger logger = LoggerFactory.getLogger(LoginService.class);
	
	@Autowired
	MemberDao memberDao;
	
	@Override
	public MemberDetail loadUserByUsername(String email) throws UsernameNotFoundException {
		// email로 회원 정보 가져오기
		MemberVO member = memberDao.getMemberbyemail(email);
		
		logger.debug("############### member: " + member);
		
		// 로그인 정보를 리턴한다.
		MemberDetail memberDetail = new MemberDetail();
		BeanUtils.copyProperties(member, memberDetail);
		return memberDetail;
	}
	
}
