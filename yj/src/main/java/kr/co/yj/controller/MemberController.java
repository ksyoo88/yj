package kr.co.yj.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import kr.co.yj.service.MemberServiceImpl;
import kr.co.yj.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberServiceImpl memberservice;
	@Autowired
	private MappingJackson2JsonView jsonview;
	
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
			//session.setAttribute("memberEmail", member.getEmail());
			session.setAttribute("member", member);
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
		//String email=(String)session.getAttribute("memberEmail");
		
		MemberVO memberold=(MemberVO)session.getAttribute("member");
		String email =memberold.getEmail();
		
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
		
		//String email=(String)session.getAttribute("memberEmail");
		

		MemberVO memberold=(MemberVO)session.getAttribute("member");
		String email =memberold.getEmail();
		
		String mdpwd = memberservice.modifyinfo(name, pwd, email);
		memberold.setName(name);
		memberold.setPassword(mdpwd);
		session.setAttribute("member", memberold);
		return "redirect:/member.do";
	}
	
	@RequestMapping("/getTemPhoto.do")
	public ModelAndView getTemPhoto(HttpSession session){
		
		//String email=(String)session.getAttribute("memberEmail");
		MemberVO memberold=(MemberVO)session.getAttribute("member");
		String email =memberold.getEmail();
		
		ModelAndView mav = new ModelAndView();
		
		ArrayList<String> photos=memberservice.getTemPhoto(email);
		mav.addObject("photos", photos);
		mav.setView(jsonview);
		return mav;
	}
	@RequestMapping("/delTemPhoto.do")
	public ModelAndView delTemPhoto(HttpSession session){
		
		//String email=(String)session.getAttribute("memberEmail");
		MemberVO memberold=(MemberVO)session.getAttribute("member");
		String email =memberold.getEmail();
		
		
		ModelAndView mav = new ModelAndView();
		
		memberservice.delTemPhoto(email);
		//mav.addObject("photos", photos);
		mav.setView(jsonview);
		return mav;
	}
	
	@RequestMapping(value = "/savetempphoto.do", method = RequestMethod.POST)
	//http://netframework.tistory.com/422
	@ResponseBody
	public void savetempphoto(
			MultipartHttpServletRequest request
			,HttpSession session,
			@RequestParam("day")String day) throws Exception{

		System.out.println("day : "+day); 
		
		System.out.println(request); 
		System.out.println(request.getServletPath());
		System.out.println(request.getContextPath());
		System.out.println(request.getSession().getServletContext().getRealPath("/"));
		Iterator<String> itr =  request.getFileNames();
		System.out.println(itr.toString());
		System.out.println(itr.hasNext());
		
		if(itr.hasNext()) {
			MultipartFile mf=request.getFile(itr.next());
			
			MemberVO memberold=(MemberVO)session.getAttribute("member");
			String email =memberold.getEmail();
			
			//String email=(String)session.getAttribute("memberEmail");
			memberservice.saveTempPhoto(mf, email,day);
			System.out.println("s");
			
			
		}else {
			System.out.println("f");
			
			
		}
		
	
	}
	
	
	@RequestMapping("/profileup.do")
	public String profileup(@RequestParam("upfile")MultipartFile mf,HttpSession session) throws Exception{
		
		//String email=(String)session.getAttribute("memberEmail");
		MemberVO memberold=(MemberVO)session.getAttribute("member");
		String email =memberold.getEmail();
		
		
		String filename=memberservice.profileup(mf,email);
		memberold.setPhoto(filename);
		session.setAttribute("member", memberold);
		
		return "redirect:/member.do";
	}
	

}
