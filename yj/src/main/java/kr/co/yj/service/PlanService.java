package kr.co.yj.service;

import java.util.ArrayList;

import kr.co.yj.vo.Place;
import kr.co.yj.vo.PlaceAreaPointVO;

public interface PlanService {

	ArrayList<Place> getMapOnThePlaces(PlaceAreaPointVO placeAreaPoint);
}
