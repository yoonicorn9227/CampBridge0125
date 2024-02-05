package com.java.www.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.www.dto.FBoardDto;
import com.java.www.dto.FCommentDto;
import com.java.www.mapper.FBoardMapper;

import jakarta.servlet.http.HttpSession;

@Service
public class FServiceImpl implements FService {
	@Autowired
	FBoardMapper fboardMapper;

	@Autowired
	HttpSession session;

	@Override // 자유게시판 검색어 리스트
	public Map<String, Object> fselectSearch(int page, String searchTitle, String searchWord) {
		// 게시글 전체가져오기
		// ♠하단넘버링 (page, rowPerPage : 1pg당 게시글 갯수, startPage, endPage, maxPage)
		if (page <= 0)
			page = 1;
		int rowPerPage = 10; // 1pg당 게시글 10개
		int bottomNum = 10; // 하단 넘버링 갯수(10개)
		int fcountAll = fboardMapper.fSearchCount(searchTitle, searchWord); // 게시글 검색 총갯수
		System.out.println("FServiceImpl fScountAll : " + fcountAll);
		int maxPageNum = (int) Math.ceil((double) fcountAll / rowPerPage);
		int startPageNum = ((page - 1) / 10) * 10 + 1; // 하단넘버링 시작번호 (9-1)/10 = 0.9 -> 0 || 0*10+1=1
		int endPageNum = (startPageNum + bottomNum) - 1; // 하단넘버링 끝번호

		int startRow = (page - 1) * rowPerPage + 1; // 페이지에서 게시글 시작번호
		int endRow = startRow + rowPerPage - 1; // 페이지에서 게시글 끝번호

		// 하단넘버링 최대페이지보다 하단넘버링 끝번호보다 작을경우.
		if (endPageNum > maxPageNum)
			endPageNum = maxPageNum;
		ArrayList<FBoardDto> list = fboardMapper.fSelectSearch(startRow, endRow, searchTitle, searchWord);

		// 데이터 전송 - list, page, maxPageNum startPageNum, endPageNum

		// Map으로 전송(return -> map / 리턴타입 ArrayList에서 Map으로 변경)
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("page", page);
		map.put("maxPageNum", maxPageNum);
		map.put("startPageNum", startPageNum);
		map.put("endPageNum", endPageNum);

		return map;
	}// fselectSearch

	@Override // 자유게시판 전체가져오기
	public Map<String, Object> fselectAll(int page, String searchTitle, String searchWord) {

		// 게시글 전체가져오기
		// ♠하단넘버링 (page, rowPerPage : 1pg당 게시글 갯수, startPage, endPage, maxPage)
		if (page <= 0)
			page = 1;
		int rowPerPage = 10; // 1pg당 게시글 10개
		int bottomNum = 10; // 하단 넘버링 갯수(10개)
		int fcountAll = fboardMapper.fSelcountAll(searchTitle, searchWord); // 게시글 총갯수
		int maxPageNum = (int) Math.ceil((double) fcountAll / rowPerPage);
		int startPageNum = ((page - 1) / 10) * 10 + 1; // 하단넘버링 시작번호 (9-1)/10 = 0.9 -> 0 || 0*10+1=1
		int endPageNum = (startPageNum + bottomNum) - 1; // 하단넘버링 끝번호

		int startRow = (page - 1) * rowPerPage + 1; // 페이지에서 게시글 시작번호
		int endRow = startRow + rowPerPage - 1; // 페이지에서 게시글 끝번호

		// 하단넘버링 최대페이지보다 하단넘버링 끝번호보다 작을경우.
		if (endPageNum > maxPageNum)
			endPageNum = maxPageNum;
		ArrayList<FBoardDto> list = fboardMapper.fselectAll(startRow, endRow, searchTitle, searchWord);

		// 데이터 전송 - list, page, maxPageNum startPageNum, endPageNum

		// Map으로 전송(return -> map / 리턴타입 ArrayList에서 Map으로 변경)
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("page", page);
		map.put("maxPageNum", maxPageNum);
		map.put("startPageNum", startPageNum);
		map.put("endPageNum", endPageNum);
		map.put("searchTitle", searchTitle);
		map.put("searchWord", searchWord);

		return map;
	}// fselectAll(page)

	@Override // 자유게시판 - 게시글 저장(파일저장)
	public void fWrite(FBoardDto fbdto) {
		fboardMapper.fWrite(fbdto);
	}// fWrite(fbdto)

	@Override // 자유게시판-자유게시글 1개 가져오기 - 현재글
	public Map<String, Object> fselectOne(int f_bno) {
		System.out.println("FServiceImpl FselectOne f_bno : " + f_bno);

		FBoardDto fbdto = fboardMapper.fSelectOne(f_bno); // 현재글
		FBoardDto prevFbdto = fboardMapper.fSelectOnePrev(f_bno); // 이전글
		FBoardDto nextFbdto = fboardMapper.fSelectOneNext(f_bno); // 다음글

		// 하단댓글 모두 가져오기
		ArrayList<FCommentDto> fCmmtlist = fboardMapper.fCommentSelectAll(f_bno);

		// 조회수 1증가
		fboardMapper.fHitUp(f_bno);

		// Map으로 전송
		Map<String, Object> map = new HashMap<>();
		map.put("fbdto", fbdto);
		map.put("prevFbdto", prevFbdto);
		map.put("nextFbdto", nextFbdto);
		map.put("fCmmtlist", fCmmtlist);

		return map;
	}// fselectOne(f_bno)

	@Override // 자유게시판 -자유게시글 1개 삭제
	public void fDelete(int f_bno) {

		fboardMapper.fDelete(f_bno);

	}// fDelete(f_bno)

	@Override // 자유게시판 - 자유게시글 수정저장
	public void doFUpdate(FBoardDto fbdto) {
		fboardMapper.doFUpdate(fbdto);
	}// doFUpdate(fbdto)

	@Override // 자유게시판 - 자유게시글 1개 가져오기 - 하단 댓글1개저장 및 댓글 1개 가져오기
	public FCommentDto fCommentInsert(FCommentDto fcdto) {

		// session_id를 fcdto의 id에 저장
		fcdto.setId((String) session.getAttribute("session_id"));

		// 댓글 1개저장
		fboardMapper.fCommentInsert(fcdto); // 댓글폼에서 입력한 글자 저장

		System.out.println("서비스 임플 f_cno : " + fcdto.getF_cno());

		// 댓글 1개자져오기
		// FCommentDto fCommentDto = fboardMapper.FCommentSelectOne(fcdto.getF_cno());

		return fcdto;
	}// fCommentInsert(fcdto)

	@Override // 자유게시판 - 자유게시글 1개 가져오기 - 하단댓글 1개삭제
	public String fCommentDelete(int f_cno) {
		String result = "";
		int re = fboardMapper.fCommentDelete(f_cno);
		return result + re;
	}// fCommentDelete(f_cno)

	@Override // 자유게시판 - 자유게시글 1개 가져오기 - 하단댓글 수정저장
	public FCommentDto fCommentUpdate(FCommentDto fcdto) {
		// session_id를 fcdto의 id에 저장
		fcdto.setId((String) session.getAttribute("session_id"));

		// 댓글 수정저장
		fboardMapper.FCommentUpdate(fcdto);

		// 댓글 1개가져오기
		FCommentDto fCommentDto = fboardMapper.FCommentSelectOne(fcdto.getF_cno());

		return fCommentDto;
	}// fCommentUpdate(fcdto)

	@Override // 자유게시판 - 자유게시글 답변저장
	public void doFReply(FBoardDto fbdto) {

		// 답글저장
		// ① 부모보다 큰 f_bstep은 1씩증가시킴
		// ② 답변달기 글의 f_bstep은 부모의 f_bstep 에서 +1 하기 : fbdto.setF_bstep(fbdto.getF_bstep()+1); → fboardMapper에서 쿼리문으로 대체 #{f_bstep}+1
		// ③ f_bindent는 부모의 f_bindent에서 +1 더하기 : fbdto.setF_bindent(fbdto.getF_bindent()+1); → fboardMapper에서 쿼리문으로 대체  #{f_bindent}+1
		// f_bgroup은 부모와 같음

		// ①f_bstep 1증가
		fboardMapper.fBstepUp(fbdto);

		fboardMapper.doFReply(fbdto);

	}// doFReply(fbdto)

}// FServiceImpl
