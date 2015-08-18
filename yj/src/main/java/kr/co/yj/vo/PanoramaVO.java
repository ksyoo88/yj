package kr.co.yj.vo;

import java.util.ArrayList;
import java.util.Date;

import kr.co.yj.security.MemberDetail;

public class PanoramaVO {
	
	private int panoNo;
	private MemberDetail member;
	private String panoTitle;
	private int panoLike;
	private Date panoRegdate;
	private ArrayList<PanoDayVO> panodays;
	private ArrayList<PanoReplyVO> replys;
	private String likecheck;
	private int panodayCnt;
	
	
	
	
	
	public int getPanodayCnt() {
		return panodayCnt;
	}
	public void setPanodayCnt(int panodayCnt) {
		this.panodayCnt = panodayCnt;
	}
	public String getLikecheck() {
		return likecheck;
	}
	public void setLikecheck(String likecheck) {
		this.likecheck = likecheck;
	}
	public ArrayList<PanoReplyVO> getReplys() {
		return replys;
	}
	public void setReplys(ArrayList<PanoReplyVO> replys) {
		this.replys = replys;
	}
	public ArrayList<PanoDayVO> getPanodays() {
		return panodays;
	}
	public void setPanodays(ArrayList<PanoDayVO> panodays) {
		this.panodays = panodays;
	}
	public int getPanoNo() {
		return panoNo;
	}
	public void setPanoNo(int panoNo) {
		this.panoNo = panoNo;
	}
	public MemberDetail getMember() {
		return member;
	}
	public void setMember(MemberDetail member) {
		this.member = member;
	}
	public String getPanoTitle() {
		return panoTitle;
	}
	public void setPanoTitle(String panoTitle) {
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
