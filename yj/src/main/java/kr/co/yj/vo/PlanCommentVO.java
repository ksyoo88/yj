package kr.co.yj.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import kr.co.yj.security.MemberDetail;

public class PlanCommentVO {

	private int no;
	private MemberDetail member;
	private String content;
	private PlanVO plan;
	private Date commentDate;
		
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public PlanVO getPlan() {
		return plan;
	}
	public void setPlan(PlanVO plan) {
		this.plan = plan;
	}	
	public Date getCommentDate() {
		return commentDate;
	}
	public String getStrCommentDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("(yyyy.MM.dd) hh:mm:ss");
		if (commentDate == null) {
			return "";
		}		
		return sdf.format(commentDate);
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}	
}
