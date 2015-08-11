package kr.co.yj.security;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class AutoLoginSuccessHandler implements AuthenticationSuccessHandler {
	
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException {
		System.out.println("####################1" + authentication);
		MemberDetail memberDetail = (MemberDetail)authentication.getPrincipal();
		request.getSession().setAttribute("member", memberDetail);
		response.sendRedirect("/");
    }
}