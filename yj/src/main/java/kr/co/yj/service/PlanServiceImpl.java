package kr.co.yj.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import kr.co.yj.dao.PlaceDao;
import kr.co.yj.dao.PlanDao;
import kr.co.yj.vo.Place;
import kr.co.yj.vo.PlaceAreaPointVO;
import kr.co.yj.vo.PlanDayVO;
import kr.co.yj.vo.PlanVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PlanServiceImpl implements PlanService {
	
	@Autowired 
	PlaceDao placeDao;
	
	@Autowired
	PlanDao planDao;
	
	@Override
	public ArrayList<Place> getMapOnThePlaces(PlaceAreaPointVO placeAreaPoint) {
		
		return placeDao.getMapOnThePlaces(placeAreaPoint);
		
	}
	
	@Override
	public int insertPlan(PlanVO planVo, String[] contentid, String[] dayDate) throws ParseException {

		planVo.setStartDayDate( strToDate( planVo.getStartDay() ) );
		planVo.setFinishDayDate( strToDate( planVo.getFinishDay() ) );
		
		int planSeq = planDao.getPlanSeq();
		planVo.setNo(planSeq);		
		planDao.insertPlan(planVo);
		
		
		Date tempDate = new Date();
		
		for(int i=0; i<dayDate.length; i++){
			
			
			PlanDayVO planDayVo = new PlanDayVO();
		
			int planDayseq = planDao.getPlanDaySeq();
			planDayVo.setNo(planDayseq);
			planDayVo.setDayDate(strToDate(dayDate[i]));
			planDayVo.setPlan(planVo);
			Place place = new Place();
			place.setContentid(contentid[i]);
			planDayVo.setPlace(place);
			
			planDao.insertPlanDay(planDayVo);	
		}		
		
		return planSeq;
		
	}
	
	public Date strToDate(String strDate) throws ParseException {

		SimpleDateFormat transFormat = new SimpleDateFormat( "yyyy년 MM월 dd일 (E)");
		Date date = transFormat.parse(strDate);
		System.out.println(date);
		return date;
		
	}
	
	@Override
	public PlanVO getPlanByNo(int no) {
		
		PlanVO tempPlanVo = planDao.getPlanByNo(no);
		
		return tempPlanVo;
	}
	
	@Override
	public ArrayList<PlanDayVO> getPlanDayByNo(int no) {
		
		ArrayList<PlanDayVO> tempPlanDayVo = planDao.getPlanDayByNo(no); 
		
		for(PlanDayVO temp : tempPlanDayVo) {
			
			String contentid = temp.getPlace().getContentid();
			temp.setPlace( placeDao.getPlaceByContentid(contentid) );
			//System.out.println( temp.getPlace().getTitle() );
		}
		
		return tempPlanDayVo;
	}
	
}
