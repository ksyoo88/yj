package kr.co.yj.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.yj.dao.PanoramaDao;

@Service
public class panoramaServiceImpl implements PanoramaService {

	@Autowired
	PanoramaDao dao;
	
	@Override
	public ArrayList<String> getTemPhotoByday(String email, int day) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
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
	public ArrayList<String> getLocationTitle(String keyword) {
		ArrayList<String> titles =dao.getLocationTitle(keyword);
		
		return titles;
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
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("day", day);
		
		dao.delTemPhotoByday(map);
		
	}
	
	@Override
	public int savePanoDay(String memo,int day,int panoseq,String locaTitle) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memo", memo);
		map.put("day", day);
		map.put("panoseq", panoseq);
		
		String ID=dao.getLocationIDbytitle(locaTitle);
		
		map.put("locaID", ID);
		
		int panodayseq=dao.selectPano_day_seq();
		map.put("panodayseq", panodayseq);
		dao.savePanoDay(map);
		
		return panodayseq;
	}
	
	@Override
	public int savePanoTitle(int no, String title,Date to) {
		HashMap<String, Object> map = new HashMap<String, Object>();
	
		map.put("no", no);
		map.put("title", title);
		int panoseq=dao.selectPano_seq();
		map.put("panoseq", panoseq);
		map.put("date", to);
		
		dao.savePanoTitle(map);
		return panoseq;
		
	}
	
	@Override
	public void savePanoPhotobyDay(String email, int day,int panodayseq) {
		HashMap<String, Object> map= new HashMap<String, Object>();
		map.put("email", email);
		map.put("day", day);
		map.put("panodayseq", panodayseq);
		
		dao.savePanoPhotobyDay(map);
		
		
	}
	@Override
	public void delTemPhoto(String email) {
		dao.delTemPhoto(email);
		
	}
	
	
}
