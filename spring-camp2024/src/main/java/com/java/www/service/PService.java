package com.java.www.service;

import java.util.ArrayList;
import java.util.Map;

import com.java.www.dto.PBoardDto;

public interface PService {

	// 1. 파티원 모집 전체 리스트 가져오기
	Map<String, Object> pSelectAll(int page, String pCategory, String pSearchWord);

	//파티원모집 게시글 검색어
	Map<String, Object> pSelectSearch(int page, String pCategory, String pSearchWord);

}// PService(파티원 모집)
