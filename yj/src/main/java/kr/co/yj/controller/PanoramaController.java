package kr.co.yj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.yj.service.PanoramaService;

@Controller
public class PanoramaController {

	@Autowired
	PanoramaService service;
	
	
	@RequestMapping("panoform")
	public String panoform(){
		
		return "/main/panoform.tiles";
	}
	
	
}
