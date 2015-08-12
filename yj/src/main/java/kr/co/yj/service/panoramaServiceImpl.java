package kr.co.yj.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.yj.dao.MemberDao;
import kr.co.yj.dao.PanoramaDao;
import kr.co.yj.dao.PlaceDao;
import kr.co.yj.vo.PanoDayPhotoVO;
import kr.co.yj.vo.PanoDayVO;
import kr.co.yj.vo.PanoramaVO;
import kr.co.yj.vo.Place;

@Service
public class panoramaServiceImpl implements PanoramaService {

	@Autowired
	PanoramaDao dao;
	
	@Autowired
	MemberDao memberdao;
	@Autowired
	PlaceDao placedao;
	
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
	@Override
	public int panolike(int memno, int panono, boolean likecheck) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memno", memno);
		map.put("panono", panono);
		String check=dao.likecheck(map);
		int panolikecnt=dao.panolikecnt(panono);
		if(check.equals("T")){
			dao.likedelete(map);
			
			map.put("newpanolike", panolikecnt-1);
			dao.updatelikecnt(map);
		}else{
			dao.likelisert(map);
			
			map.put("newpanolike", panolikecnt+1);
			dao.updatelikecnt(map);
		}
		
		int newpanolikecnt=dao.panolikecnt(panono);
		
		return newpanolikecnt;
		
	}
	@Override
	public PanoramaVO getPanorama(int panono) {
		
		PanoramaVO panorama=dao.getPanorama(panono);
		int memno=panorama.getMember().getNo();
		panorama.setMember(memberdao.getMemberbyNo(memno)); 
		return panorama;
	}
	
	@Override
	public ArrayList<PanoDayVO> getPanoday(int panono) {
		ArrayList<PanoDayVO> panodayList = dao.getPanoday(panono);
		for(PanoDayVO panoday : panodayList){
			System.out.println(panoday.toString());
			
			
			if(panoday.getPlace()==null){
				System.out.println("널");
				Place place = null;
				panoday.setPlace(place); 
			}else{
				String contentid=panoday.getPlace().getContentid();
				System.out.println("노널");
				panoday.setPlace(placedao.getPlaceByContentid(contentid)); 
				
			}
		}
		return panodayList;
	}
	
	@Override
	public ArrayList<PanoDayPhotoVO> getPanodayPhoto(int panodayno) {
		ArrayList<PanoDayPhotoVO> panoDayPhotoList = dao.getPanodayPhoto(panodayno);
		
		return panoDayPhotoList;
	}
	
}
