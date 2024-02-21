package com.java.www.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.www.dto.Cps_commentDto;
import com.java.www.dto.Cps_reviewDto;
import com.java.www.mapper.ReviewMapper;

import jakarta.servlet.http.HttpSession;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired ReviewMapper reviewMapper;
	@Autowired HttpSession session;

	//캠핑리뷰 - 리스트(캠핑장)    전체글가져오기 - 게시글 검색
	@Override
	public Map<String, Object> Cps_selectsearch(int page, String re_category, String re_searchWord) {
		if(page <= 0) page = 1;
		int re_countPerPage = 6;
		int re_bottomPerNaum = 10;
		int re_contAll = reviewMapper.Cps_selectcountsearch(re_category, re_searchWord);
		System.out.println("ReviewServiceImpl Cps_selectcountAll re_contAll : "+re_contAll);
		
		int re_maxPage = (int)Math.ceil((double)re_contAll/re_countPerPage);
		int re_startPage = ((page - 1) / re_bottomPerNaum) * re_bottomPerNaum + 1;
		int re_endPage = (re_startPage+re_bottomPerNaum)-1;
		int re_StartRow = (page-1)*re_countPerPage+1;
		int re_endRow = re_StartRow+re_countPerPage-1;
		System.out.println("ReviewServiceImpl Cps_selectcountAll re_maxPage : "+re_maxPage);
		
		if(re_endPage > re_maxPage) re_endPage = re_maxPage;
		
		List<Cps_reviewDto> list = reviewMapper.Cps_selectsearch(re_StartRow, re_endRow, re_category, re_searchWord);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("re_contAll", re_contAll);
		map.put("page", page);
		map.put("re_maxPage", re_maxPage);
		map.put("re_startPage", re_startPage);
		map.put("re_endPage", re_endPage);
		return map;
	}
	
	//캠핑리뷰 - 리스트(캠핑장)    전체글가져오기, 검색개수
	@Override
	public Map<String, Object> Cps_selectAll(int page, String re_category, String re_searchWord) {
		if(page <= 0) page = 1;
		int re_countPerPage = 6;
		int re_bottomPerNaum = 10;
		int re_contAll = reviewMapper.Cps_selectcountAll(re_category, re_searchWord);
		System.out.println("ReviewServiceImpl Cps_selectcountAll re_contAll : "+re_contAll);
		
		int re_maxPage = (int)Math.ceil((double)re_contAll/re_countPerPage);
		int re_startPage = ((page - 1) / re_bottomPerNaum) * re_bottomPerNaum + 1;
		int re_endPage = (re_startPage+re_bottomPerNaum)-1;
		int re_StartRow = (page-1)*re_countPerPage+1;
		int re_endRow = re_StartRow+re_countPerPage-1;
		System.out.println("ReviewServiceImpl Cps_selectcountAll re_maxPage : "+re_maxPage);
		
		if(re_endPage > re_maxPage) re_endPage = re_maxPage;
		
		List<Cps_reviewDto> list = reviewMapper.Cps_selectAll(re_StartRow, re_endRow, re_category, re_searchWord);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("re_contAll", re_contAll);
		map.put("page", page);
		map.put("re_maxPage", re_maxPage);
		map.put("re_startPage", re_startPage);
		map.put("re_endPage", re_endPage);
		return map;
	}

	//캠핑리뷰 - 뷰(캠핑장)    게시글 1개 가져오기
	@Override
	public Map<String, Object> Cps_selectOne(int cps_bno) {
		Cps_reviewDto c_redto = reviewMapper.Cps_selectOne(cps_bno);
		Cps_reviewDto prev_c_redto = reviewMapper.Cps_selectOneprev(cps_bno);
		Cps_reviewDto next_c_redto = reviewMapper.Cps_selectOnenext(cps_bno);
		
		reviewMapper.Cps_bhitUp(cps_bno);
		
		//댓글 모두 가져오기		
		List<Cps_commentDto> Cps_commentlist = reviewMapper.Cps_commentSelectAll(cps_bno);
		Map<String, Object> map = new HashMap<>();
		map.put("c_redto", c_redto);
		map.put("Cps_commentlist", Cps_commentlist);
		map.put("prev_c_redto", prev_c_redto);
		map.put("next_c_redto", next_c_redto);
		return map;
	}

	//캠핑리뷰 - 리스트(캠핑장)    게시글 글작성
	@Override
	public void siteWrite(Cps_reviewDto c_redto) {
		int result = reviewMapper.siteWrite(c_redto);
		System.out.println("ReviewServiceImpl siteWrite result : "+result);
	}

	//캠핑리뷰 - 리스트(캠핑장)    게시글 수정
	@Override
	public void site_doUpdate(Cps_reviewDto c_redto) {
		int result = reviewMapper.site_doUpdate(c_redto);
		System.out.println("ReviewServiceImpl site_doUpdate result : "+result);
	}

	//캠핑리뷰 - 리스트(캠핑장)    게시글 삭제
	@Override
	public void siteDelete(int cps_bno) {
		int result = reviewMapper.siteDelete(cps_bno);
		System.out.println("ReviewServiceImpl siteDelete result : "+result);
	}

	//캠핑리뷰 - 리스트(캠핑장)    댓글 1개 저장후 댓글 1개 가져오기
	@Override
	public Cps_commentDto Cps_commentInsert(Cps_commentDto c_recdto) {
		c_recdto.setId((String)session.getAttribute("session_id"));
		//섹션 로그인으로 대체 - session id를 cdto의 id에 저장
		//String id = "aaa";
		//c_recdto.setId(id);
		
		//댓글 1개 저장하기 - cno, cdate를 가지고옴.
		reviewMapper.Cps_commentInsert(c_recdto);
		System.out.println("ReviewServiceImpl Cps_commentInsert cps_cno : "+c_recdto.getCps_cno());
		System.out.println("ReviewServiceImpl Cps_commentInsert cps_cdate : "+c_recdto.getCps_cdate());
		
		//댓글 1개 가져오기
		//Cps_commentDto cps_commentDto = reviewMapper.Cps_commentSelectOne(c_recdto.getCps_cno());
		return c_recdto;
	}
	
	//캠핑리뷰 - 리스트(캠핑장)    댓글 1개 삭제
	@Override
	public String Cps_commentDelete(int cps_cno) {
		System.out.println("서비스임플 삭제 cps_cno : "+cps_cno);
		String result = "";
		int re_cps = reviewMapper.Cps_commentDelete(cps_cno);
		System.out.println("ReviewServiceImpl re_cps :"+re_cps);
		return result+re_cps;
	}

	//캠핑리뷰 - 리스트(캠핑장)    댓글 1개 수정저장
	@Override
	public Cps_commentDto Cps_commentUpdate(Cps_commentDto c_recdto) {
		c_recdto.setId((String)session.getAttribute("session_id"));
		//섹션 로그인으로 대체 - session id를 cdto의 id에 저장
		//String id = "aaa";
		//c_recdto.setId(id);
		
		//저장
		reviewMapper.Cps_commentUpdate(c_recdto);
		System.out.println("ReviewServiceImpl Cps_commentUpdate cps_cno : "+c_recdto.getCps_cno());
		System.out.println("ReviewServiceImpl Cps_commentUpdate cps_cdate : "+c_recdto.getCps_cdate());
		System.out.println("ReviewServiceImpl Cps_commentUpdate cps_ccontent : "+c_recdto.getCps_ccontent());
		
		//댓글 1개 가져오기
		Cps_commentDto cps_commentDto = reviewMapper.Cps_commentSelectOne(c_recdto.getCps_cno());
		return cps_commentDto;
	}

}
