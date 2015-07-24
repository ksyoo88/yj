package kr.co.yj.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.yj.dao.MainDao;
import kr.co.yj.vo.Place;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	MainDao mainDao;
	
	@Override
	public ArrayList<Place> getPlaceListByRead() {
		return mainDao.getPlaceListByRead();
	}
}
