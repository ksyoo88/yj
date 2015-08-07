package kr.co.yj.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.yj.dao.MemberDao;
import kr.co.yj.util.Md5Util;
import kr.co.yj.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDao dao;
	
	@Autowired
	JavaMailSender mailSender;
	
	
	//서비스
	
	public void addMember(MemberVO mem) {
		
		String password=mem.getPassword();
		if(mem.getGender().equals("m")){
			mem.setPhoto("male.jpg");
		}else{
			mem.setPhoto("female.jpg");
		}
		String pwd=Md5Util.md5Text(password);
		mem.setPassword(pwd);
		dao.addMember(mem);
		
	}
	@Override
	public MemberVO getMembyEmail(String email) {
		
		MemberVO mem=dao.getMemberbyemail(email);
		
		return mem;
	}
	
	public String changePwd(MemberVO mem) {
		
		return dao.getMemberPwd(mem);
	}
	
	@Override
	public String modifyinfo(String name, String pwd,String email) {
		MemberVO mem= new MemberVO();
		mem.setEmail(email);
		mem.setName(name);
		String md5pwd=Md5Util.md5Text(pwd);
		mem.setPassword(md5pwd);
		dao.modifyinfo(mem);
		return md5pwd;
	}
	

	@Override
	public void sendemail(String to) {
		//간단한 메일정보를 담을수이는 simpleMailMessage 객체 만들디
				SimpleMailMessage message = new SimpleMailMessage();
				/*message.setSubject(subject);
				message.setText(text);
				message.setFrom(from);*/
				MemberVO mem = dao.getMemberbyemail(to);
				
			
					String pwd=changePwd(mem);
					String password=Md5Util.md5Text(pwd);
					mem.setPassword(password);
					dao.updatePwd(mem);
					
					message.setFrom("yogijogi3@gmail.com");
					message.setSubject("비번입니다.");
					message.setTo(to);
					message.setText("바뀐 비번은 [ "+pwd+" ] 입니다.");
					
					mailSender.send(message);
			
	}
	
	public ArrayList<String> getTemPhoto(String email) {
		
		ArrayList<String> photos =dao.getTemPhoto(email);
		
		return photos;
	}
	
	public void delTemPhoto(String email) {
		dao.delTemPhoto(email);
	}
	
	public boolean checkEmail(String email){
		MemberVO member=dao.getMemberbyemail(email);
		
		if(member==null){
			
			return false;
		}else{
			
			return true;
		}
		
	}
	
	@Override
	public void saveTempPhoto(MultipartFile mf, String email,int day) throws Exception {
		String filename=null;
		System.out.println("service");
		if(!mf.isEmpty()){
			filename = mf.getOriginalFilename();
			filename=System.currentTimeMillis()+filename;
			String contentType =mf.getContentType();
			long filesize = mf.getSize();
			
			byte[] filedata = mf.getBytes();
			System.out.println("filename:" + filename);
			File file = new File("C:/spring_study/git/yj/src/main/webapp/resources/images/temphoto/"+filename);
			 
			FileCopyUtils.copy(filedata, file);
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("filename", filename);
		map.put("day", day);
		
		dao.addtempphoto(map);
		
	}
	
	@Override
	public String profileup(MultipartFile mf,String email) throws Exception {
		String filename=null;
		if(!mf.isEmpty()){
			filename = mf.getOriginalFilename();
			filename=System.currentTimeMillis()+filename;
			String contentType =mf.getContentType();
			long filesize = mf.getSize();
			
			byte[] filedata = mf.getBytes();
			File file = new File("C:/spring_study/git/yj/src/main/webapp/resources/images/profilephoto/",filename);
			 
			FileCopyUtils.copy(filedata, file);
		}
		
		MemberVO mem = new MemberVO();
		mem.setEmail(email);
		mem.setPhoto(filename);
		dao.updateprofile(mem);
		
		return filename;
		
	}
	
	
	@Override
	public MemberVO loginCheck(String email, String pwd) {
		
		MemberVO member=dao.getMemberbyemail(email);
		
		String md5pwd=Md5Util.md5Text(pwd);
		
	
		System.out.println("pass:"+member.getPassword());
		System.out.println(pwd);
		System.out.println("pass:"+md5pwd);
		
		
		if(member==null){
			return null;
		}else{
			if(member.getPassword().equals(md5pwd)){
				
				
				return member;
			}else{
				
				return null;
			}
		}
		
	}
	
	
	
}
