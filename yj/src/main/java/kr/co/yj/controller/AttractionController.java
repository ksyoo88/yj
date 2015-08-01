package kr.co.yj.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import kr.co.yj.service.AttractionService;
import kr.co.yj.vo.Attraction;
import kr.co.yj.vo.FavorPlace;

@Controller
public class AttractionController {
	
	@Autowired
	AttractionService attractionService;
	
	@Autowired
	MappingJackson2JsonView jsonView;
	
	@RequestMapping("/attraction.do")
	public String main(Model model) {
		
		model.addAttribute("title", "여기저기 - 여기, 가고싶어.");
		
		ArrayList<Attraction> attractionList = attractionService.getAttractionList();
		model.addAttribute("attractionList", attractionList);
		
		
		return "/attraction/attraction.tiles";
	}
	
	@RequestMapping(value="/favorplace.do", method=RequestMethod.POST)
	@ResponseBody
	//public void favorplace(@RequestParam("favor") String param, Model model) {
	public ArrayList<Attraction> favorplace(@RequestBody final FavorPlace favorPlace, Model model) {
		System.out.println(favorPlace.getAreacode());
		return attractionService.getAttractionListByFavor(favorPlace);
		
	}
	
}
