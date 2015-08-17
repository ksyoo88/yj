package kr.co.yj.dao;

import java.util.ArrayList;

import kr.co.yj.vo.BookmarkVO;
import kr.co.yj.vo.PlanCommentVO;
import kr.co.yj.vo.PlanDayVO;
import kr.co.yj.vo.PlanVO;

public interface PlanDao {

	void insertPlan(PlanVO planVo);
	int getPlanSeq();
	
	int getPlanDaySeq();
	void insertPlanDay(PlanDayVO planDayVo);
	
	PlanVO getPlanByNo(int no);
	ArrayList<PlanDayVO> getPlanDayByNo(int no);
	
	int getPlanComment();
	void insertComment(PlanCommentVO planCommentVo);
	void deleteComment(int no);
	ArrayList<PlanCommentVO> getPlanCommentByPlanNo(int no);
	
	void insertBookmark(BookmarkVO bookmarkVo);
	ArrayList<BookmarkVO> getBookmarkByMemberNo(int no);
	
}
