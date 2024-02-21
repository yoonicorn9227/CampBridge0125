package com.java.www.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.www.dto.CppRDto;
import com.java.www.dto.Cps_reviewDto;
import com.java.www.dto.FBoardDto;
import com.java.www.dto.TBoardDto;
import com.java.www.mapper.MyBoardMapper;

@Service
public class MyBoardServiceImpl implements MyBoardService {

	@Autowired MyBoardMapper myboardMapper;
	
	@Override //나의 게시글 자유게시판 리스트(게시물 3개) 가져오기
	public ArrayList<FBoardDto> fbList(String id) {
		System.out.println("MyBoardServiceImpl : "+1);
		ArrayList<FBoardDto> list = myboardMapper.fbList(id);
		return list;
	}//fbList

	@Override //나의 게시글 캠핑장리뷰 리스트(게시물 3개) 가져오기
	public ArrayList<Cps_reviewDto> cpsRList(String id) {
		ArrayList<Cps_reviewDto> list2 = myboardMapper.cpsRList(id);
		return list2;
	}//cpsRList

	@Override //나의 게시글 캠핑꿀팁 리스트(게시물 3개) 가져오기
	public ArrayList<TBoardDto> tList(String id) {
		ArrayList<TBoardDto> list3 = myboardMapper.TList(id);
		return list3;
	}

	@Override //나의 게시글 캠핑용품리뷰 리스트(게시물 3개) 가져오기
	public ArrayList<CppRDto> cppRList(String id) {
		ArrayList<CppRDto> list4 = myboardMapper.cppRList(id);
		return list4;
	}

	
	
}//MyBoardServiceImpl
