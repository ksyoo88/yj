package kr.co.yj.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

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
		String pwd=Md5Util.md5Text(password);
		mem.setPassword(pwd);
		dao.addMember(mem);
		
	}
	
	public String changePwd(MemberVO mem) {
		
		return dao.getMemberPwd(mem);
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
	
	public boolean checkEmail(String email){
		MemberVO member=dao.getMemberbyemail(email);
		
		if(member==null){
			
			return false;
		}else{
			
			return true;
		}
		
	}
	
	
}
