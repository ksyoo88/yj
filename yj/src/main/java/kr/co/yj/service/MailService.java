package kr.co.yj.service;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailService {
	
	@Autowired
	JavaMailSender mailSender;
	
public void sendSimpleMail(String subject, String text, String from, String to) {
		
		// 간단한 메일정보를 담을 수 있는 SimpleMailMessage객체 만들기
		SimpleMailMessage message = new SimpleMailMessage();
		message.setSubject(subject);
		message.setText(text);
		message.setFrom(from);
		message.setTo(to);
		mailSender.send(message);
	}
	
	public void sendHtmlMail(final String from,  final String to, final String subject, final String htmlText) throws Exception {

        MimeMessage message = mailSender.createMimeMessage();  
        MimeMessageHelper helper = new MimeMessageHelper(message, true , "UTF-8");  // 마지막 encoding 값 안주면 default encoding 으로 바뀐다ㅏ.

        helper.setFrom(from);
        helper.setTo(to);
        helper.setSubject(subject);
        helper.setText(htmlText , true); // html 로 보낼려면 true 줘야함....
        
        System.out.println("body:" + htmlText);
		mailSender.send(message);
	}
	
	public void sendHtmlMessage(String subject, String htmlText, String from, String to) throws MessagingException {
		
		MimeMessage message = mailSender.createMimeMessage();
		message.setSubject(subject);
		// setText(html텍스트, 캐릭터셋, 텍스트타입)
		message.setText(htmlText, "UTF-8", "html");
		message.setFrom(new InternetAddress(from));
		// 메일 받는 사람 설정하기
		// addRecipient(수신자타입, 받는사람 주소)
		// RecipientType.TO 받는 사람
		// RecipientType.CC 참조
		// RecipientType.BCC 숨은참조
		message.addRecipient(RecipientType.TO, new InternetAddress(to));
		
		mailSender.send(message);
		
		
		
	}
}
