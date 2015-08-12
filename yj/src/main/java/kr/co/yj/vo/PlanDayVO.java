package kr.co.yj.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class PlanDayVO {

	private int no;
	private PlanVO plan;
	private Date dayDate;
	private Place place;
	
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

	public String getStrDayDate(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 (E)");
		return sdf.format(dayDate);
	}
	
	public Place getPlace() {
		return place;
	}

	public void setPlace(Place place) {
		this.place = place;
	}	
	
	
	
}
