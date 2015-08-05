package kr.co.yj.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.yj.service.PanoramaService;

@Controller
public class PanoramaController {

	@Autowired
	PanoramaService service;
	
	
	@RequestMapping("/panorama.do")
	public String panoform(Model model){
		
		Date date = new Date();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		
		
		
		
		
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH)+1;
		int day = calendar.get(Calendar.DATE);

			
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("day", day);
				
		return "/panorama/panorama.tiles";
	}
	
	
}
