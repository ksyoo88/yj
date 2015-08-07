package kr.co.yj.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface PanoramaDao {
	
	ArrayList<String> getTemPhoto(String email);
	ArrayList<String> getTemPhotoByday(HashMap<String, Object> map);
	void delTemPhotoByname(HashMap<String, String> map);
	void delTemPhotoByday(HashMap<String, Object> map);
	void savePanoTitle(HashMap<String, String> map);
	void savePanoPhotobyDay(HashMap<String, Object> map);
	

}
