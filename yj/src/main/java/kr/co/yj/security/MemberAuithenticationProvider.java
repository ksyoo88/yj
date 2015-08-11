package kr.co.yj.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.co.yj.service.LoginService;

public class MemberAuithenticationProvider implements AuthenticationProvider {

	static final Logger logger = LoggerFactory.getLogger(MemberAuithenticationProvider.class);
	
	@Autowired
	LoginService loginService;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
	
		String email = (String)authentication.getPrincipal();
		String password = (String)authentication.getCredentials();
		
		logger.info("################ email: " + email);
		logger.info("################ password: " + password);
		 
		MemberDetail memberDetail = loginService.loadUserByUsername(email);
		
		logger.debug("############### member: " + memberDetail);
		if (memberDetail == null) {
			throw new UsernameNotFoundException("사용자 없음");
		}
		
		String md5Password = Md5Util.md5Text(password);
		if (memberDetail.getPassword().equals(md5Password)) {
			
			logger.info("############################# 로그인 체크 통과");
			
			memberDetail.setPassword(md5Password);
			
			UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(email, md5Password, memberDetail.getAuthorities());
			token.setDetails(memberDetail);
			return token;
			
		} else {
			logger.info("############################# 로그인 체크 통과");
			throw new BadCredentialsException("아이디 혹은 비밀번호가 일치하지 않습니다.");
		}
	}
	
	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
}
