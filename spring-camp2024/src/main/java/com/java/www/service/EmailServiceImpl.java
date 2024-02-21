package com.java.www.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMessage.RecipientType;
import jakarta.servlet.http.HttpSession;

@Service
public class EmailServiceImpl implements EmailService {
	
	//메일전송 객체 - 단순 text발송
	@Autowired JavaMailSender mailSender;
	@Autowired HttpSession session;

	//email 전송
	@Override
	public String mailSend(String email) {
		//이메일 전송
		MimeMessage message = mailSender.createMimeMessage();
		//인증코드 생성
		String pwcode = getCreatKey();
		try {
			message.setSubject("[인증번호] 회원가입 이메일 인증코드 발송","utf-8"); //제목
			String htmlData="<table align='center' style='margin:0 0 0 40px;border:1px #D9D9D9 solid;'>\r\n"
					+ "			<tr>\r\n"
					+ "				<td style='width:618px;height:220px;padding:0;margin:0;vertical-align:top;font-size:0;line-height:0;background:#F9F9F9;'>\r\n"
					+ "					<p style='width:620px;margin:30px 0 0 0;padding:0;text-align:center;'><img src='https://cfm.kt.com/images/v2/layout/gnb-ktlogo.png' alt='비밀번호 찾기를 요청하셨습니다.'/></p>\r\n"
					+ "					<p style='width:620px;margin:10px 0 0 0;padding:0;text-align:center;color:#888888;font-size:12px;line-height:1;'>아래의 인증코드는 회원가입에 필요한 인증코드입니다.</p>\r\n"
					+ "					<p style='width:620px;margin:28px 0 0 0;padding:0;text-align:center;color:#666666;font-size:12px;line-height:1;'><strong>회원가입 인증코드 : <span style='color:#F7703C;line-height:1;'>"+pwcode+"</span></strong></p>\r\n"
					+ "					<p style='width:620px;margin:30px 0 0 0;padding:0;text-align:center;color:#888888;font-size:12px;line-height:1.4;'>회원가입에 필요한 인증코드를 발송해 드렸습니다.<br/>인증코드를 인증번호 입력에 넣고 인증번호 확인 버튼을 클릭해주세요.</p>\r\n"
					+ "				</td>\r\n"
					+ "			</tr>\r\n"
					+ "			</table>	";
			message.setText(htmlData,"utf-8","html");                            //내용
			message.setFrom(new InternetAddress("baamis@naver.com"));         //보낸이
			message.addRecipient(RecipientType.TO, new InternetAddress(email));  //받는이
			mailSender.send(message);                                            //메일발송
			session.setAttribute("email_pwcode", pwcode);
			
		} catch (MessagingException e) {e.printStackTrace();}
		
		//이메일 전송
		System.out.println("(html)이메일 발송완료!!!!");
		return pwcode;
	}
	
	//비밀번호 생성메소드
	public String getCreatKey() {
		String pwcode = "";
		char[] charset = new char[] {
				'0','1','2','3','4','5','6','7','8','9',
				'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'
				};
		int idx = 0;
		for(int i=0;i<6;i++) {
			idx = (int)(Math.random()*36);   //0 ~ 9까지 랜덤숫자 생성
			pwcode += charset[idx];
		}
		System.out.println("이메일인증번호 : "+pwcode);
		return pwcode;
	}

}
