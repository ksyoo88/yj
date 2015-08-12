package kr.co.yj.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import kr.co.yj.vo.PanoDayPhotoVO;
import kr.co.yj.vo.PanoDayVO;
import kr.co.yj.vo.PanoramaVO;

public interface PanoramaService {
	
	ArrayList<String> getTempPhoto(String email);
	ArrayList<String> getTemPhotoByday(String email,int day);
	ArrayList<String> getLocationTitle(String keyword);
	void delTemPhotoByname(String email,String filename);
	void delTemPhotoByday(String email,String day);
	void delTemPhoto(String email);
	int savePanoTitle(int no,String title,Date to);
	
	int savePanoDay(String memo,int day,int panoseq,String locaTitle);
	
	
	void savePanoPhotobyDay(String email,int day,int panodayseq);
	
	int panolike(int memno,int panono,boolean likecheck);
	
	PanoramaVO getPanorama(int panono);
	ArrayList<PanoDayVO> getPanoday(int panono);
	ArrayList<PanoDayPhotoVO> getPanodayPhoto(int panodayno);
	
}
