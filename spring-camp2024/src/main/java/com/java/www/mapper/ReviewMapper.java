package com.java.www.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.java.www.dto.Cps_commentDto;
import com.java.www.dto.Cps_reviewDto;

@Mapper
public interface ReviewMapper {

	// 캠핑리뷰 - 리스트(캠핑장) 전체글가져오기
	List<Cps_reviewDto> Cps_selectAll(int re_StartRow, int re_endRow, String re_category, String re_searchWord);

	// 캠핑리뷰 - 리스트(캠핑장) 전체글가져오기 - 검색 전체 게시글 가져오기
	List<Cps_reviewDto> Cps_selectsearch(int re_StartRow, int re_endRow, String re_category, String re_searchWord);

	//// 캠핑리뷰 - 리스트(캠핑장) 전체글가져오기 - 게시글 검색개수
	int Cps_selectcountsearch(String re_category, String re_searchWord);

	// 캠핑리뷰 - 리스트(캠핑장) 전체글가져오기 - 게시글총개수
	int Cps_selectcountAll(String re_category, String re_searchWord);

	// 캠핑리뷰 - 뷰(캠핑장) 게시글 1개 가져오기 - 현재글
	Cps_reviewDto Cps_selectOne(int cps_bno);

	// 캠핑리뷰 - 뷰(캠핑장) 게시글 1개 가져오기 - 이전글
	Cps_reviewDto Cps_selectOneprev(int cps_bno);

	// 캠핑리뷰 - 뷰(캠핑장) 게시글 1개 가져오기 - 다음글
	Cps_reviewDto Cps_selectOnenext(int cps_bno);

	// 캠핑리뷰 - 뷰(캠핑장) 게시글 조회수 1증가
	void Cps_bhitUp(int cps_bno);

	// 캠핑리뷰 - 리스트(캠핑장) 게시글 글작성
	int siteWrite(Cps_reviewDto c_redto);

	// 캠핑리뷰 - 리스트(캠핑장) 게시글 수정
	int site_doUpdate(Cps_reviewDto c_redto);

	// 캠핑리뷰 - 리스트(캠핑장) 게시글 삭제
	int siteDelete(int cps_bno);

	// 캠핑리뷰 - 뷰(캠핑장) 게시글 1개 가져오기 - 댓글 모두 가져오기
	List<Cps_commentDto> Cps_commentSelectAll(int cps_bno);

	// 캠핑리뷰 - 리스트(캠핑장) 댓글 1개 저장후 댓글 1개 가져오기
	void Cps_commentInsert(Cps_commentDto c_recdto);

	Cps_commentDto Cps_commentSelectOne(int cps_cno);

	// 캠핑리뷰 - 리스트(캠핑장) 댓글 1개 삭제
	int Cps_commentDelete(int cps_cno);

	// 캠핑리뷰 - 리스트(캠핑장) 댓글 1개 수정저장
	void Cps_commentUpdate(Cps_commentDto c_recdto);

}
