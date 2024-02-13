package com.java.www.service;

import java.util.ArrayList;
import java.util.Map;

import com.java.www.dto.PBoardDto;
import com.java.www.dto.PCommentDto;
import com.java.www.dto.PJoinDto;

public interface PService {

	// 1. 파티원 모집 전체 리스트 가져오기
	Map<String, Object> pSelectAll(int page, String pCategory, String pSearchWord);

	// 파티원모집 게시글 검색어
	Map<String, Object> pSelectSearch(int page, String pCategory, String pSearchWord);

	// 2. 파티원 게시글 1개 가져오기(게시글, 파티참여 인원, 하단댓글)
	Map<String, Object> pSelectOne(int p_bno);

	// 2. 파티원 게시글 하단댓글 1개 저장
	PCommentDto pCommentInsert(PCommentDto pcdto);

	// 2. 파티원 게시글 하단댓글 1개 삭제
	String pCommentDelete(int p_cno);

	// 2. 파티원 게시글 - 파티원 참여 저장
	PJoinDto partyJoin(PJoinDto pjdto);

	// 2. 파티원 게시글 하단댓글 1개 수정저장
	PCommentDto pCommentUpdate(PCommentDto pcdto);

	// 3. 파티원 게시글 1개 삭제
	void pDelete(int p_bno);

	// 4. 파티원 게시글 1개 수정저장
	void doPUpdate(PBoardDto pbdto);

	// 2. 파티원 게시글 파티원 탈퇴
	String pJoinDelete(int p_jcno);

	//파티원 게시글 저장
	void pWrite(PBoardDto pbdto);



}// PService(파티원 모집)
