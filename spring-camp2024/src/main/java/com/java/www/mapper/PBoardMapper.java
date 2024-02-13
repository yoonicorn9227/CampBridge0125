package com.java.www.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.www.dto.PBoardDto;
import com.java.www.dto.PCommentDto;
import com.java.www.dto.PJoinDto;

@Mapper
public interface PBoardMapper {
	// 1. 파티원 모집 - 전체게시판 가져오기, 및 게시글 전체갯수
	ArrayList<PBoardDto> pSelectAll(int startRow, int endRow, String pCategory, String pSearchWord);
	int pSelcountAll(String pCategory, String pSearchWord); //게시글 전체갯수
	int pSelSearchCountAll(String pCategory, String pSearchWord);//게시글 검색 전체갯수
	ArrayList<PBoardDto> pSelectSearchAll(int startRow, int endRow, String pCategory, String pSearchWord);
	
	//2. 파티원 모집 - 게시글 1개 가져오기
	PBoardDto pSelectOne(int p_bno);
	ArrayList<PJoinDto> pJoinSelectAll(int p_bno); //파티원 인원 모두가져오기
	ArrayList<PCommentDto> pCommentSelectAll(int p_bno); //파티원 모집 하단댓글 모두 가져오기
	void pCommentInsert(PCommentDto pcdto); //파티원 모집 게시글 하단댓글 1개 저장
	int pCommentDelete(int p_cno); //파티원 모집 게시글 하단댓글 1개 삭제
	void pCommentUpdate(PCommentDto pcdto); //파티원 모집 게시글 하단댓글 수정저장
	PCommentDto pCommentSelectOne(int p_cno);//파티원 모집 게시글 하단댓글 1개 가져오기
	
	//3. 파티원 모집 게시글 1개 삭제하기
	void pDelete(int p_bno);
	
	//4. 파티원 모집 게시글 1개 수정하기 저장
	void doPUpdate(PBoardDto pbdto);
	
	void partyJoin(PJoinDto pjdto);
	PJoinDto partySelectOne(int p_jcno);
	int pJoinDelete(int p_jcno);
	void pWrite(PBoardDto pbdto);
}// PBoardMapper
