package kr.co.yj.service;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.yj.vo.Place;

public interface MainService {
	ArrayList<Place> getPlaceListByRead();

	ArrayList<HashMap<String, String>> getPlanList();
}
