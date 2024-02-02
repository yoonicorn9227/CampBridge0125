package com.java.www.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.www.dto.PBoardDto;

@Mapper
public interface PBoardMapper {
	// 1. 파티원 모집 - 전체게시판 가져오기, 및 게시글 전체갯수
	ArrayList<PBoardDto> pSelectAll(int startRow, int endRow, String pCategory, String pSearchWord);
	int pSelcountAll(String pCategory, String pSearchWord); //게시글 전체갯수
	int pSelSearchCountAll(String pCategory, String pSearchWord);//게시글 검색 전체갯수
	ArrayList<PBoardDto> pSelectSearchAll(int startRow, int endRow, String pCategory, String pSearchWord);

}// PBoardMapper
