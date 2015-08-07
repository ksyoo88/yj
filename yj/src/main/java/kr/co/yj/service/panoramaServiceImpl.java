package kr.co.yj.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.yj.dao.PanoramaDao;

@Service
public class panoramaServiceImpl implements PanoramaService {

	@Autowired
	PanoramaDao dao;
	
	@Override
	public ArrayList<String> getTemPhotoByday(String email, String day) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("day", day);
		
		ArrayList<String> photos =dao.getTemPhotoByday(map);
		return photos;
	}
	
	@Override
	public ArrayList<String> getTempPhoto(String email) {
		
		ArrayList<String> photos =dao.getTemPhoto(email);
		return photos;
	}
	
	@Override
	public void delTemPhotoByname(String email, String filename) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("filename", filename);
		
		dao.delTemPhotoByname(map);
		
	}
	@Override
	public void delTemPhotoByday(String email, String day) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("day", day);
		
		dao.delTemPhotoByday(map);
		
	}
	@Override
	public void savePanoTitle(int no, String title) {
		HashMap<String, String> map = new HashMap<String, String>();
		String noo=String.valueOf(no);
		map.put("no", noo);
		map.put("title", title);
		
		dao.savePanoTitle(map);		
	}
	
	@Override
	public void savePanoPhotobyDay(String email, int day) {
		HashMap<String, Object> map= new HashMap<String, Object>();
		map.put("email", email);
		map.put("day", day);
		
		dao.savePanoPhotobyDay(map);
		
	}
	
	
}
