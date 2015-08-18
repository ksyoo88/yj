package kr.co.yj.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.yj.vo.PanoDayPhotoVO;
import kr.co.yj.vo.PanoDayVO;
import kr.co.yj.vo.PanoReplyVO;
import kr.co.yj.vo.PanoramaVO;

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
	
	ArrayList<String> gettempphotoname(HashMap<String, Object> map);
	void insertphotonameTotemphoto(HashMap<String, Object> map);
	
	String getLocationIDbytitle(String title);
	
	int selectPano_seq();
	int selectPano_day_seq();
	
	String likecheck(HashMap<String, Object> map);
	void likelisert(HashMap<String, Object> map);
	void likedelete(HashMap<String, Object> map);
	
	int panolikecnt(int panono);
	void updatelikecnt(HashMap<String, Object> map);
	
	PanoramaVO getPanorama(int panono);
	ArrayList<PanoDayVO> getPanoday(int panono);
	ArrayList<PanoDayPhotoVO> getPanodayPhoto(int panodayno);

	void savePanoReply(PanoReplyVO panoReply);
	ArrayList<PanoReplyVO> getPanoReply(int panono);
	void deletereply(int replyno);
	
	void deletePanoDayPhoto(int panoDayPhotoNo);
	void deletePanoDayPhotobyPanodayNo(int panoDayNo);
	void deletePanoDay(int panoDayNo);
	void deletePanorama(int panoNo);
	
	void movephotoTotemp (HashMap<String, Object> map);

	void updatePanno(PanoramaVO panorama);
}
