package kr.co.yj.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.yj.dao.EmployeeDao;
import kr.co.yj.vo.Employee;

@Controller
public class MainController {
	
	@Autowired
	EmployeeDao empDao;
	
	@RequestMapping("/main.do")
	public String main(Model model) {
		ArrayList<Employee> empList = empDao.getEmployees();
		
		model.addAttribute("empList", empList);
		model.addAttribute("title", "제목입니다.");
		return "/main/main.tiles";
	}
	
}
