package com.java.www.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.www.dto.NBoardDto;
import com.java.www.dto.NCommentDto;
import com.java.www.mapper.NBoardMapper;

import jakarta.servlet.http.HttpSession;


@Service
public class NBoardServiceImpl implements NBoardService{
	
	@Autowired NBoardMapper nbMapper;
	@Autowired HttpSession session;
	
	//게시글 전체가져오기
	@Override
	public Map<String, Object> selectAll(int page, String category, String searchWord) {
		
		if(page<=0) page=1;
		int countPerPage = 10;
		int bottomPerNum = 10;
		int countAll = nbMapper.selectCountAll(category,searchWord);
		
		int maxPage = (int)Math.ceil((double)countAll/countPerPage);
		int startPage = ((page-1)/bottomPerNum)*bottomPerNum+1;
		int endPage = (startPage+bottomPerNum)-1;
		
		int startRow = (page-1)*countPerPage+1; 
		int endRow =startRow+countPerPage-1;
		
		if(endPage>maxPage) endPage=maxPage;
		ArrayList<NBoardDto> list = nbMapper.selectAll(startRow,endRow,category,searchWord);
		
		System.out.println("NBoardServiceImpl selectAll countAll :"+countAll);
		System.out.println("NBoardServiceImpl selectAll countAll :"+startRow);
		System.out.println("NBoardServiceImpl selectAll countAll :"+endRow);
		System.out.println("NBoardServiceImpl selectAll countAll :"+maxPage);
		System.out.println("NBoardServiceImpl selectAll countAll :"+startPage);
		System.out.println("NBoardServiceImpl selectAll countAll :"+endPage);
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("countAll", countAll);
		map.put("page", page);
		map.put("maxPage", maxPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("category", category);
		map.put("searchWord", searchWord);
		
		
		return map;
	}
	
	/*
	//게시글 리스트 검색 가져오기
	@Override
	public Map<String, Object> selectSearch(int page, String category, String searchWord) {
		
		if(page<=0) page=1;
		int countPerPage = 10;
		int bottomPerNum = 10;
		int countAll = nbMapper.selectCountAll(category,searchWord);
		
		int maxPage = (int)Math.ceil((double)countAll/countPerPage);
		int startPage = ((page-1)/bottomPerNum)*bottomPerNum+1;
		int endPage = (startPage+bottomPerNum)-1;
		
		int startRow = (page-1)*countPerPage+1; 
		int endRow =startRow+countPerPage-1;
		
		if(endPage>maxPage) endPage=maxPage;
		ArrayList<NBoardDto> list = nbMapper.selectSearch(startRow,endRow,category,searchWord);
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("countAll", countAll);
		map.put("page", page);
		map.put("maxPage", maxPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		
		
		return map;
	}
*/
	
	//게시글 1개 가져오기, 이전글, 다음글 가져오기, 조회수 가져오기
	@Override
	public Map<String, Object> selectOne(int n_bno) {
		NBoardDto nboardDto = nbMapper.selectOne(n_bno);
		NBoardDto predto = nbMapper.selectOnePrev(n_bno);
		NBoardDto nextdto = nbMapper.selectOneNext(n_bno);
		List<NCommentDto> n_list = nbMapper.commentSelectAll(n_bno);

		//조회수 증가
		nbMapper.nbhitUp(n_bno);
		
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("nbdto", nboardDto);
		map.put("predto", predto);
		map.put("nextdto", nextdto);
		map.put("n_list",n_list);
		
		
		return map;
	}

	//게시글 글쓰기
	@Override
	public void bWrite(NBoardDto nbdto) {
		nbMapper.bWrite(nbdto);
		
	}

	@Override
	public void donUpdate(NBoardDto nbdto) {
		int result = nbMapper.donUpdate(nbdto);
		
	}
	
	//게시글 삭제
	@Override
	public String nDelete(int n_bno) {
		
		int result = nbMapper.nDelete(n_bno);
		
		return result+"";
	}
	
	//댓글 저장하기
	@Override
	public NCommentDto NCommnetInsert(NCommentDto ncdto) {
		
		//session_id로 변환하기
		ncdto.setId((String)session.getAttribute("session_id"));
		
		
		
		nbMapper.NCommnetInsert(ncdto);
		
		return ncdto;
	}
	
	//댓글 삭제하기
	@Override
	public int NCommnetDelete(int n_cno) {
		int result = nbMapper.NCommnetDelete(n_cno);
		return result;
	}
	
	//댓글 수정 후 저장하기
	@Override
	public NCommentDto NCommentUpdate(NCommentDto ncdto) {
		
		//session_id변환하기
		ncdto.setId((String)session.getAttribute("session_id"));
		
		//ncdto.setId("aaa");
		
		//댓글저장하기
		nbMapper.NCommentUpdate(ncdto);
		//댓글 1개가져오기
		NCommentDto nCommentDto = nbMapper.nCommentSelectOne(ncdto.getN_cno());
		
		return nCommentDto;
	}
	

	


}
