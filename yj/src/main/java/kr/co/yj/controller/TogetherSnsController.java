package kr.co.yj.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.yj.service.MemberService;
import kr.co.yj.vo.MemberVO;

@Controller
public class TogetherSnsController {
	
	@Autowired
	MemberService membersevice;

	@RequestMapping("/together.do")
	public String togetherSns() {
		
		return "/togethersns/blog.tiles";
	}
	
	@RequestMapping("/member.do")
	public String memberBlog(/*Model model,HttpSession session*/) {
		
		// String email=(String)session.getAttribute("memberEmail");
		//MemberVO member=(MemberVO)session.getAttribute("member");
		/*
		if(MemberVO!=null){
			member=membersevice.getMembyEmail(email);
			
		}
		*/
		
		//model.addAttribute("member", member);
		return "/togethersns/member.tiles";
	}
	
}
