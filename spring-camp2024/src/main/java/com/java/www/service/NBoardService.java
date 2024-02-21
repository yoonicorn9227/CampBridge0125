package com.java.www.service;

import java.util.Map;

import com.java.www.dto.NBoardDto;
import com.java.www.dto.NCommentDto;

public interface NBoardService {

	Map<String, Object> selectAll(int page, String category, String searchWord);

	Map<String, Object> selectOne(int n_bno);

	void bWrite(NBoardDto nbdto);

	void donUpdate(NBoardDto nbdto);

	//Map<String, Object> selectSearch(int page, String category, String searchWord);

	//게시글 삭제
	String nDelete(int n_bno);

	//댓글 저장하기
	NCommentDto NCommnetInsert(NCommentDto ncdto);

	//댓글 삭제하기
	int NCommnetDelete(int n_cno);

	//댓글 수정 및 저장하기
	NCommentDto NCommentUpdate(NCommentDto ncdto);

	
	
}
