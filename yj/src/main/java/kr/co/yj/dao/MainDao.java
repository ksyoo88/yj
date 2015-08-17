package kr.co.yj.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.yj.vo.Place;

public interface MainDao {
	
	ArrayList<Place> getPlaceListByRead();

	ArrayList<HashMap<String, String>> getPlanList();
 
}
