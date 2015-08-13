package kr.co.yj.vo;

import java.util.Date;

public class PanoReplyVO {
	private int panoReplyNo;
	private int panoNo;
	private MemberVO member;
	private Date date;
	private String reply;
	
	
	
	public int getPanoReplyNo() {
		return panoReplyNo;
	}
	public void setPanoReplyNo(int panoReplyNo) {
		this.panoReplyNo = panoReplyNo;
	}
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	
	

}
