package kr.co.yj.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.yj.dao.TogetherDao;
import kr.co.yj.service.TogetherService;

@Controller
public class TogetherController {

	@Autowired
	TogetherService togetherService;
	
	@RequestMapping("/together.do")
	public String togetherSns(Model model,
			@RequestParam(value="type", required=false, defaultValue="pano")String type,
			@RequestParam(value="currPage", required=false, defaultValue="1")int currPage,
			@RequestParam(value="order", required=false, defaultValue="desc")String order) {
		
		model.addAttribute("currPage", currPage);
		
		if("pano".equals(type)) {
			ArrayList<HashMap<String, String>> list = togetherService.getPanoList(currPage, order);
			int totalCnt = togetherService.getPanoTotalCnt();
			model.addAttribute("list", list);
			model.addAttribute("totalCnt", totalCnt);
			return "/together/together_pano.tiles";
		} else if("plan".equals(type)){
			ArrayList<HashMap<String, String>> list = togetherService.getPlanList(currPage, order);
			int totalCnt = togetherService.getPlanTotalCnt();
			model.addAttribute("list", list);
			model.addAttribute("totalCnt", totalCnt);
			return "/together/together_plan.tiles";
		}
		return "/together/together_pano.tiles";
	}
	
}
