package com.java.www.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.www.dto.User_campDto;
import com.java.www.mapper.MyInfoUpdateMapper;

@Service
public class MyInfoUpdateServiceImpl implements MyInfoUpdateService {

	@Autowired MyInfoUpdateMapper myInfoUpdateMapper;

	@Override //내 정보 가져오기
	public User_campDto selectOne(String id) {
		System.out.println("MyInfoServiceImpl : "+id);
		User_campDto userCampdto = myInfoUpdateMapper.selectOne(id);
		
		return userCampdto;
	}// selectOne(id)

	@Override //내 정보 수정
	public String myInfoUpdate(User_campDto userCampdto) {
		
		System.out.println("My임플 비밀번호 : " + userCampdto.getPw());
		System.out.println("My임플 닉네임 : " + userCampdto.getNickname());
		System.out.println("My임플 이메일 : " + userCampdto.getEmail());
		System.out.println("My임플 전화번호 : " + userCampdto.getPhone());
		System.out.println("My임플 주소 : " + userCampdto.getAddress());
		System.out.println("My임플 지역 : " + userCampdto.getLocal());
		System.out.println("My임플 파일 : " + userCampdto.getM_img());

		//Mapper 연결
		String re =""; 
		int result = myInfoUpdateMapper.myInfoUpdate(userCampdto);
		
		System.out.println("service Impl 정보수정 : "+result);
		
		return result+re;
	}

}// MyInfoUpdateServiceImpl
