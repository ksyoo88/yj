package kr.co.yj.vo;

import java.util.Date;

public class PlanDayVO {

	private PlanVO plan;
	private int no;
	private Date dayDate;
	
	public PlanDayVO () {}

	public PlanVO getPlan() {
		return plan;
	}

	public void setPlan(PlanVO plan) {
		this.plan = plan;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public Date getDayDate() {
		return dayDate;
	}

	public void setDayDate(Date dayDate) {
		this.dayDate = dayDate;
	}	
	
}
