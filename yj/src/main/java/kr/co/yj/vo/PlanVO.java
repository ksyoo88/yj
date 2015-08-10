package kr.co.yj.vo;

import java.util.Date;

public class PlanVO {

	private int no;
	private MemberVO member;
	private String title;
	private int trevelCnt;
	private String startDay;
	private String finishDay;
	private Date startDayDate;
	private Date finishDayDate;
	private int likeCnt;
	
	public PlanVO(){}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public MemberVO getMember() {
		return member;
	}

	public void setMember(MemberVO member) {
		this.member = member;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getTrevelCnt() {
		return trevelCnt;
	}

	public void setTrevelCnt(int trevelCnt) {
		this.trevelCnt = trevelCnt;
	}

	public String getStartDay() {
		return startDay;
	}

	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}

	public String getFinishDay() {
		return finishDay;
	}

	public void setFinishDay(String finishDay) {
		this.finishDay = finishDay;
	}

	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}

	public Date getStartDayDate() {
		return startDayDate;
	}

	public void setStartDayDate(Date startDayDate) {
		this.startDayDate = startDayDate;
	}

	public Date getFinishDayDate() {
		return finishDayDate;
	}

	public void setFinishDayDate(Date finishDayDate) {
		this.finishDayDate = finishDayDate;
	}

	@Override
	public String toString() {
		return "PlanVO [no=" + no + ", member=" + member + ", title=" + title
				+ ", trevelCnt=" + trevelCnt + ", startDay=" + startDay
				+ ", finishDay=" + finishDay + ", startDayDate=" + startDayDate
				+ ", finishDayDate=" + finishDayDate + ", likeCnt=" + likeCnt
				+ "]";
	}	
	
	
	
}
