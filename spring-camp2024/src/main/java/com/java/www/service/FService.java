package com.java.www.service;

import java.util.Map;

import com.java.www.dto.FBoardDto;

public interface FService {

	// 4. 자유게시판 전체가져오기
	Map<String, Object> fselectAll(int page);

	// 4. 자유게시판 - 게시글 검색
	Map<String, Object> fselectSearch(int page, String searchTitle, String searchWord);

	// 4. 자유게시판 - 게시글 1개 가져오기
	FBoardDto fselectOne(int f_bno);

}// FService
