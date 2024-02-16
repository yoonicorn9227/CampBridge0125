package com.java.www.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.www.dto.PBoardDto;
import com.java.www.dto.PCommentDto;
import com.java.www.dto.PJoinDto;

@Mapper
public interface PBoardMapper {
	// 1. 파티원 모집 - 전체 리스트 가져오기 & 게시글 전체갯수
	ArrayList<PBoardDto> pSelectAll(int startRow, int endRow, String pCategory, String pSearchWord);
	int pSelcountAll(String pCategory, String pSearchWord); // 게시글 전체갯수

	// 1-1. 파티원 모집 - 검색어 전체 리스트 가져오기 
	ArrayList<PBoardDto> pSelectSearchAll(int startRow, int endRow, String pCategory, String pSearchWord);
	int pSelSearchCountAll(String pCategory, String pSearchWord);// 게시글 검색 전체갯수

	// 2.파티원 모집 - 게시글 작성
	void pWrite(PBoardDto pbdto);

	// 3. 파티원 모집 - 게시글 1개 가져오기
	PBoardDto pSelectOne(int p_bno); // 파티원 모집 - 게시글 1개 가져오기
	ArrayList<PJoinDto> pJoinSelectAll(int p_bno); // 파티원 모집 - 게시글 파티참여 인원 가져오기
	ArrayList<PCommentDto> pCommentSelectAll(int p_bno); // 파티원 모집 하단댓글 모두 가져오기

	// 4. 파티원 모집 - 게시글 1개 수정하기 저장
	void doPUpdate(PBoardDto pbdto);

	// 5. 파티원 모집 - 게시글 1개 삭제하기
	void pDelete(int p_bno);

	// 6. 파티원 참여
	void partyJoin(PJoinDto pjdto); //파티원 모집 - 파티원 1명 참가(저장)
	PJoinDto partySelectOne(int p_jcno); // 파티원 모집 - 파티원 1명 불러오기
	void pJoinNum(int p_bno); // 참가인원 1증가

	// 7. 파티원 모집 - 1명 탈퇴(삭제)
	int pJoinDelete(int p_jcno);
	void pJoinNumDown(int p_bno); // 참가인원 1감소

	// 8. 파티원 모집 - 하단댓글 1개 저장
	void pCommentInsert(PCommentDto pcdto); // 파티원 모집 게시글 하단댓글 1개 저장

	// 9. 파티원모집 - 하단댓글 1개 수정저장
	void pCommentUpdate(PCommentDto pcdto); // 파티원모집 - 하단댓글 1개 수정저장
	PCommentDto pCommentSelectOne(int p_cno);// 파티원 모집 - 원본댓글 1개 가져오기
	
	// 10.파티원모집 - 하단댓글 1개 삭제
	int pCommentDelete(int p_cno); // 파티원 모집 게시글 하단댓글 1개 삭제

}// PBoardMapper
