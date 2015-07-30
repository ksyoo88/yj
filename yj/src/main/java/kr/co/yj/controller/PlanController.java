package kr.co.yj.controller;

import java.util.ArrayList;

import kr.co.yj.dao.PlaceDao;
import kr.co.yj.vo.Place;
import kr.co.yj.vo.PlaceAreaPointVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

@Controller
public class PlanController {
	
	@Autowired
	private PlaceDao placeDao;
	
	@Autowired
	private MappingJackson2JsonView jsonView;

	@RequestMapping("/plan.do")
	public String planIndex(){	
		
		return "/plan/plan.tiles";
		
	}
	
	@RequestMapping("/mapSetting.do")
	public ModelAndView mapSetting(@RequestParam("minX")double minX,
								   @RequestParam("maxX")double maxX,
								   @RequestParam("minY")double minY,
								   @RequestParam("maxY")double maxY) {
		
		PlaceAreaPointVO placeArea = new PlaceAreaPointVO();
		//127.06045437528176
		placeArea.setMapXMax(maxX);
		//126.92888255495521
		placeArea.setMapXMin(minX);
		//37.57995616819309
		placeArea.setMapYMax(maxY);
		//37.55472234766542
		placeArea.setMapYMin(minY);
		
		ArrayList<Place> areaPlaces = placeDao.getMapOnThePlaces(placeArea);
		System.out.println(areaPlaces);	
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("areaPlaces", areaPlaces);
		
		mav.setView(jsonView);
		
		return mav;		
		
	}
	
}
