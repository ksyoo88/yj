package kr.co.yj.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.yj.dao.AttractionDao;
import kr.co.yj.vo.Attraction;

@Service
public class AttractionServiceImpl implements AttractionService {
	
	@Autowired
	AttractionDao attractionDao;
	
	@Override
	public ArrayList<Attraction> getAttractionList() {
		return attractionDao.getAttractionList();
	}
}
