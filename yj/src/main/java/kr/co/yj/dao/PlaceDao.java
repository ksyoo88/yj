package kr.co.yj.dao;

import java.util.ArrayList;

import kr.co.yj.vo.Place;
import kr.co.yj.vo.PlaceAreaPointVO;

public interface PlaceDao {

	ArrayList<Place> getMapOnThePlaces(PlaceAreaPointVO placeAreaPoint);
	Place getPlaceByContentid(String contentid);
	ArrayList<Place> getTopPlace(String category);
	ArrayList<Place> getLocationbyTitle(String keyword);
	   
}
