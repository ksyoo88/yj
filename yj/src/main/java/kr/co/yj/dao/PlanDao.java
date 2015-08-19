package kr.co.yj.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.yj.vo.BookmarkVO;
import kr.co.yj.vo.PlanCommentVO;
import kr.co.yj.vo.PlanDayVO;
import kr.co.yj.vo.PlanVO;

public interface PlanDao {

	// 일정 저장
	void insertPlan(PlanVO planVo);
	int insertPlan2(PlanVO planVo);
	int getPlanSeq();
	
	// 일정 하루 단위로 정보 
	int getPlanDaySeq();
	void insertPlanDay(PlanDayVO planDayVo);
	int insertPlanDay2(PlanDayVO planDayVo);
	
	PlanVO getPlanByNo(int no);
	ArrayList<PlanDayVO> getPlanDayByNo(int no);
	
	// 뎃글
	int getPlanComment();
	void insertComment(PlanCommentVO planCommentVo);
	void deleteComment(int planNo);
	ArrayList<PlanCommentVO> getPlanCommentByPlanNo(int planNo);
	
	// 북마크 
	void insertBookmark(BookmarkVO bookmarkVo);
	ArrayList<BookmarkVO> getBookmarkByMemberNo(int memNo);
	void deleteBookmark(int bookmark);
	
	// 일정삭제
	void deletePlanCommentByPlanNo(int planNo);
	void deletePlanDayByPlanNo(int planNo);
	void deletePlanByPlanNo(int planNo);
	
	// 일정 좋아요
	String likeCheckByMemNoPlanNo(HashMap<String, Integer> planLike);
	void insertLike(HashMap<String, Integer> planLike);
	void deleteLike(HashMap<String, Integer> planLike);
	int getLikeCnt(int planNo);
	void planLikeCntUpdate(HashMap<String, Integer> likeUpdate);
	
}
