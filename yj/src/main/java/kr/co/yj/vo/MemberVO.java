package kr.co.yj.vo;

public class MemberVO {

	private int no;
	private String email;
	private String name;
	private String password;
	private String birth;
	private String gender;
	
	
	public MemberVO() {
		super();
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	@Override
	public String toString() {
		return "MemberVO [no=" + no + ", email=" + email + ", name=" + name + ", password=" + password + ", birth="
				+ birth + ", gender=" + gender + "]";
	}
	
	
	
}
