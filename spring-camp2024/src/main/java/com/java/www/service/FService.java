package com.java.www.service;

import java.util.Map;

import com.java.www.dto.FBoardDto;
import com.java.www.dto.FCommentDto;
import com.java.www.dto.PCommentDto;

public interface FService {

	// 4. 자유게시판 전체가져오기
	Map<String, Object> fselectAll(int page, String searchTitle, String searchWord);

	// 4. 자유게시판 - 게시글 검색
	Map<String, Object> fselectSearch(int page, String searchTitle, String searchWord);

	// 4. 자유게시판 - 게시글 1개 가져오기 - 현재글
	Map<String, Object> fselectOne(int f_bno);

	// 4. 자유게시판 - 게시글 저장(파일저장)
	void fWrite(FBoardDto fbdto);

	// 4. 자유게시판 - 게시글 삭제
	void fDelete(int f_bno);

	// 4. 자유게시판 - 게시글 수정저장
	void doFUpdate(FBoardDto fbdto);

	// 4. 자유게시판 - 게시글 1개 가져오기 - 댓글 1개저장 후 댓글 1개 가져오기
	FCommentDto fCommentInsert(FCommentDto fcdto);

	// 4. 자유게시판 - 게시글 1개 가져오기 - 댓글 1개저장 후 댓글 1개 삭제
	String fCommentDelete(int f_cno);

	// 4. 자유게시판 - 게시글 1개 가져오기 - 댓글 수정저장
	FCommentDto fCommentUpdate(FCommentDto fcdto);

	// 4. 자유게시판 - 게시글 답글저장
	void doFReply(FBoardDto fbdto);


}// FService
