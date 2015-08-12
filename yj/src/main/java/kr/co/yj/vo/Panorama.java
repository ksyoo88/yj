package kr.co.yj.vo;

import java.util.Date;

public class Panorama {
	private int No;
	private int memNo;
	private String title;
	private String like;
	private Date regdate;
	
	public int getNo() {
		return No;
	}
	public void setNo(int no) {
		No = no;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLike() {
		return like;
	}
	public void setLike(String like) {
		this.like = like;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}
