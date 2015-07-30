package kr.co.yj.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
	
	@RequestMapping("/getmem.do")
	public MemberVO getmem(@RequestParam("email")String email){
		
		MemberVO mem= new MemberVO();
		memberservice.getMembyEmail(email);
		
		return mem;
	}
	
	@RequestMapping("/login.do")
	public ModelAndView login(@RequestParam("loginEmail")String email,
			@RequestParam("pwd")String pwd,
			HttpSession session){
		ModelAndView mav = new ModelAndView();
		MemberVO member= memberservice.loginCheck(email, pwd);
		if(member!=null){
			mav.addObject("login", true);
			session.setAttribute("memberEmail", member.getEmail());
			mav.setViewName("redirect:/member.do");
		}else{
			mav.addObject("login", false);
			mav.setViewName("/main/login.tiles");
		}
		return mav;
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session){
		
		session.invalidate();
		
		return "/main/main.tiles";
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
	
	@RequestMapping("/checkpwd.do")
	@ResponseBody
	public String checkpwd(@RequestParam("pwd")String pwd
							,HttpSession session) {
		String email=(String)session.getAttribute("memberEmail");
		
		MemberVO member= memberservice.loginCheck(email, pwd);
		if(member!=null){
			
			return "true";
			
		}else{
			return "false";
			
		}
	
		
	}
	
	@RequestMapping("/modify.do")
	public String modify(@RequestParam("modifyname")String name,
						@RequestParam("password2")String pwd
						,HttpSession session){
		
		String email=(String)session.getAttribute("memberEmail");
		memberservice.modifyinfo(name, pwd, email);
		
		return "redirect:/member.do";
	}
	
	@RequestMapping("/profileup.do")
	public String profileup(@RequestParam("upfile")MultipartFile mf,HttpSession session) throws Exception{
		
		System.out.println("dd");
		String email=(String)session.getAttribute("memberEmail");
		
		memberservice.profileup(mf,email);
		
		
		return "redirect:/member.do";
	}
	

}
