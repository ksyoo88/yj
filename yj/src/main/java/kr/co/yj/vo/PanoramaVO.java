package kr.co.yj.vo;

import java.util.Date;

public class PanoramaVO {
	
	private int panoNo;
	private MemberVO member;
	private int panoTitle;
	private int panoLike;
	private Date panoRegdate;
	
	
	
	public int getPanoNo() {
		return panoNo;
	}
	public void setPanoNo(int panoNo) {
		this.panoNo = panoNo;
	}
	public MemberVO getMember() {
		return member;
	}
	public void setMember(MemberVO member) {
		this.member = member;
	}
	public int getPanoTitle() {
		return panoTitle;
	}
	public void setPanoTitle(int panoTitle) {
		this.panoTitle = panoTitle;
	}
	public int getPanoLike() {
		return panoLike;
	}
	public void setPanoLike(int panoLike) {
		this.panoLike = panoLike;
	}
	public Date getPanoRegdate() {
		return panoRegdate;
	}
	public void setPanoRegdate(Date panoRegdate) {
		this.panoRegdate = panoRegdate;
	}
	
	
	
	

}
