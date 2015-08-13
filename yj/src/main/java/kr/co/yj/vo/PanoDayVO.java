package kr.co.yj.vo;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

public class PanoDayVO {
	
	private PanoramaVO panorama;
	private int no ;
	private int dayCnt;
	private Place place;
	private String dayMemo;
	private int photocnt;
	private Date date;
	
	private ArrayList<PanoDayPhotoVO> photos;
	
	public Date getDate() {
		
		Calendar c = Calendar.getInstance(); 
		c.setTime(date); 
		c.add(Calendar.DATE, dayCnt-1);
		return c.getTime();
	}
	
	public void setDate(Date date) {
		this.date = date;
	}
	public ArrayList<PanoDayPhotoVO> getPhotos() {
		return photos;
	}
	public void setPhotos(ArrayList<PanoDayPhotoVO> photos) {
		this.photos = photos;
	}
	public int getPhotocnt() {
		return photocnt;
	}
	public void setPhotocnt(int photocnt) {
		this.photocnt = photocnt;
	}
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
	@Override
	public String toString() {
		return "PanoDayVO [panorama=" + panorama + ", no=" + no + ", dayCnt=" + dayCnt + ", place=" + place
				+ ", dayMemo=" + dayMemo + ", photocnt=" + photocnt + ", date=" + date + ", photos=" + photos + "]";
	}
	
	
	

}
