package kr.co.yj.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.yj.service.AttractionService;
import kr.co.yj.vo.Attraction;

@Controller
public class AttractionController {
	
	@Autowired
	AttractionService attractionService;
	
	@RequestMapping("/attraction.do")
	public String main(Model model) {
		
		model.addAttribute("title", "여기저기 - 여기, 가고싶어.");
		
		ArrayList<Attraction> attractionList = attractionService.getAttractionList();
		model.addAttribute("attractionList", attractionList);
		
		
		return "/attraction/attraction.tiles";
	}
	
}
