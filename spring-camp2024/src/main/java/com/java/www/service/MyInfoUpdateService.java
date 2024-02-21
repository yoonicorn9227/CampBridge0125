package com.java.www.service;

import com.java.www.dto.User_campDto;

public interface MyInfoUpdateService {

	//내 정보 가져오기
	User_campDto selectOne(String id);

	//내 정보 수정
	String myInfoUpdate(User_campDto userCampdto);

}// MyInfoUpdateService
