package kr.co.yj.vo;

import kr.co.yj.security.MemberDetail;

public class BookmarkVO {
	
	private int no;
	private MemberDetail member;
	private Place place;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public MemberDetail getMember() {
		return member;
	}
	public void setMember(MemberDetail member) {
		this.member = member;
	}
	public Place getPlace() {
		return place;
	}
	public void setPlace(Place place) {
		this.place = place;
	}
	
	

}
