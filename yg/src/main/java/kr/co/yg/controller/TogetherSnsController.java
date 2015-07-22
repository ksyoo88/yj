package kr.co.yg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TogetherSnsController {

	@RequestMapping("/together.do")
	public String togetherSns() {
		
		return "/togethersns/blog.tiles";
	}
	
	@RequestMapping("/member.do")
	public String memberBlog() {
		
		return "/togethersns/member.tiles";
	}
	
}
