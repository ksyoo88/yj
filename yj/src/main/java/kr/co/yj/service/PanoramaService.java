package kr.co.yj.service;

import java.util.ArrayList;
import java.util.HashMap;

public interface PanoramaService {
	
	ArrayList<String> getTempPhoto(String email);
	ArrayList<String> getTemPhotoByday(String email,String day);
	void delTemPhotoByname(String email,String filename);
	void delTemPhotoByday(String email,String day);
	void savePanoTitle(int no,String title);
	void savePanoPhotobyDay(String email,int day);
	
}
