package com.java.www.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.www.dto.FBoardDto;

@Mapper
public interface FBoardMapper {

	// 4. 자유게시판 전체가져오기
	ArrayList<FBoardDto> fselectAll(int startRow, int endRow);
	ArrayList<FBoardDto> fSelectSearch(int startRow, int endRow, String searchTitle, String searchWord);

	// 4.게시글 총갯수(하단 넘버링), 게시글 검색갯수
	int fSelcountAll();
	int fSearchCount(String searchTitle, String searchWord);
	
	// 4. 자유게시판 - 게시글 1개가져오기
	FBoardDto fSelectOne(int f_bno);

	


}// FBoardMapper
