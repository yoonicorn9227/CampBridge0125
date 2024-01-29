package com.java.www.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.www.dto.FBoardDto;
import com.java.www.mapper.FBoardMapper;

@Service
public class FServiceImpl implements FService {
	@Autowired
	FBoardMapper fboardMapper;

	@Override //자유게시판 검색어 리스트
	public Map<String, Object> fselectSearch(int page, String searchTitle, String searchWord) {
		// 게시글 전체가져오기
		// ♠하단넘버링 (page, rowPerPage : 1pg당 게시글 갯수, startPage, endPage, maxPage)
		if (page <= 0)
			page = 1;
		int rowPerPage = 10; // 1pg당 게시글 10개
		int bottomNum = 10; // 하단 넘버링 갯수(10개)
		int fcountAll = fboardMapper.fSearchCount(searchTitle, searchWord); // 게시글 검색 총갯수
		System.out.println("FServiceImpl fScountAll : " + fcountAll);
		int maxPageNum = (int) Math.ceil((double) fcountAll / rowPerPage);
		int startPageNum = ((page - 1) / 10) * 10 + 1; // 하단넘버링 시작번호 (9-1)/10 = 0.9 -> 0 || 0*10+1=1
		int endPageNum = (startPageNum + bottomNum) - 1; // 하단넘버링 끝번호

		int startRow = (page - 1) * rowPerPage + 1; // 페이지에서 게시글 시작번호
		int endRow = startRow + rowPerPage - 1; // 페이지에서 게시글 끝번호

		// 하단넘버링 최대페이지보다 하단넘버링 끝번호보다 작을경우.
		if (endPageNum > maxPageNum)
			endPageNum = maxPageNum;
		ArrayList<FBoardDto> list = fboardMapper.fSelectSearch(startRow, endRow, searchTitle, searchWord);

		// 데이터 전송 - list, page, maxPageNum startPageNum, endPageNum

		// Map으로 전송(return -> map / 리턴타입 ArrayList에서 Map으로 변경)
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("page", page);
		map.put("maxPageNum", maxPageNum);
		map.put("startPageNum", startPageNum);
		map.put("endPageNum", endPageNum);

		return map;
	}// fselectSearch

	@Override // 자유게시판 전체가져오기
	public Map<String, Object> fselectAll(int page, String searchTitle, String searchWord) {

		// 게시글 전체가져오기
		// ♠하단넘버링 (page, rowPerPage : 1pg당 게시글 갯수, startPage, endPage, maxPage)
		if (page <= 0)
			page = 1;
		int rowPerPage = 10; // 1pg당 게시글 10개
		int bottomNum = 10; // 하단 넘버링 갯수(10개)
		int fcountAll = fboardMapper.fSelcountAll(searchTitle, searchWord); // 게시글 총갯수
		int maxPageNum = (int) Math.ceil((double) fcountAll / rowPerPage);
		int startPageNum = ((page - 1) / 10) * 10 + 1; // 하단넘버링 시작번호 (9-1)/10 = 0.9 -> 0 || 0*10+1=1
		int endPageNum = (startPageNum + bottomNum) - 1; // 하단넘버링 끝번호

		int startRow = (page - 1) * rowPerPage + 1; // 페이지에서 게시글 시작번호
		int endRow = startRow + rowPerPage - 1; // 페이지에서 게시글 끝번호

		// 하단넘버링 최대페이지보다 하단넘버링 끝번호보다 작을경우.
		if (endPageNum > maxPageNum)
			endPageNum = maxPageNum;
		ArrayList<FBoardDto> list = fboardMapper.fselectAll(startRow, endRow, searchTitle, searchWord);

		// 데이터 전송 - list, page, maxPageNum startPageNum, endPageNum

		// Map으로 전송(return -> map / 리턴타입 ArrayList에서 Map으로 변경)
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("page", page);
		map.put("maxPageNum", maxPageNum);
		map.put("startPageNum", startPageNum);
		map.put("endPageNum", endPageNum);
		map.put("searchTitle", searchTitle);
		map.put("searchWord", searchWord);

		return map;
	}// fselectAll(page)
	
	@Override //자유게시판 - 게시글 저장(파일저장) 
	public void fWrite(FBoardDto fbdto) {
		fboardMapper.fWrite(fbdto);
	}//fWrite(fbdto)

	@Override // 자유게시판-자유게시글 1개 가져오기
	public FBoardDto fselectOne(int f_bno) {
		System.out.println("FServiceImpl FselectOne f_bno : " + f_bno);

		FBoardDto fbdto = fboardMapper.fSelectOne(f_bno);

		return fbdto;
	}// fselectOne(f_bno)

	@Override// 자유게시판 -자유게시글 1개 삭제
	public void fDelete(int f_bno) {
		
		fboardMapper.fDelete(f_bno);
		
	}//fDelete(f_bno)

	@Override //자유게시판 - 자유게시글 수정저장
	public void doFUpdate(FBoardDto fbdto) {
		System.out.println("FServiceImpl doFUpdate f_bno : " + fbdto.getF_bno());
		System.out.println("FServiceImpl doFUpdate f_btype : " + fbdto.getF_btype());
		System.out.println("FServiceImpl doFUpdate f_btitle : " + fbdto.getF_btitle());
		System.out.println("FServiceImpl doFUpdate f_bcontent: " + fbdto.getF_bcontent());
		System.out.println("FServiceImpl doFUpdate f_bfile : " + fbdto.getF_bfile());
		fboardMapper.doFUpdate(fbdto);
	}//doFUpdate(fbdto)


}// FServiceImpl
