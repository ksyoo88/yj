package kr.co.yj.dao;

import java.util.ArrayList;

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
	
	void insertComment(PlanCommentVO planCommentVo);
	ArrayList<PlanCommentVO> getPlanCommentByPlanNo(int no);
	
	
	
}
