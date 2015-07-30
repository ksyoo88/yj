package kr.co.yj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AttractionController {
	
	@RequestMapping("/attraction.do")
	public String main(Model model) {
		
		model.addAttribute("title", "여기저기 - 여기, 가고싶어.");
		
		return "/attraction/attraction.tiles";
	}
	
}
