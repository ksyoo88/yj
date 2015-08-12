package kr.co.yj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TogetherSnsController {
	
	@RequestMapping("/together.do")
	public String togetherSns() {
		
		return "/togethersns/blog.tiles";
	}
	
}
