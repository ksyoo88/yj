package kr.co.yj.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.yj.service.MemberServiceImpl;
import kr.co.yj.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberServiceImpl memberservice;
	
	@RequestMapping("/addmember.do")
	public ModelAndView addMember(MemberVO mem) {
		
		ModelAndView mav= new ModelAndView();
		
		memberservice.addMember(mem);
		
		mav.setViewName("redirect:/form.do");
		return mav;
	}
	
	
	@RequestMapping("/form.do")
	public String form() {
		
		return "/main/login.tiles";
	}
	
	@RequestMapping("/email.do")
	public String email(@RequestParam("to")String to){
		
		memberservice.sendemail(/*subject, text, from,*/ to);
		
		
			return "/main/login.tiles";
			
		
	}
	@RequestMapping("/login.do")
	public ModelAndView login(@RequestParam("loginEmail")String email,
			@RequestParam("pwd")String pwd,
			HttpSession session){
		ModelAndView mav = new ModelAndView();
		MemberVO member= memberservice.loginCheck(email, pwd);
		if(member!=null){
			mav.addObject("login", true);
			session.setAttribute("member", member);
			mav.setViewName("redirect:/member.do");
		}else{
			mav.addObject("login", false);
			mav.setViewName("/main/login.tiles");
		}
		return mav;
	}
	
	@RequestMapping("/checkEmail.do")
	@ResponseBody
	public String checkEmail(@RequestParam("email")String email) {
		
		boolean check=memberservice.checkEmail(email);
		
		if(check){
			return "true";
		}else{
			return "false";
			
		}
		
	}
	

}
