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

import kr.co.yj.security.MemberDetail;
import kr.co.yj.service.MypageService;

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
		int panoTotalGroups = mypageService.getPanoTotalGroups(userNo);
		int planTotalGroups = mypageService.getPlanTotalGroups(userNo);
		mav.addObject("panoTotalGroups", panoTotalGroups);
		mav.addObject("planTotalGroups", planTotalGroups);
		
		mav.setView(jsonView);
		return mav;
	}
	
	@RequestMapping("/loadpano.json")
	@ResponseBody
	public ArrayList<HashMap<String, String>> loadpano(int currPage, HttpSession session) {
		MemberDetail member = (MemberDetail)session.getAttribute("member");
		int userNo = member.getNo();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("currPage", currPage);
		map.put("userNo", userNo);
		ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String,String>>();
		list = mypageService.getPanoListByPage(map);
		return list;
		
	}
	@RequestMapping("/loadplan.json")
	@ResponseBody
	public ArrayList<HashMap<String, String>> loadplan(int currPage, HttpSession session) {
		MemberDetail member = (MemberDetail)session.getAttribute("member");
		int userNo = member.getNo();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("currPage", currPage);
		map.put("userNo", userNo);
		ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String,String>>();
		list = mypageService.getPlanListByPage(map);
		return list;
	}
}
