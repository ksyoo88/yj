package kr.co.yj.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import kr.co.yj.dao.MemberDao;
import kr.co.yj.dao.PlaceDao;
import kr.co.yj.dao.PlanDao;
import kr.co.yj.security.MemberDetail;
import kr.co.yj.vo.BookmarkVO;
import kr.co.yj.vo.Place;
import kr.co.yj.vo.PlaceAreaPointVO;
import kr.co.yj.vo.PlanCommentVO;
import kr.co.yj.vo.PlanDayVO;
import kr.co.yj.vo.PlanVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PlanServiceImpl implements PlanService {
	
	@Autowired 
	PlaceDao placeDao;
	
	@Autowired
	PlanDao planDao;
	
	@Autowired
	MemberDao memberDao;
	
	@Override
	public ArrayList<Place> getMapOnThePlaces(PlaceAreaPointVO placeAreaPoint) {
		
		return placeDao.getMapOnThePlaces(placeAreaPoint);
		
	}
	
	@Override
	public int insertPlan(PlanVO planVo, String[] contentid, String[] dayDate) throws ParseException {

		planVo.setStartDayDate( strToDate( planVo.getStartDay() ) );
		planVo.setFinishDayDate( strToDate( planVo.getFinishDay() ) );

		// mysql 시 삭제
		int planSeq = planDao.getPlanSeq();
		planVo.setNo(planSeq);		
		
		planDao.insertPlan(planVo);
		//int planSeq=planDao.insertPlan2(planVo);
		
		
		Date tempDate = new Date();
		
		for(int i=0; i<dayDate.length; i++){
			
			
			PlanDayVO planDayVo = new PlanDayVO();
			// mysql 시 삭제
			int planDayseq = planDao.getPlanDaySeq();
			planDayVo.setNo(planDayseq);
			///
			planDayVo.setDayDate(strToDate(dayDate[i]));
			planDayVo.setPlan(planVo);
			Place place = new Place();
			place.setContentid(contentid[i]);
			planDayVo.setPlace(place);
			
			planDao.insertPlanDay(planDayVo);	
			//int planDayseq =planDao.insertPlanDay2(planDayVo);	
		}		
		
		return planSeq;
		
	}
	
	public Date strToDate(String strDate) throws ParseException {

		SimpleDateFormat transFormat = new SimpleDateFormat( "yyyy년 MM월 dd일 (E)");
		Date date = transFormat.parse(strDate);
		System.out.println(date);
		return date;
		
	}
	
	@Override
	public PlanVO getPlanByNo(int no) {
		
		PlanVO tempPlanVo = planDao.getPlanByNo(no);
		
		return tempPlanVo;
	}
	
	@Override
	public ArrayList<PlanDayVO> getPlanDayByNo(int no) {
		
		ArrayList<PlanDayVO> tempPlanDayVo = planDao.getPlanDayByNo(no); 
		
		for(PlanDayVO temp : tempPlanDayVo) {
			
			String contentid = temp.getPlace().getContentid();
			temp.setPlace( placeDao.getPlaceByContentid(contentid) );
			//System.out.println( temp.getPlace().getTitle() );
		}
		
		return tempPlanDayVo;
	}
	
	@Override
	public void insertComment(PlanCommentVO planCommentVo) {
		int seq = planDao.getPlanComment();
		planCommentVo.setNo(seq);
		planDao.insertComment(planCommentVo);
	}
	
	@Override
	public ArrayList<PlanCommentVO> getPlanCommentByPlanNo(int no) {
		ArrayList<PlanCommentVO> comments = planDao.getPlanCommentByPlanNo(no);
		
		for(PlanCommentVO c : comments){
			int memNo = c.getMember().getNo();
			c.setMember(memberDao.getMemberbyNo(memNo));
		}		
		return comments;
	}
	
	@Override
	public void deleteComment(int no) {

		planDao.deleteComment(no);
	}
	
	@Override
	public Place getPlaceByContentId(String contentid) {
		
		Place tempPlace = placeDao.getPlaceByContentid(contentid);
		
		return tempPlace;
		
	}
	
	@Override
	public void insertBookmark(BookmarkVO bookmarkVo) {
		
		planDao.insertBookmark(bookmarkVo);
		
	}
	
	@Override
	public ArrayList<BookmarkVO> getBookmarkByMemberNo(int no) {
		
		ArrayList<BookmarkVO> bookmarks = planDao.getBookmarkByMemberNo(no);
		
		for( BookmarkVO mark : bookmarks ){
			
			String contentid = mark.getPlace().getContentid();
			Place place = placeDao.getPlaceByContentid(contentid);
			mark.setPlace(place);
			
		}
		
		return bookmarks;
	}
	
	@Override
	public ArrayList<Place> getTopPlace(String category) {
		
		ArrayList<Place> topPlaces = placeDao.getTopPlace(category);
		
		return topPlaces;		
		
	}
	
	@Override
	public void deletePlanByPlanNo(int planNo) {

		planDao.deletePlanCommentByPlanNo(planNo);
		
		planDao.deletePlanDayByPlanNo(planNo);
		
		planDao.deletePlanByPlanNo(planNo);
		
	}
	
	@Override
	public void insertLike(HashMap<String, Integer> likeMap) {

		planDao.insertLike(likeMap);
		
		int planNo = likeMap.get("planNo") ;
		int likeCnt = planDao.getLikeCnt(planNo);
		
		HashMap<String, Integer> updateLike = new HashMap<String, Integer>();
		updateLike.put("planNo", planNo);
		updateLike.put("likeCnt", likeCnt);
		
		planDao.planLikeCntUpdate(updateLike);
		
	}
	@Override
	public void deleteLike(HashMap<String, Integer> likeMap) {
		
		planDao.deleteLike(likeMap);
		
		int planNo = likeMap.get("planNo") ;
		int likeCnt = planDao.getLikeCnt(planNo);
		
		HashMap<String, Integer> updateLike = new HashMap<String, Integer>();
		updateLike.put("planNo", planNo);
		updateLike.put("likeCnt", likeCnt);
		
		planDao.planLikeCntUpdate(updateLike);
		
	}
	
	@Override
	public String checkedLike(HashMap<String, Integer> likeMap) {

		String check = planDao.likeCheckByMemNoPlanNo(likeMap);
		
		return check;
	}
	
	@Override
	public void deleteBookmark(int bookmarkNo) {
		
		planDao.deleteBookmark(bookmarkNo);
		
	}
	
	
	
}
