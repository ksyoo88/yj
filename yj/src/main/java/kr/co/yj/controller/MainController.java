package kr.co.yj.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.yj.service.MainService;
import kr.co.yj.vo.Place;

@Controller
public class MainController {
	
	@Autowired
	MainService mainService;
	
	@RequestMapping("/main.do")
	public String main(Model model) {
		
		model.addAttribute("title", "여기저기 - 여행, 끝이 아닌 시작을 향해.");
		
		ArrayList<Place> placeList = mainService.getPlaceListByRead();
		model.addAttribute("placeList", placeList);
		
		return "/main/main.tiles";
	}
	
}
