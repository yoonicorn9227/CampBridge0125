package com.java.www.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.java.www.dto.User_campDto;
import com.java.www.mapper.User_campMapper;

import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMessage.RecipientType;
import jakarta.servlet.http.HttpSession;

@Service
public class User_campServiceImpl implements User_campService {

	@Autowired
	User_campMapper userCampMapper;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	JavaMailSender mailSender;
	
	
	
	@Override //로그인
	public User_campDto loginSelect(User_campDto ucdto) {
		User_campDto usercampDto = userCampMapper.loginSelect(ucdto);
		return usercampDto;
	}


	
	@Override //아이디찾기 -name,mail
	public User_campDto idsearch(String name, String email) {
		User_campDto usercampDto = userCampMapper.idsearch(name,email);
		
		return usercampDto;
	}



	@Override //비밀번호찾기 - id,mail
	public String pwsearch(String id, String email) {
		User_campDto usercampDto = userCampMapper.pwsearch(id,email);
		String result = "";
		
		if(usercampDto!=null) {
			result = "success";
			//이메일 발송부분
			System.out.println("이메일발송 프로그램을 진행합니다.");
			String pwcode = getCreateKey();
			System.out.println("pwsearch pwcode : "+pwcode);
			//섹션 저장
			//session.setAttribute("pwsearch_pwcode", pwcode);
			//이메일
			MimeMessage message = mailSender.createMimeMessage();
			try {
				message.setSubject("[안내] 비밀번호찾기 임시비밀번호 안내","utf-8");
				//html코드 가져오기
				String htmlData =getHtmlData(pwcode);
				message.setText(htmlData,"utf-8","html");
				message.setFrom(new InternetAddress("baamis@naver.com")); //보내는 사람
				message.addRecipient(RecipientType.TO, new InternetAddress(email)); //받는 사람
				//메일발송
				mailSender.send(message);
				//패스워드 변경 - update
				userCampMapper.update_pw(id,pwcode);
				System.out.println("이메일 발송이 완료되었습니다.");
				
			} catch (Exception e) {e.printStackTrace();}
		}else { result = "fail";}//이메일 틀려서 이메일발송이 안 됨.
		System.out.println("serviceImpl pw_s result : "+result);
		
		
		return result;
	}
	
	
	//html데이터 생성
		public String getHtmlData(String pwcode) {
			String data = "<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>\r\n"
					+ "<html xmlns='http://www.w3.org/1999/xhtml' lang='ko' xml:lang='ko'>\r\n"
					+ "<head>\r\n"
					+ "<meta http-equiv='Content-Type' content='application/xhtml+xml; charset=utf-8' />\r\n"
					+ "<meta http-equiv='X-UA-Compatible' content='IE=edge' />\r\n"
					+ "<title> 비밀번호 발송 </title>\r\n"
					+ "</head>\r\n"
					+ "<body bgcolor='#FFFFFF' leftmargin='0' topmargin='0' marginwidth='0' marginheight='0' style='margin:0; padding:0; font:normal 12px/1.5 돋움;'>\r\n"
					+ "<table width='700' cellpadding='0' cellspacing='0' align='center'>\r\n"
					+ "<tr>\r\n"
					+ "	<td style='width:700px;height:100px;padding-top:30px;margin:0;vertical-align:top;font-size:0;line-height:0;'>\r\n"
					+ "		<img style='display:block; margin: 0 auto;' src='https://i.ibb.co/m935WZP/logo.png' alt='CampBridge' />					\r\n"
					+ "	</td>\r\n"
					+ "</tr>\r\n"
					+ "<tr>\r\n"
					+ "	<td style='width:700px;height:78px;padding:0;margin:0; font-weight:900; vertical-align:top;'>\r\n"
					+ "		<p style='width:620px;margin:20px auto 0px;text-align:center;font-size:30px;'>\r\n"
					+ "		CampBridge\r\n"
					+ "		</p>\r\n"
					+ "		<p style='width:620px;margin:0 auto 25px;text-align:center;font-size:30px;line-height:40px;'>\r\n"
					+ "		임시 비밀번호가 발급되었습니다.	\r\n"
					+ "		</p>\r\n"
					+ "	</td>\r\n"
					+ "</tr>\r\n"
					+ "<tr>\r\n"
					+ "	<td style='width:700px;height:196px;padding:0;margin:0;vertical-align:top;'>\r\n"
					+ "		<table width='618' height='194' cellpadding='0' cellspacing='0' align='center' style='margin:0 0 0 40px;border:1px #d9d9d9 solid;'>\r\n"
					+ "		<tr>\r\n"
					+ "			<td style='width:618px;height:194px;box-sizing:border-box; padding-top:30px;margin:0;vertical-align:top;font-size:0;line-height:0;background:#f9f9f9;'>\r\n"
					+ "				<p style='width:620px;margin:10px 0 0 0;padding:0;text-align:center;color:#888888;font-size:12px;line-height:1;'>아래의 PASSWORD는 임시 PASSWORD이므로 홈페이지 로그인 후 다시 수정해 주십시오.</p>\r\n"
					+ "				<p style='width:620px;margin:28px 0 0 0;padding:0;text-align:center;color:#666666;font-size:12px;line-height:1;'><strong>임시 패스워드 : <span style='color:#f7703c;line-height:1;'>"
					+ "             "+pwcode+"</span></strong></p>\r\n"
					+ "				<p style='width:620px;margin:30px 0 0 0;padding:0;text-align:center;color:#888888;font-size:12px;line-height:1.4;'>CampBridge에서는 고객님께 보다 나은 서비스를 제공하기 위해 항상 노력하고 있습니다.<br/>앞으로 많은 관심 부탁드립니다.</p>\r\n"
					+ "			</td>\r\n"
					+ "		</tr>\r\n"
					+ "		</table>	\r\n"
					+ "	</td>\r\n"
					+ "</tr>\r\n"
					+ "<tr>\r\n"
					+ "	<td style='width:700px;height:100px;padding:0;margin:0;vertical-align:top;'>\r\n"
					+ "		<p style='width:700px;margin:30px 0 0 0;text-align:center; font-size:20px; font-weight: 700;'><a href='http://localhost:8000' >CAMPBRIDGE 바로가기</a></p>\r\n"
					+ "	</td>\r\n"
					+ "</tr>\r\n"
					+ "<tr>\r\n"
					+ "	<td style='width:700px;height:155px;padding:0;margin:0;vertical-align:top;background-color:#FFCE32;border:4px solid #009223;'>\r\n"
					+ "		<p style='width:620px;margin:20px auto;padding:0;text-align:center;line-height:1.5;color:#black;'>메일수신을 원치 않으시는 분은 로그인 후. <span style='color:#black'>메일 수신 여부</span>를 변경해주시기 바랍니다.<br/>IF YOU DO NOT WISH TO RECEIVE EMAILS FROM US, PLEASE LOG-IN AND UPDATE<br/> YOUR MEMBERSHIP INFORMATION.</p>\r\n"
					+ "		<p style='width:620px;margin:20px auto;padding:0;text-align:center;line-height:1.5;color:#black;'><span style='color:#black'>본 메일에 관한 문의사항은 사이트 내 고객센터를 이용해주시기 바랍니다.</span><br/>COPYRIGHT ©  2014 CAMPBRIDGE ALL RIGHTS RESERVED.</p>\r\n"
					+ "	</td>\r\n"
					+ "</tr>\r\n"
					+ "</table>\r\n"
					+ "</div>\r\n"
					+ "</body>\r\n"
					+ "</html>";
			
			
			return data;
		}
		
		//임시비밀번호 생성
		public String getCreateKey() {
			char[] charSet = new char[] {
				'0','1','2','3','4','5','6','7','8','9',
				'a','b','c','d','e','f','g','h','i','j',
				'k','l','n','m','o','p','q','r','s','t',
				'u','v','w','x','y','z'
			};
			String pwcode ="";
			int idx=0;
			for(int i=0;i<10;i++) {
				idx = (int)(Math.random()*36); //0-35까지 랜덤숫자 생성
				pwcode += charSet[idx]; // 10개 랜덤문자열 : d7f98cj12i
			}
			return pwcode;
		}//
	
	



	//============================회원가입
	@Override //아이디체크
	public String idCheck(String id) {
		String result = "사용불가";
		User_campDto ucdto = userCampMapper.idCheck(id);
		if(ucdto==null) result="사용가능";
		
		return result;
	}



	@Override //회원가입 저장
	public void signUpinsert(User_campDto ucdto) {
		userCampMapper.signUpinsert(ucdto);
		
	}






	


	
}
