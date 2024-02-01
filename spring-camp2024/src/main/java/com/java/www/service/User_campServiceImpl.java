package com.java.www.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.www.dto.User_campDto;
import com.java.www.mapper.User_campMapper;

import jakarta.servlet.http.HttpSession;

@Service
public class User_campServiceImpl implements User_campService {

	@Autowired
	User_campMapper userCampMapper;
	@Autowired
	HttpSession session;

	@Override // 로그인
	public User_campDto loginSelect(User_campDto ucdto) {
		User_campDto usercampDto = userCampMapper.loginSelect(ucdto);
		return usercampDto;
	}//loginSelect(loginSelect)

	@Override // 아이디찾기 -name,mail
	public String idsearch(String name, String email) {
		String result = "아이디찾음";
		User_campDto ucdto = userCampMapper.idsearch(name, email);
		if (ucdto == null)
			result = "아이디없음";

		return result;
	}//idsearch(name, email)

	@Override // 회원가입 저장
	public String signUp(User_campDto ucdto) {
		userCampMapper.signUp(ucdto);
		String result = "가입완료";
		return result;
	}//signUp(ucdto)

	@Override // 아이디체크
	public String idCheck(String id) {
		String result = "사용불가";
		User_campDto ucdto = userCampMapper.idCheck(id);
		if (ucdto == null)
			result = "사용가능";

		return result;
	}//idCheck(id)

}//User_campServiceImpl
