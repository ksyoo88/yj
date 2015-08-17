package kr.co.yj.service;

import java.text.ParseException;
import java.util.ArrayList;

import kr.co.yj.vo.BookmarkVO;
import kr.co.yj.vo.Place;
import kr.co.yj.vo.PlaceAreaPointVO;
import kr.co.yj.vo.PlanCommentVO;
import kr.co.yj.vo.PlanDayVO;
import kr.co.yj.vo.PlanVO;

public interface PlanService {

	ArrayList<Place> getMapOnThePlaces(PlaceAreaPointVO placeAreaPoint);
	
	int insertPlan(PlanVO planVO, String[] contentid, String[] days ) throws ParseException;
	
	PlanVO getPlanByNo(int no);
	
	ArrayList<PlanDayVO> getPlanDayByNo(int no);
	
	void insertComment(PlanCommentVO planCommentVo);
	
	void deleteComment(int no);
	
	ArrayList<PlanCommentVO> getPlanCommentByPlanNo(int no);
	
	Place getPlaceByContentId(String contentid);
	
	void insertBookmark(BookmarkVO bookmarkVo);
	
	ArrayList<BookmarkVO> getBookmarkByMemberNo(int no);
	
	ArrayList<Place> getTopPlace(String category);
}
