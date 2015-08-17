package kr.co.yj.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.yj.dao.TogetherDao;

@Service
public class TogetherServiceImpl implements TogetherService {
	
	@Autowired
	private TogetherDao togetherDao;
	
	@Override
	public ArrayList<HashMap<String, String>> getPanoList(int currPage, String order) {
		if(currPage < 1) {
			currPage = 1;
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("currPage", currPage);
		map.put("order", order);
		return togetherDao.getPanoList(map);
	}
	
	@Override
	public ArrayList<HashMap<String, String>> getPlanList(int currPage, String order) {
		if(currPage < 1) {
			currPage = 1;
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("currPage", currPage);
		map.put("order", order);
		return togetherDao.getPlanList(map);
	}
	@Override
	public int getPanoTotalCnt() {
		return togetherDao.getPanoTotalCnt();
	}
	@Override
	public int getPlanTotalCnt() {
		return togetherDao.getPlanTotalCnt();
	}
	
}
