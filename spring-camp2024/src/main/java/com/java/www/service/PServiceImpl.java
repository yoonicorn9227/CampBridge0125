package com.java.www.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.www.dto.PBoardDto;
import com.java.www.mapper.PBoardMapper;

@Service
public class PServiceImpl implements PService {

	@Autowired
	PBoardMapper pboardMapper;

	@Override // 1. 파티원 모집 전체 게시글 가져오기
	public Map<String, Object> pSelectAll(int page, String pCategory, String pSearchWord) {

		// ② 파티원 모집 - 하단넘버링
		if (page < 0)
			page = 1;
		int rowPerPage = 10;
		int bottomArry = 10;
		int pCountAll = pboardMapper.pSelcountAll(pCategory, pSearchWord);
		int maxArryPage = (int) Math.ceil((double) pCountAll / rowPerPage);
		int startArryPage = ((page - 1) / bottomArry) * bottomArry + 1;
		int endArryPage = (startArryPage + bottomArry) - 1;
		int startRow = (page - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;

		if (endArryPage > maxArryPage)
			endArryPage = maxArryPage;
		// ① Mapper연결 - 파티원 모집 전체 리스트 가져오기
		ArrayList<PBoardDto> list = pboardMapper.pSelectAll(startRow, endRow, pCategory, pSearchWord);

		// ③ map으로 여러개 데이터 담아서 전송(①+②)
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("page", page);
		map.put("startArryPage", startArryPage);
		map.put("endArryPage", endArryPage);
		map.put("maxArryPage", maxArryPage);
		
		//④검색어 유형, 검색어 map으로 전송
		map.put("pCategory", pCategory);
		map.put("pSearchWord", pSearchWord);
		

		return map;
	}// pSelectAll

	@Override
	public Map<String, Object> pSelectSearch(int page, String pCategory, String pSearchWord) {

		// ② 파티원 모집 - 하단넘버링
		if (page < 0)
			page = 1;
		int rowPerPage = 10;
		int bottomArry = 10;
		int pCountAll = pboardMapper.pSelSearchCountAll(pCategory, pSearchWord); // 게시글 검색 총갯수
		System.out.println("검색어 총개수 : " + pCountAll);
		int maxArryPage = (int) Math.ceil((double) pCountAll / rowPerPage);
		int startArryPage = ((page - 1) / bottomArry) * bottomArry + 1;
		int endArryPage = (startArryPage + bottomArry) - 1;
		int startRow = (page - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;

		if (endArryPage > maxArryPage)
			endArryPage = maxArryPage;

		// ① Mapper연결 - 파티원 모집 전체 리스트 가져오기
		ArrayList<PBoardDto> list = pboardMapper.pSelectSearchAll(startRow, endRow, pCategory, pSearchWord);

		// ③ map으로 여러개 데이터 담아서 전송(①+②)
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pCountAll", pCountAll);
		map.put("page", page);
		map.put("startArryPage", startArryPage);
		map.put("endArryPage", endArryPage);
		map.put("maxArryPage", maxArryPage);

		return map;
	}// pSelectSearch

}// PServiceImpl(파티원 모집)
