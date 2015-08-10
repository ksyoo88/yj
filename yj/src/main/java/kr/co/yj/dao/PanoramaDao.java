package kr.co.yj.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface PanoramaDao {
	
	ArrayList<String> getTemPhoto(String email);
	ArrayList<String> getTemPhotoByday(HashMap<String, Object> map);
	ArrayList<String> getLocationTitle(String keyword);
	
	void delTemPhotoByname(HashMap<String, String> map);
	void delTemPhotoByday(HashMap<String, Object> map);
	void delTemPhoto(String email);
	
	void savePanoTitle(HashMap<String, Object> map);
	void savePanoDay(HashMap<String, Object> map);
	void savePanoPhotobyDay(HashMap<String, Object> map);
	
	String getLocationIDbytitle(String title);
	
	int selectPano_seq();
	int selectPano_day_seq();
	

}
