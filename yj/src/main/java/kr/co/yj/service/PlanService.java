package kr.co.yj.service;

import java.text.ParseException;
import java.util.ArrayList;

import kr.co.yj.vo.Place;
import kr.co.yj.vo.PlaceAreaPointVO;
import kr.co.yj.vo.PlanVO;

public interface PlanService {

	ArrayList<Place> getMapOnThePlaces(PlaceAreaPointVO placeAreaPoint);
	
	int insertPlan(PlanVO planVO, String[] contentid, String[] days ) throws ParseException;
	
	PlanVO getPlanByNo(int no);
}
