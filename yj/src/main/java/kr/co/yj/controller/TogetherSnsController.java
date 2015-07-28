package kr.co.yj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TogetherSnsController {

	@RequestMapping("/together.do")
	public String togetherSns() {
		
		return "/togethersns/blog.tiles";
	}
	
	@RequestMapping("/member.do")
	public String memberBlog(Model model) {
		
		//model.addAttribute("member", model);
		return "/togethersns/member.tiles";
	}
	
}
