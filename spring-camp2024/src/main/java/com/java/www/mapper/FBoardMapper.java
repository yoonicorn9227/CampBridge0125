package com.java.www.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.www.dto.FBoardDto;

@Mapper
public interface FBoardMapper {

	// 4. 자유게시판 전체가져오기
	ArrayList<FBoardDto> fselectAll(int startRow, int endRow, String searchTitle, String searchWord);

	ArrayList<FBoardDto> fSelectSearch(int startRow, int endRow, String searchTitle, String searchWord);

	// 4.게시글 총갯수(하단 넘버링), 게시글 검색갯수
	int fSelcountAll(String searchTitle, String searchWord);

	int fSearchCount(String searchTitle, String searchWord);

	// 4. 자유게시판 - 게시글 1개가져오기
	FBoardDto fSelectOne(int f_bno);

	// 4. 자유게시판 - 게시글 1개 저장(파일저장)
	void fWrite(FBoardDto fbdto);

	// 4. 자유게시판 - 게시글 1개 삭제
	void fDelete(int f_bno);

	// 4. 자유게시판 - 게시글 수정저장
	void doFUpdate(FBoardDto fbdto);
}// FBoardMapper
