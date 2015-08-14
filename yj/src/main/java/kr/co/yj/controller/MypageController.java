package kr.co.yj.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.fasterxml.jackson.annotation.JsonView;

import kr.co.yj.security.MemberDetail;
import kr.co.yj.service.MypageService;
import kr.co.yj.vo.Panorama;

@Controller
public class MypageController {
	
	@Autowired
	MappingJackson2JsonView jsonView;
	
	@Autowired
	MypageService mypageService;
	
	@RequestMapping("/mypage.do")
	public String memberBlog(Model model,HttpSession session) {
		
		return "/mypage/mypage.tiles";
	}
	
	/**
	 * 파노라마와 여행일정의 총 그룹 수를 불러오는 기능
	 */
	@RequestMapping("loadtotalgroups.json")
	@ResponseBody
	public ModelAndView loadtotalgroups(Principal principal, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDetail member = (MemberDetail)session.getAttribute("member");
		int userNo = member.getNo();
		System.out.println(userNo);
		int panoTotalGroups = mypageService.getPanoTotalGroups(41);
		//int planTotalGroups = mypageService.getPlanTotalGroups(userEmail);
		mav.addObject("panoTotalGroups", panoTotalGroups);
		mav.addObject("planTotalGroups", 5);
		
		mav.setView(jsonView);
		return mav;
	}
	
	@RequestMapping("/loadpano.json")
	@ResponseBody
	public ArrayList<HashMap<String, String>> loadpano(int currPage, String tab) {
		System.out.println("currPage,tab" + currPage + ", " + tab);
		
		if(tab.equals("pano")) {
			ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String,String>>();
			list = mypageService.getPanoListByPage(currPage);
			return list;
		} else {
			return null;
		}
		
	}
	@RequestMapping("/loadplan.json")
	@ResponseBody
	public ArrayList<Panorama> loadplan() {
		ArrayList<Panorama> list = new ArrayList<Panorama>();
		return list;
	}
}
