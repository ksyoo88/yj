package kr.co.yj.vo;


public class PlanPlaceVO {

	private int no;
	private PlanDayVO planDay;
	private Place place;
	
	public PlanPlaceVO(){}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public PlanDayVO getPlanDay() {
		return planDay;
	}

	public void setPlanDay(PlanDayVO planDay) {
		this.planDay = planDay;
	}

	public Place getPlace() {
		return place;
	}

	public void setPlace(Place place) {
		this.place = place;
	}

	
	
}
