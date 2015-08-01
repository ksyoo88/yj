package kr.co.yj.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import kr.co.yj.vo.Attraction;
import kr.co.yj.vo.FavorPlace;

public interface AttractionService {
	ArrayList<Attraction> getAttractionList();
	ArrayList<Attraction> getAttractionListByFavor(FavorPlace favorPlace);
}
