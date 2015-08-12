package kr.co.yj.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.yj.vo.Panorama;

@Controller
public class MypageController {
	@RequestMapping("/mypage.do")
	public String memberBlog(Model model,HttpSession session) {
		return "/mypage/mypage.tiles";
	}
	
	@RequestMapping("/loadpano.json")
	@ResponseBody
	public ArrayList<Panorama> loadpano() {
		ArrayList<Panorama> list = new ArrayList<Panorama>();
		Panorama pano = new Panorama();
		pano.setTitle("aaaaaa");
		list.add(pano);
		System.out.println("sadfsadfasdf");
		return list;
	}
	@RequestMapping("/loadplan.json")
	@ResponseBody
	public ArrayList<Panorama> loadplan() {
		ArrayList<Panorama> list = new ArrayList<Panorama>();
		return list;
	}
}
