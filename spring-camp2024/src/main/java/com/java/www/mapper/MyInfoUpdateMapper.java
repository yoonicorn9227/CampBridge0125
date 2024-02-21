package com.java.www.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.java.www.dto.User_campDto;

@Mapper
public interface MyInfoUpdateMapper {
	
	//내 정보 가져오기
	User_campDto selectOne(String id);


	//내 정보 수정
	int myInfoUpdate(User_campDto userCampdto);
	
	
	

}//MyInfoUpdateMapper
