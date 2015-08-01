package kr.co.yj.dao;

import java.util.ArrayList;

import kr.co.yj.vo.Attraction;
import kr.co.yj.vo.FavorPlace;

public interface AttractionDao {
	
	ArrayList<Attraction> getAttractionList();
	ArrayList<Attraction> getAttractionListByFavor(FavorPlace favorPlace);
 
}
