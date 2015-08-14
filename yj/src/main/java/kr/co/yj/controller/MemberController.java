package kr.co.yj.controller;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import kr.co.yj.security.Md5Util;
import kr.co.yj.security.MemberDetail;
import kr.co.yj.service.MailService;
import kr.co.yj.service.MemberServiceImpl;

@Controller
public class MemberController {
	
	@Autowired
	private MemberServiceImpl memberservice;
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	private MappingJackson2JsonView jsonview;
	
	@RequestMapping("/addmember.do")
	public ModelAndView addMember(MemberDetail mem) {
		ModelAndView mav= new ModelAndView();
		
		memberservice.addMember(mem);
		
		mav.setViewName("redirect:/main.do");
		return mav;
	}
	
	@RequestMapping("/email.do")
	public String email(@RequestParam("to")String to) {
		MemberDetail mem = memberservice.getMembyEmail(to);
		String pwd= memberservice.changePwd(mem);
		String password=Md5Util.md5Text(pwd);
		mem.setPassword(password);
		memberservice.updatePwd(mem);
		StringBuffer html = new StringBuffer();
		String html_str = "";
		BufferedReader in = null;
		try {
			in = new BufferedReader(new InputStreamReader(new FileInputStream("C:/spring_study/git/yj/src/main/webapp/resources/mail/findpw.jsp"),"UTF8"));
			while((html_str =in.readLine() ) != null){
				html.append(html_str);
			}
			System.out.println("##abc##:" + html.toString());
			html_str = html.toString();
			html_str = html_str.replaceAll("<pwd>", pwd);
			mailService.sendHtmlMail("yogijogi@naver.com", to, "[여기저기]임시 비밀번호가 발급되었습니다.", html_str);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(in != null) { in.close(); }
			} catch (Exception e2) { }
		}
		// memberservice.sendemail(/*subject, text, from,*/ to);
		
			return "redirect:/main.do?sendmail";
		
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
		MemberDetail memberold = (MemberDetail)session.getAttribute("member");
		String email =memberold.getEmail();
		
		MemberDetail member= memberservice.loginCheck(email, pwd);
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

		MemberDetail memberold = (MemberDetail)session.getAttribute("member");
		String email = memberold.getEmail();
		
		String mdpwd = memberservice.modifyinfo(name, pwd, email);
		memberold.setName(name);
		if(mdpwd != null) {
			memberold.setPassword(mdpwd);
		}
		session.setAttribute("member", memberold);
		return "redirect:/mypage.do";
	}
	
	@RequestMapping("/getTemPhoto.do")
	public ModelAndView getTemPhoto(HttpSession session){
		
		//String email=(String)session.getAttribute("memberEmail");
		MemberDetail memberold = (MemberDetail)session.getAttribute("member");
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
		MemberDetail memberold = (MemberDetail)session.getAttribute("member");
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
	public void savetempphoto(MultipartHttpServletRequest request, HttpSession session,
			@RequestParam("day")int day) throws Exception{
		Iterator<String> itr =  request.getFileNames();
		if(itr.hasNext()) {
			MultipartFile mf=request.getFile(itr.next());
			
			MemberDetail memberold = (MemberDetail)session.getAttribute("member");
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
		MemberDetail memberold = (MemberDetail)session.getAttribute("member");
		String email =memberold.getEmail();
		
		String filename=memberservice.profileup(mf,email);
		memberold.setPhoto(filename);
		session.setAttribute("member", memberold);
		
		return "redirect:/mypage.do";
	}

}
