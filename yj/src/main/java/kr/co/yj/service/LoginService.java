package kr.co.yj.service;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.co.yj.dao.LoginDao;

@Service
public class LoginService implements UserDetailsService {
	
	@Autowired
	LoginDao dao;
	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		// email로 회원 정보 가져오기
		String memberPwd = dao.getMemberPwdByEmail(email);
		
		System.out.println("email:" + email);
		System.out.println("memberPwd:" + memberPwd);
		
		// "ROLE_USER" 란 이름으로 권한을 설정한다.
		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
		roles.add(new SimpleGrantedAuthority("ROLE_USER"));
		
		// 로그인 정보를 리턴한다.
		UserDetails user = new User(email, memberPwd, roles);
		return user;
	}
	
}
