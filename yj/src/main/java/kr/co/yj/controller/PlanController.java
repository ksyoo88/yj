package kr.co.yj.controller;

import java.text.ParseException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import kr.co.yj.service.PlanServiceImpl;
import kr.co.yj.vo.MemberVO;
import kr.co.yj.vo.Place;
import kr.co.yj.vo.PlaceAreaPointVO;
import kr.co.yj.vo.PlanVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

@Controller
public class PlanController {
	
	@Autowired
	private PlanServiceImpl planService;
	
	@Autowired
	private MappingJackson2JsonView jsonView;

	@RequestMapping("/plan.do")
	public String planIndex(){	
		
		return "/plan/plan.tiles";
		
	}
	
	@RequestMapping("/planinsert.do") 
	public String planSave(PlanVO planVo ,
			                     @RequestParam("day")String[] dayDate,
			                     @RequestParam("place")String[] contentid,
			                     HttpSession session) throws ParseException {
		
		MemberVO memberVo = (MemberVO)session.getAttribute("member");
		planVo.setMember(memberVo);
		
		int planNo = planService.insertPlan(planVo, contentid, dayDate);		

		return "redirect:/plandetail.do?no="+planNo;
		
	}
	
	@RequestMapping("/plandetail.do")
	public ModelAndView planDetail(@RequestParam("no")int no){
		
		System.out.println("번호가 오면 된다. : "+no );
		
		ModelAndView mav = new ModelAndView();
		
		PlanVO plan = planService.getPlanByNo(no);
		mav.addObject("plan", plan );
		mav.setViewName("/plandetail/plandetail.tiles");
		
		return mav;
		
	}
	
	@RequestMapping("/mapSetting.do")
	public ModelAndView mapSetting(@RequestParam("minX")double minX,
								   @RequestParam("maxX")double maxX,
								   @RequestParam("minY")double minY,
								   @RequestParam("maxY")double maxY,
								   @RequestParam( value="cate", required=false )String cate ) {
		
		PlaceAreaPointVO placeArea = new PlaceAreaPointVO();
		
		placeArea.setMapXMax(maxX);
		placeArea.setMapXMin(minX);
		placeArea.setMapYMax(maxY);
		placeArea.setMapYMin(minY);
		placeArea.setCategory(cate);
		
		ArrayList<Place> areaPlaces = planService.getMapOnThePlaces(placeArea);
		System.out.println(areaPlaces);	
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("areaPlaces", areaPlaces);
		
		mav.setView(jsonView);
		
		return mav;		
		
	}
	
}
