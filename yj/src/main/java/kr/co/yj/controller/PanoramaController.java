package kr.co.yj.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import kr.co.yj.service.PanoramaService;
import kr.co.yj.vo.MemberVO;

@Controller
public class PanoramaController {

	@Autowired
	PanoramaService service;
	@Autowired
	MappingJackson2JsonView jsonview;
	
	
	@RequestMapping("/panorama.do")
	public String panoform(Model model,HttpSession session){
		
		Date date = new Date();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		
		MemberVO memberold=(MemberVO)session.getAttribute("member");
		String email =memberold.getEmail();
		

		//String email=(String)session.getAttribute("memberEmail");
		
		ArrayList<String> photos=service.getTempPhoto(email);
		
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH)+1;
		int day = calendar.get(Calendar.DATE);

			
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("day", day);
		model.addAttribute("photos", photos);
				
		return "/panorama/panorama.tiles";
	}
	
	@RequestMapping("/delTemPhotoByname.do")
	public ModelAndView delTemPhotoByname(@RequestParam("name")String filename,HttpSession session){
		ModelAndView mav = new ModelAndView();
		
		MemberVO memberold=(MemberVO)session.getAttribute("member");
		String email =memberold.getEmail();
		
		
		//String email=(String)session.getAttribute("memberEmail");
		service.delTemPhotoByname(email, filename);
		
		mav.setView(jsonview);
		
		return mav;
	}
	
	@RequestMapping("/delTemPhotoByday.do")
	public ModelAndView delTemPhotoByday(@RequestParam("day")String day,HttpSession session){
		ModelAndView mav = new ModelAndView();
		
		//String email=(String)session.getAttribute("memberEmail");
		
		MemberVO memberold=(MemberVO)session.getAttribute("member");
		String email =memberold.getEmail();
	
		
		
		service.delTemPhotoByday(email, day);
		mav.setView(jsonview);
		
		return mav;
	}

	@RequestMapping("/getTemPhotoByday.do")
	public ModelAndView getTemPhotoByday(@RequestParam("day")String day,HttpSession session){
		
		//String email=(String)session.getAttribute("memberEmail");
		MemberVO memberold=(MemberVO)session.getAttribute("member");
		String email =memberold.getEmail();
		
		ModelAndView mav = new ModelAndView();
		
		ArrayList<String> photos=service.getTemPhotoByday(email,day);
		mav.addObject("photos", photos);
		mav.setView(jsonview);
		return mav;
	}
	@RequestMapping("/savePanoTitle.do")
	public ModelAndView savePanoTitle(@RequestParam("title")String title,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberVO memberold=(MemberVO)session.getAttribute("member");
		int no =memberold.getNo();
		
		service.savePanoTitle(no,title);
		
		return mav;
		
	}
	
}
