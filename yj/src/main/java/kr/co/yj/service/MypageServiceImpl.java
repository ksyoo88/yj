package kr.co.yj.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.yj.dao.MypageDao;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private MypageDao mypageDao;

	@Override
	public int getPanoTotalGroups(int userNo) {
		int total = mypageDao.getPanoTotalGroups(userNo);
		return (int)Math.ceil(total/8.0);
	}

	@Override
	public int getPlanTotalGroups(int userNo) {
		return mypageDao.getPlanTotalGroups(userNo);
	}
	
	@Override
	public ArrayList<HashMap<String, String>> getPanoListByPage(HashMap<String, Object> map) {
		return mypageDao.getPanoListByPage(map);
	}
	
	@Override
	public ArrayList<HashMap<String, String>> getPlanListByPage(HashMap<String, Object> map) {
		return mypageDao.getPlanListByPage(map);
	}
}
