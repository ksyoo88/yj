package kr.co.yj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.yj.service.MemberService;
import kr.co.yj.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberservice;
	
	@RequestMapping("/addmember.do")
	public ModelAndView addMember(MemberVO mem) {
		
		ModelAndView mav= new ModelAndView();
		
		memberservice.addMember(mem);
		
		mav.setViewName("redirect:/member.do");
		return mav;
	}
	
	@RequestMapping("/form.do")
	public String form() {
		
		return "/main/login.tiles";
	}
	

}
