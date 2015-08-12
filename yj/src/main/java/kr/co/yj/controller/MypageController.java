package kr.co.yj.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.yj.vo.PanoramaVO;

@Controller
public class MypageController {
	@RequestMapping("/mypage.do")
	public String memberBlog(Model model,HttpSession session) {
		return "/mypage/mypage.tiles";
	}
	
	@RequestMapping("/loadpano.json")
	@ResponseBody
	public ArrayList<PanoramaVO> loadpano() {
		ArrayList<PanoramaVO> list = new ArrayList<PanoramaVO>();
		PanoramaVO pano = new PanoramaVO();
		pano.setTitle("aaaaaa");
		list.add(pano);
		System.out.println("sadfsadfasdf");
		return list;
	}
	@RequestMapping("/loadplan.json")
	@ResponseBody
	public ArrayList<PanoramaVO> loadplan() {
		ArrayList<PanoramaVO> list = new ArrayList<PanoramaVO>();
		return list;
	}
}
