package kr.co.yj.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.yj.dao.MemberDao;
import kr.co.yj.dao.PanoramaDao;
import kr.co.yj.dao.PlaceDao;
import kr.co.yj.security.MemberDetail;
import kr.co.yj.vo.MemberVO;
import kr.co.yj.vo.PanoDayPhotoVO;
import kr.co.yj.vo.PanoDayVO;
import kr.co.yj.vo.PanoReplyVO;
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
	public ArrayList<Place> getLocationTitle(String keyword) {
		
		ArrayList<Place> places=placedao.getLocationbyTitle(keyword);
		
		return places;
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
		
		PanoDayVO panoDay = new PanoDayVO();
		panoDay.setDayMemo(memo);
		panoDay.setDayCnt(day);
		panoDay.setPanoNo(panoseq);
		panoDay.setContantid(ID);
		
		map.put("locaID", ID);
		
		//int panodayseq=dao.selectPano_day_seq();
		//map.put("panodayseq", panodayseq);
		dao.savePanoDay(panoDay);
		int panodayseq =panoDay.getNo();
		
		return panodayseq;
	}
	
	@Override
	public void modifydeletePanoDay(int panoNo) {
		ArrayList<PanoDayVO> panodays =dao.getPanoday(panoNo);
		for(PanoDayVO pd:panodays){
			dao.deletePanoDayPhotobyPanodayNo(pd.getNo());
			dao.deletePanoDay(pd.getNo());
		}
		
		
		
	}
	
	@Override
	public int savePanoTitle(int no, String title,Date to) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);
		map.put("title", title);
		map.put("date", to);
	
		PanoramaVO panorama = new PanoramaVO();
		
		
		panorama.setMemNo(no);
		panorama.setPanoTitle(title);
		panorama.setPanoRegdate(to);

		//int panoseq=dao.selectPano_seq();
		//map.put("panoseq", panoseq);
		//dao.savePanoTitle(panorama);
		
		
		dao.savePanoTitle(panorama);
		return panorama.getPanoNo();
	}
	
	@Override
	public void modifysavePanoTitle(int panoNo, String title, Date to) {
		PanoramaVO panorama = new PanoramaVO();
		
		panorama.setPanoTitle(title);
		panorama.setPanoRegdate(to);
		panorama.setPanoNo(panoNo);
		
		dao.updatePanno(panorama);
		
		
	}
	
	@Override
	public void savePanoPhotobyDay(String email, int day,int panodayseq) {
		HashMap<String, Object> map= new HashMap<String, Object>();
		map.put("email", email);
		map.put("day", day);
		map.put("panodayseq", panodayseq);
		
		ArrayList<String> photonames =dao.gettempphotoname(map);
		for(String photo: photonames){
			map.put("photo", photo);
			dao.insertphotonameTotemphoto(map);
			
		}
		
		//dao.savePanoPhotobyDay(map);
		
		
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
	public String likecheck(int panoNo, int memno) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memno", memno);
		map.put("panono", panoNo);
		String likecheck=dao.likecheck(map);
		
		return likecheck;
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
	
	@Override
	public void savePanoReply(int panono, int memno, String reply) {
		PanoReplyVO panoReply = new PanoReplyVO();
		panoReply.setReply(reply);
		panoReply.setPanoNo(panono);
		MemberDetail member = new MemberDetail();
		member.setNo(memno);
		panoReply.setMember(member);
		
		dao.savePanoReply(panoReply);
	}
	
	@Override
	public ArrayList<PanoReplyVO> getPanoReply(int panono) {
		
		ArrayList<PanoReplyVO> panoreplys = dao.getPanoReply(panono);
		for(PanoReplyVO reply:panoreplys){
			int memno= reply.getMember().getNo();
			reply.setMember(memberdao.getMemberbyNo(memno));
		}
		return panoreplys;
	}
	@Override
	public void deletereply(int replyno) {
		dao.deletereply(replyno);
	}
	
	@Override
	public void deletePanorama(int panoNo) {
		
		ArrayList<PanoDayVO> panodays=dao.getPanoday(panoNo);
		for(PanoDayVO panoday: panodays){
			ArrayList<PanoDayPhotoVO> photos=dao.getPanodayPhoto(panoday.getNo());
			for(PanoDayPhotoVO photo:photos){
				dao.deletePanoDayPhoto(photo.getPanoDayPhoto());
			}
			dao.deletePanoDay(panoday.getNo());
		}
		ArrayList<PanoReplyVO> replys= dao.getPanoReply(panoNo);
		for(PanoReplyVO reply:replys){
			dao.deletereply(reply.getPanoReplyNo());
		}
		dao.deletePanorama(panoNo);
	}
	
	@Override
	public void movetempphoto(int panoNo, String email) {
		ArrayList<PanoDayVO> panodays =dao.getPanoday(panoNo);
		for(PanoDayVO pd : panodays){
			ArrayList<PanoDayPhotoVO> photos= dao.getPanodayPhoto(pd.getNo());
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("MEM_EMAIL", email);
			map.put("PANO_DAY", pd.getDayCnt());
			for(PanoDayPhotoVO pdp : photos){
				map.put("PHOTO_NAME", pdp.getPhoto());
				
				dao.movephotoTotemp(map);
			}
			
		}
	}
	
	@Override
	public Place movelocation(String title) {
		
		ArrayList<Place> places=placedao.getLocationbyTitle(title);
		return places.get(0);
	}
	
}
