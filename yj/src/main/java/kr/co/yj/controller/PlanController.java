package kr.co.yj.controller;

import java.lang.reflect.Member;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import kr.co.yj.security.MemberDetail;
import kr.co.yj.service.PlanService;
import kr.co.yj.service.PlanServiceImpl;
import kr.co.yj.vo.BookmarkVO;
import kr.co.yj.vo.MemberVO;
import kr.co.yj.vo.Place;
import kr.co.yj.vo.PlaceAreaPointVO;
import kr.co.yj.vo.PlanCommentVO;
import kr.co.yj.vo.PlanDayVO;
import kr.co.yj.vo.PlanVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

@Controller
public class PlanController {
	
	@Autowired
	private PlanServiceImpl planService;
	
	@Autowired
	private MappingJackson2JsonView jsonView;

	@RequestMapping("/plan.do")
	public ModelAndView planIndex(@RequestParam(value="contentid",required=false)String contentid){	
		
		ModelAndView mav = new ModelAndView();
		ArrayList<Place> topPlaces = planService.getTopPlace("ALL");
		
		mav.addObject("topPlaces", topPlaces);
				
		if ( contentid != null) {
			Place place = planService.getPlaceByContentId(contentid);		
			mav.addObject("place", place );
		}
		
		mav.setViewName("/plan/plan.tiles");
		
		return mav;
		
	}
	@RequestMapping("/rightPlace.do")
	public ModelAndView rightPlace(@RequestParam("top")String top) {
		
		ModelAndView mav = new ModelAndView();
		
		if(!top.equals("Bookmark")){
			ArrayList<Place> topPlace = planService.getTopPlace(top);
			mav.addObject("topPlace",topPlace);
		}
		
		mav.setView(jsonView);
		
		return mav;
	}
	
	@RequestMapping("/insertBookmark.do")
	public ModelAndView bookmarkInsert(HttpSession session,
								 @RequestParam("contentid")String contentid) {
		
		MemberDetail memberVo = (MemberDetail)session.getAttribute("member");

		Place tempPlace = new Place();
		tempPlace.setContentid(contentid);
		
		BookmarkVO bookmarkVo = new BookmarkVO();
		bookmarkVo.setMember(memberVo);
		bookmarkVo.setPlace(tempPlace);
		
		planService.insertBookmark(bookmarkVo);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setView(jsonView);
		
		return mav;
	}
	
	@RequestMapping("/planinsert.do") 
	public String planSave(PlanVO planVo ,
			                     @RequestParam("day")String[] dayDate,
			                     @RequestParam("place")String[] contentid,
			                     HttpSession session) throws ParseException {
		
		MemberDetail memberVo = (MemberDetail)session.getAttribute("member");
		
		
		planVo.setMember(memberVo);
		
		
		int planNo = planService.insertPlan(planVo, contentid, dayDate);		

		return "redirect:/plandetail.do?no="+planNo;
		
	}
	
	@RequestMapping("/planDelete.do")
	public String planDelete(@RequestParam("planNo")int planNo){
		System.out.println(planNo);
		planService.deletePlanByPlanNo(planNo);
		
		return "redirect:/together.do";
	}
	

	@RequestMapping("/plandetail.do")
	public ModelAndView planDetail(@RequestParam("no")int no){
		
		System.out.println("번호가 오면 된다. : "+no );
		
		ModelAndView mav = new ModelAndView();
		
		PlanVO plan = planService.getPlanByNo(no);
		
		ArrayList<PlanDayVO> planDay = planService.getPlanDayByNo(no);
		ArrayList<PlanCommentVO> planComment = planService.getPlanCommentByPlanNo(no);
		
		mav.addObject("count", 0);
		mav.addObject("plan", plan );
		mav.addObject("planDay", planDay);
		mav.addObject("planComment",planComment);
		mav.setViewName("/plandetail/plandetail.tiles");
		
		return mav;
		
	}
	
	@RequestMapping("/bookmarkSelect")
	public ModelAndView bookmarkSelect(HttpSession session){
		
		ModelAndView mav = new ModelAndView();
		
		MemberDetail memberVo = (MemberDetail) session.getAttribute("member");
		
		ArrayList<BookmarkVO> bookmarks = planService.getBookmarkByMemberNo(memberVo.getNo());
		
		mav.addObject("bookmarks", bookmarks);		
		
		mav.setView(jsonView);
		
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
		
		
		ModelAndView mav = new ModelAndView();
		
		ArrayList<Place> areaPlaces = planService.getMapOnThePlaces(placeArea);
		mav.addObject("areaPlaces", areaPlaces);
		
		mav.setView(jsonView);
		
		return mav;		
		
	}
	@RequestMapping("/plancommentinsert.do")
	@ResponseBody
	public ModelAndView commentInsert(PlanCommentVO planComment, HttpSession session ){
		
		
		MemberDetail memberVo = (MemberDetail)session.getAttribute("member");
		
		planComment.setMember(memberVo);
		planComment.setCommentDate(new Date());
		
		planService.insertComment(planComment);		
		
		ModelAndView mav = new ModelAndView();		
		
		mav.addObject("comment", planComment);
		
		mav.setView(jsonView);
		
		return mav;
	}
	
	@RequestMapping("/plancommentdelete.do")
	public ModelAndView commentDelete(@RequestParam("no")int no){
	
		ModelAndView mav = new ModelAndView();
		
		planService.deleteComment(no);
		
		mav.setView(jsonView);
		
		return mav;
		
	}
	
	
}
