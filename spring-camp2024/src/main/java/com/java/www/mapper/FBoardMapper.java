package com.java.www.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.www.dto.FBoardDto;
import com.java.www.dto.FCommentDto;

@Mapper
public interface FBoardMapper {

	// 4. 자유게시판 전체가져오기
	ArrayList<FBoardDto> fselectAll(int startRow, int endRow, String searchTitle, String searchWord);

	ArrayList<FBoardDto> fSelectSearch(int startRow, int endRow, String searchTitle, String searchWord);

	// 4.게시글 총갯수(하단 넘버링), 게시글 검색갯수
	int fSelcountAll(String searchTitle, String searchWord);

	int fSearchCount(String searchTitle, String searchWord);

	// 4. 자유게시판 - 게시글 1개가져오기 : 현재글
	FBoardDto fSelectOne(int f_bno);

	// 4. 자유게시판 - 게시글 1개가져오기 : 이전글
	FBoardDto fSelectOnePrev(int f_bno);

	// 4. 자유게시판 - 게시글 1개가져오기 : 다음글
	FBoardDto fSelectOneNext(int f_bno);

	// 4. 자유게시판 - 게시글 1개가져오기 : 하단댓글 전체가져오기
	ArrayList<FCommentDto> fCommentSelectAll(int f_bno);

	// 4. 자유게시판 - 조회수증가
	void fHitUp(int f_bno);

	// 4. 자유게시판 - 게시글 1개 저장(파일저장)
	void fWrite(FBoardDto fbdto);

	// 4. 자유게시판 - 게시글 수정저장
	void doFUpdate(FBoardDto fbdto);

	// 4. 자유게시판 - 게시글 1개 삭제
	void fDelete(int f_bno);

	// 4. 자유게시판 - 게시글 1개가져오기 : 하단댓글 1개 저장 후 댓글 1개 가져오기
	void fCommentInsert(FCommentDto fcdto);

	FCommentDto FCommentSelectOne(int f_cno);

	// 4. 자유게시판 - 게시글 1개가져오기 : 하단댓글 1개 삭제
	int fCommentDelete(int f_cno);

	// 4. 자유게시판 - 게시글 1개가져오기 : 하단댓글 수정저장
	void FCommentUpdate(FCommentDto fcdto);

	// 4. 자유게시판 - 게시글 답글저장
	void fBstepUp(FBoardDto fbdto); // 다른게시글 f_bstep 1증가
	void doFReply(FBoardDto fbdto);
	

}// FBoardMapper
