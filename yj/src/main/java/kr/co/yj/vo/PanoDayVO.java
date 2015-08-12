package kr.co.yj.vo;

public class PanoDayVO {
	
	private PanoramaVO panorama;
	private int no ;
	private int dayCnt;
	private Place place;
	private String dayMemo;
	
	
	public PanoramaVO getPanorama() {
		return panorama;
	}
	public void setPanorama(PanoramaVO panorama) {
		this.panorama = panorama;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getDayCnt() {
		return dayCnt;
	}
	public void setDayCnt(int dayCnt) {
		this.dayCnt = dayCnt;
	}
	public Place getPlace() {
		return place;
	}
	public void setPlace(Place place) {
		this.place = place;
	}
	public String getDayMemo() {
		return dayMemo;
	}
	public void setDayMemo(String dayMemo) {
		this.dayMemo = dayMemo;
	}
	
	

}
