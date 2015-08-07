package kr.co.yj.service;

import java.util.ArrayList;

import kr.co.yj.dao.PlaceDao;
import kr.co.yj.vo.Place;
import kr.co.yj.vo.PlaceAreaPointVO;

import org.springframework.beans.factory.annotation.Autowired;

public class PlanServiceImpl implements PlanService {
	
	@Autowired 
	PlaceDao placeDao;
	
	@Override
	public ArrayList<Place> getMapOnThePlaces(PlaceAreaPointVO placeAreaPoint) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
