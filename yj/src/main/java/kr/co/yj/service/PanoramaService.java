package kr.co.yj.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import kr.co.yj.vo.PanoDayPhotoVO;
import kr.co.yj.vo.PanoDayVO;
import kr.co.yj.vo.PanoReplyVO;
import kr.co.yj.vo.PanoramaVO;
import kr.co.yj.vo.Place;

public interface PanoramaService {
	
	ArrayList<String> getTempPhoto(String email);
	ArrayList<String> getTemPhotoByday(String email,int day);
	ArrayList<Place> getLocationTitle(String keyword);
	void delTemPhotoByname(String email,String filename);
	void delTemPhotoByday(String email,String day);
	void delTemPhoto(String email);
	
	int savePanoTitle(int no,String title,Date to);
	void modifysavePanoTitle(int no,String title,Date to);
	
	int savePanoDay(String memo,int day,int panoseq,String locaTitle);
	void modifydeletePanoDay(int panoNo);
	
	
	void savePanoPhotobyDay(String email,int day,int panodayseq);
	
	int panolike(int memno,int panono,boolean likecheck);
	
	PanoramaVO getPanorama(int panono);
	ArrayList<PanoDayVO> getPanoday(int panono);
	ArrayList<PanoDayPhotoVO> getPanodayPhoto(int panodayno);
	
	void savePanoReply(int panono,int memno ,String reply);
	
	ArrayList<PanoReplyVO> getPanoReply(int panono);
	
	void deletereply(int replyno);
	
	String likecheck(int panoNo,int memno);
	
	void deletePanorama(int panoNo);
	
	void movetempphoto(int panoNo,String email);
	
	Place movelocation(String title);
}
