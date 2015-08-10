package kr.co.yj.dao;

import kr.co.yj.vo.PlanDayVO;
import kr.co.yj.vo.PlanVO;

public interface PlanDao {

	void insertPlan(PlanVO planVo);
	int getPlanSeq();
	
	int getPlanDaySeq();
	void insertPlanDay(PlanDayVO planDayVo);
	
	PlanVO getPlanByNo(int no);
	
	
}
