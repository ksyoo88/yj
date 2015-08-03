package kr.co.yj.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.yj.dao.AttractionDao;
import kr.co.yj.vo.Attraction;
import kr.co.yj.vo.FavorPlace;

@Service
public class AttractionServiceImpl implements AttractionService {
	private static final Logger logger = LoggerFactory.getLogger(AttractionServiceImpl.class);
	
	@Autowired
	AttractionDao attractionDao;
	
	@Override
	public ArrayList<Attraction> getAttractionList() {
		return attractionDao.getAttractionList();
	}
	@Override
	public ArrayList<Attraction> getAttractionListByFavor(FavorPlace favorPlace) {
		/*
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("areacode", (String)paramMap.get("areacode"));
		paramMap.remove("areacode");
		
		list.add(map);
		list.addAll(paramMap);
		*/
		System.out.println(favorPlace.getList().toString());
		return attractionDao.getAttractionListByFavor(favorPlace);
	}
}
