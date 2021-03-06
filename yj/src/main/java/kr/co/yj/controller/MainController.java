package kr.co.yj.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.RememberMeAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.yj.security.MemberDetail;
import kr.co.yj.service.MainService;
import kr.co.yj.vo.Place;

@Controller
public class MainController {
	
	@Autowired
	MainService mainService;
	
	@RequestMapping("/main.do")
	public String main(Model model, HttpSession session, Principal principal,
			@RequestParam(value="login", required=false)String login,
			@RequestParam(value="logout", required=false)String logout,
			@RequestParam(value="error", required=false)String error,
			@RequestParam(value="sendmail", required=false)String sendmail,
			@RequestParam(value="join", required=false)String join) {
		model.addAttribute("title", "여기저기 - 여행, 끝이 아닌 시작을 향해.");
		
		ArrayList<Place> placeList = mainService.getPlaceListByRead();
		model.addAttribute("placeList", placeList);
		
		ArrayList<HashMap<String, String>> planlist = mainService.getPlanList();
		model.addAttribute("planlist", planlist);
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication instanceof UsernamePasswordAuthenticationToken) {
			UsernamePasswordAuthenticationToken token 
			= (UsernamePasswordAuthenticationToken) SecurityContextHolder.getContext().getAuthentication();
			if (authentication != null) {
				MemberDetail memberDetail = (MemberDetail) token.getDetails();			
				session.setAttribute("member", memberDetail);
			}
		}
		
		if(login != null) {
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
		}
		if(logout != null) {
			model.addAttribute("msg", "정상적으로 로그아웃 되었습니다.");
		}
		if(error != null) {
			model.addAttribute("error", "이메일 또는 비밀번호가 유효하지 않습니다.");
		}
		if(join != null) {
			model.addAttribute("msg", "회원가입되었습니다.");
		}
		if(sendmail != null) {
			model.addAttribute("msg", "비밀번호가 이메일로 전송되었습니다.<br />확인 후 로그인 하시길 바랍니다.");
		}
		
		return "/main/main.tiles";
	}
	
	/**
	 * If the login in from remember me cookie, refer
	 * org.springframework.security.authentication.AuthenticationTrustResolverImpl
	 */
	private boolean isRememberMeAuthenticated() {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication == null) {
			return false;
		}

		return RememberMeAuthenticationToken.class.isAssignableFrom(authentication.getClass());
	}
	
}
