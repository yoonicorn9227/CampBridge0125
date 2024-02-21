package com.java.www.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.java.www.dto.NBoardDto;
import com.java.www.dto.NCommentDto;

@Mapper
public interface NBoardMapper {
	
	//게시글 전체가져오기
	ArrayList<NBoardDto> selectAll(int startRow, int endRow, String category, String searchWord);
	
	//게시글 리스트 검색 가져오기
	ArrayList<NBoardDto> selectSearch(int startRow, int endRow, String category, String searchWord);
	
	//현재글 가져오기
	NBoardDto selectOne(int n_bno);
	//이전글 가져오기
	NBoardDto selectOnePrev(int n_bno);
	//다음글 가져오기
	NBoardDto selectOneNext(int n_bno);

	int bWrite(NBoardDto nbdto);

	//count 총 갯수
	int selectCountAll(String category, String searchWord);

	int donUpdate(NBoardDto nbdto);

	//게시글 삭제하기
	int nDelete(int n_bno);
	
	//글번호에 따른 댓글 모두 가져오기
	List<NCommentDto> commentSelectAll(int n_bno);

	//댓글 1개 저장
	void NCommnetInsert(NCommentDto ncdto);

	//댓글 1개 삭제
	int NCommnetDelete(int n_cno);

	//댓글 1개 저장하기
	void NCommentUpdate(NCommentDto ncdto);

	//댓글 1개 가져오기
	NCommentDto nCommentSelectOne(int n_cno);

	//조회수 증가
	void nbhitUp(int n_bno);



	

}
