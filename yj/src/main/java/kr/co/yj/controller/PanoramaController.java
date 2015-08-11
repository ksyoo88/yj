package kr.co.yj.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

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
	public ModelAndView getTemPhotoByday(@RequestParam("day")int day,HttpSession session){
		
		//String email=(String)session.getAttribute("memberEmail");
		MemberVO memberold=(MemberVO)session.getAttribute("member");
		String email =memberold.getEmail();
		
		ModelAndView mav = new ModelAndView();
		
		ArrayList<String> photos=service.getTemPhotoByday(email,day);
		mav.addObject("photos", photos);
		mav.setView(jsonview);
		return mav;
	}
	
	@RequestMapping("/searchlocation.do")
	public ModelAndView getLocationTitle(@RequestParam("inputkeyword")String keyword){
		ModelAndView mav = new ModelAndView();
		ArrayList<String> titles=service.getLocationTitle(keyword);
		
		mav.setView(jsonview);
		mav.addObject("titles", titles);
		return mav;
	}
	
	
	@RequestMapping("/savePanoTitle.do")
	public ModelAndView savePanoTitle(@RequestParam("title")String title,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberVO memberold=(MemberVO)session.getAttribute("member");
		int no =memberold.getNo();
		
		//int panoseq=service.savePanoTitle(no,title);
		//mav.addObject("panoseq", panoseq);
		mav.setView(jsonview);
		return mav;
	}
	
	@RequestMapping("/savePanoMemo.do")
	public ModelAndView savePanoMemo(@RequestParam("Memo")String memo,
										@RequestParam("day")int day,
										@RequestParam("panoseq")int panoseq,
										@RequestParam("locaTitle")String locaTitle
										) {
		ModelAndView mav = new ModelAndView();
		
		
		
		int panodayseq=service.savePanoDay(memo, day, panoseq, locaTitle);
		
		mav.addObject("panodayseq", panodayseq);
		mav.setView(jsonview);
		return mav;
	}
	
	@RequestMapping("/savePanoDayPhoto.do")
	public ModelAndView savePanoDayPhoto(@RequestParam("panodayseq")int panodayseq,
										@RequestParam("day")int day,HttpSession session){
		MemberVO memberold=(MemberVO)session.getAttribute("member");
		String email =memberold.getEmail();
		
		ModelAndView mav = new ModelAndView();
		
		
		service.savePanoPhotobyDay(email, day, panodayseq);
		mav.setView(jsonview);
		return mav;
	}
	
	@RequestMapping("/savePanorama.do")
	public ModelAndView savePanorama(@RequestParam("title")String title,
									@RequestParam("locaform")String[] locaArr,
									@RequestParam("memoform")String[] memoArr,
									@RequestParam("date")String date,
									HttpSession session) throws ParseException{
		ModelAndView mav = new ModelAndView();
		
		int day=locaArr.length;
		MemberVO memberold=(MemberVO)session.getAttribute("member");
		int no =memberold.getNo();
		String email=memberold.getEmail();
		
		System.out.println(date);
		SimpleDateFormat transFormat = new SimpleDateFormat("d/M/yyyy");
		Date to = transFormat.parse(date);
		
		int panoseq=service.savePanoTitle(no, title,to);
		
		for(int i=0;i<day;i++ ){
			String memo=memoArr[i];
			String locaTitle=locaArr[i];
			int panodayseq=service.savePanoDay(memo, i+1, panoseq, locaTitle);
			System.out.println("panodayseq는 이거-"+panodayseq);
			service.savePanoPhotobyDay(email, i+1, panodayseq);
		}
		
		service.delTemPhoto(email);
		
		mav.setViewName("redirect:panodetail.do?panoNo="+panoseq);
		return mav;
	}
	
	@RequestMapping("panodetail.do")
	public ModelAndView panodetail(@RequestParam("panoNo")int panoNo){
		ModelAndView mav = new ModelAndView();
		
		
		
		
		
		
		mav.setViewName("/panorama/panodetail.tiles");
		return mav;
	}
	
	
	
	
}
