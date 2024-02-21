package com.java.www.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.www.dto.CppRDto;
import com.java.www.dto.Cps_reviewDto;
import com.java.www.dto.FBoardDto;
import com.java.www.dto.TBoardDto;

@Mapper
public interface MyBoardMapper {

	//자유게시판 리스트(게시물 3개) 가져오기
	ArrayList<FBoardDto> fbList(String id);
	//캠핑장리뷰 리스트(게시물 3개) 가져오기
	ArrayList<Cps_reviewDto> cpsRList(String id);
	//캠핑꿀팁 리스트(게시물 3개) 가져오기
	ArrayList<TBoardDto> TList(String id);
	//캠핑용품리뷰 리스트(게시물 3개) 가져오기
	ArrayList<CppRDto> cppRList(String id);
	
	

}//FBoardMapper
