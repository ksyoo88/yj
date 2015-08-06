package kr.co.yj.vo;

import java.util.Date;

public class PlanVO {

	private int no;
	private MemberVO member;
	private String title;
	private int trevelCnt;
	private Date startDay;
	private Date finishDay;
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

	public Date getStartDay() {
		return startDay;
	}

	public void setStartDay(Date startDay) {
		this.startDay = startDay;
	}

	public Date getFinishDay() {
		return finishDay;
	}

	public void setFinishDay(Date finishDay) {
		this.finishDay = finishDay;
	}

	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}	
	
}
