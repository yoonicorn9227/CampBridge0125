package com.java.www.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.www.dto.BoardDto;
import com.java.www.mapper.MSearchMapper;

@Service
public class MSearchServiceImpl implements MSearchService {
	
	@Autowired
	MSearchMapper mSearchMapper;
	

	@Override
	public Map<String, Object> MlistSelectAll(int page, String searchTitle, String searchWord) {
		if (page <= 0)
			page = 1;
		int rowPerPage = 10; 
		int bottomNum = 10; 
		int fcountAll = mSearchMapper.MlistSelectCountAll(searchTitle, searchWord); 
		int maxPageNum = (int) Math.ceil((double) fcountAll / rowPerPage);
		int startPageNum = ((page - 1) / 10) * 10 + 1; 
		int endPageNum = (startPageNum + bottomNum) - 1; 

		int startRow = (page - 1) * rowPerPage + 1; 
		int endRow = startRow + rowPerPage - 1; 
		if (endPageNum > maxPageNum)
			endPageNum = maxPageNum;
		ArrayList<BoardDto> list = mSearchMapper.MlistSelectAll(startRow, endRow, searchTitle, searchWord);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("page", page);
		map.put("maxPageNum", maxPageNum);
		map.put("startPageNum", startPageNum);
		map.put("endPageNum", endPageNum);
		map.put("searchTitle", searchTitle);
		map.put("searchWord", searchWord);

		return map;
	}

	@Override
	public Map<String, Object> MSelectSearch(int page, String searchTitle, String searchWord) {
		if(page<=0) page=1;
		int countPerPage = 10; 
		int bottomPerNum = 10; 
		int countAll = mSearchMapper.MSelectSearchCount(searchTitle,searchWord); 
		System.out.println("BServiceImpl countAll : "+countAll);
		int maxPage = (int)Math.ceil((double)countAll/countPerPage);
		System.out.println("BServiceImpl maxPage : "+maxPage);
		
		int startPage = ((page-1)/bottomPerNum)*bottomPerNum+1;   
		int endPage = (startPage+bottomPerNum)-1;
		int startRow = (page-1)*countPerPage+1; 
		int endRow = startRow+countPerPage-1;   
		
		
		if(endPage>maxPage) endPage=maxPage;
		ArrayList<BoardDto> list = mSearchMapper.MSelectSearch(startRow,endRow,searchTitle,searchWord);
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("page", page);
		map.put("maxPage", maxPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		
		return map;
	}

	@Override
	public Map<String, Object> MlistSelectOne(int bno) {
		//현재번호글 가져오기
		BoardDto bdto = mSearchMapper.MlistSelectOne(bno);
		//이전번호글 가져오기
		BoardDto prebdto = mSearchMapper.MPreSelectOne(bno);
		//다음번호글 가져오기
		BoardDto nextbdto = mSearchMapper.MNextSelectOne(bno);	
		
		//fBoardMapper.f_bhitUp(bno);
		
		Map<String, Object> map = new HashMap<>();
		map.put("bdto", bdto);
		map.put("prebdto", prebdto);
		map.put("nextbdto", nextbdto);
		return map;
	}

}
