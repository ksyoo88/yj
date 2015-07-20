package kr.co.yg.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.yg.dao.EmployeeDao;
import kr.co.yg.vo.Employee;

@Controller
public class EmployeeController {
	
	@Autowired
	EmployeeDao empDao;
	
	@RequestMapping("/test.do")
	public String getEmployees(Model model) {
		
		ArrayList<Employee> empList = empDao.getEmployees();
		
		model.addAttribute("empList", empList);
		
		return "/WEB-INF/views/list.jsp";
	}
	
}
