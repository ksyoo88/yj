package kr.co.yj.controller;

import java.util.ArrayList;

import kr.co.yj.dao.PlaceDao;
import kr.co.yj.vo.Place;
import kr.co.yj.vo.PlaceAreaPointVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PlanController {
	
	@Autowired
	private PlaceDao placeDao; 

	@RequestMapping("/plan.do")
	public String getPlanIndex(){
		
		PlaceAreaPointVO a = new PlaceAreaPointVO();
		a.setMapXMax(127.06045437528176);
		a.setMapXMin(126.92888255495521);
		a.setMapYMax(37.57995616819309);
		a.setMapYMin(37.55472234766542);
		
		ArrayList<Place> areaPlaces = placeDao.getMapOnThePlaces(a);
		System.out.println(areaPlaces);
		
		
		
		return "/plan/plan.tiles";
	}
	
}
