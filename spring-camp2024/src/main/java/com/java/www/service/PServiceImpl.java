package com.java.www.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.www.dto.PBoardDto;
import com.java.www.dto.PCommentDto;
import com.java.www.dto.PJoinDto;
import com.java.www.mapper.PBoardMapper;

import jakarta.servlet.http.HttpSession;

@Service
public class PServiceImpl implements PService {

	@Autowired
	PBoardMapper pboardMapper;
	@Autowired
	HttpSession session;

	@Override // 1. 파티원 모집 - 전체 리스트 가져오기 & 게시글 전체갯수
	public Map<String, Object> pSelectAll(int page, String pCategory, String pSearchWord) {

		// ② 파티원 모집 - 하단넘버링
		if (page < 0)
			page = 1;
		int rowPerPage = 10;
		int bottomArry = 10;
		int pCountAll = pboardMapper.pSelcountAll(pCategory, pSearchWord); // 게시글 전체갯수
		int maxArryPage = (int) Math.ceil((double) pCountAll / rowPerPage);
		int startArryPage = ((page - 1) / bottomArry) * bottomArry + 1;
		int endArryPage = (startArryPage + bottomArry) - 1;
		int startRow = (page - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;

		if (endArryPage > maxArryPage)
			endArryPage = maxArryPage;

		// ① Mapper연결 - 파티원 모집 전체 리스트 가져오기
		ArrayList<PBoardDto> list = pboardMapper.pSelectAll(startRow, endRow, pCategory, pSearchWord);

		// ③ map으로 여러개 데이터 담아서 전송(①+②)
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("page", page);
		map.put("startArryPage", startArryPage);
		map.put("endArryPage", endArryPage);
		map.put("maxArryPage", maxArryPage);

		// ④검색어 유형, 검색어 map으로 전송
		map.put("pCategory", pCategory);
		map.put("pSearchWord", pSearchWord);

		return map;
	}// pSelectAll(page, pCategory, pSearch)

	@Override // 파티원 모집 - 검색어 전체 리스트 가져오기 & 게시글 전체갯수
	public Map<String, Object> pSelectSearch(int page, String pCategory, String pSearchWord) {

		// ② 파티원 모집 - 하단넘버링
		if (page < 0)
			page = 1;
		int rowPerPage = 10;
		int bottomArry = 10;
		int pCountAll = pboardMapper.pSelSearchCountAll(pCategory, pSearchWord); // 게시글 검색 전체갯수
		System.out.println("검색어 총개수 : " + pCountAll);
		int maxArryPage = (int) Math.ceil((double) pCountAll / rowPerPage);
		int startArryPage = ((page - 1) / bottomArry) * bottomArry + 1;
		int endArryPage = (startArryPage + bottomArry) - 1;
		int startRow = (page - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;

		if (endArryPage > maxArryPage)
			endArryPage = maxArryPage;

		// ① Mapper연결 - 파티원 모집 검색어 전체 리스트 가져오기
		ArrayList<PBoardDto> list = pboardMapper.pSelectSearchAll(startRow, endRow, pCategory, pSearchWord);

		// ③ map으로 여러개 데이터 담아서 전송(①+②)
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pCountAll", pCountAll);
		map.put("page", page);
		map.put("startArryPage", startArryPage);
		map.put("endArryPage", endArryPage);
		map.put("maxArryPage", maxArryPage);

		return map;
	}// pSelectSearch(page, pCategory, pSearch)

	@Override // 2.파티원 모집 - 게시글 작성
	public void pWrite(PBoardDto pbdto) {
		// Mapper연결
		pboardMapper.pWrite(pbdto);
	}// pWrite(pbdto)

	@Override // 3. 파티원 모집 - 게시글 1개 가져오기
	public Map<String, Object> pSelectOne(int p_bno) {

		// mapper 연결
		PBoardDto pboardDto = pboardMapper.pSelectOne(p_bno); // 파티원 모집 - 게시글 1개 가져오기
		ArrayList<PJoinDto> pJoinList = pboardMapper.pJoinSelectAll(p_bno); // 파티원 모집 - 게시글 파티참여 인원 가져오기
		ArrayList<PCommentDto> pCommtList = pboardMapper.pCommentSelectAll(p_bno); // 파티원 모집 - 게시글 하단 댓글 모두가져오기

		// Map으로 전송
		Map<String, Object> map = new HashMap<>();
		map.put("pbdto", pboardDto);
		map.put("pJList", pJoinList);
		map.put("pCList", pCommtList);

		return map;
	}// pSelectOne(p_bno)

	@Override // 4. 파티원 모집 - 게시글 1개 수정하기 저장
	public void doPUpdate(PBoardDto pbdto) {
		// Mapper 연결
		pboardMapper.doPUpdate(pbdto);
	}// doFUpdate(pbdto)

	@Override // 5. 파티원 모집 - 게시글 1개 삭제하기
	public void pDelete(int p_bno) {
		// Mapper연결
		pboardMapper.pDelete(p_bno);
	}// pDelete(p_bno)

	@Override // 6. 파티원 참여
	public PJoinDto partyJoin(PJoinDto pjdto) {

		// Mapper연결(파티원 1명 참가) - selectKey를 쓰면 p_jcno 값이 할당됨
		pboardMapper.partyJoin(pjdto); // 파티원 모집 - 파티원 1명 참가(저장)
		System.out.println("PServiceImpl p_jcno: " + pjdto.getP_jcno());
		PJoinDto pJoinDto = pboardMapper.partySelectOne(pjdto.getP_jcno()); // 파티원 모집 - 파티원 1명 불러오기

		// 참가인원수 1증가(+1)
		pboardMapper.pJoinNum(pjdto.getP_bno()); // 참가인원 1증가(+)

		System.out.println("서비스 임플 p_jcno : " + pJoinDto.getP_jcno());
		System.out.println("서비스 임플 p_jcno : " + pJoinDto.getNickname());
		System.out.println("서비스 임플 p_jcno : " + pJoinDto.getM_img());
		return pJoinDto;
	}// partyJoin(pjdto)

	@Override // 7. 파티원 모집 1명 탈퇴(삭제)
	public String pJoinDelete(int p_jcno, PJoinDto pjdto) {
		System.out.println("삭제 글번호 : " + pjdto.getP_bno());
		String re = "";

		// Mapper연결
		int result = pboardMapper.pJoinDelete(p_jcno);

		// 참가인원수 1감소(-1)
		pboardMapper.pJoinNumDown(pjdto.getP_bno());

		return result + re;
	}// pJoinDelete(p_jcno, pjdto)

	@Override // 8. 파티원 모집 - 하단댓글 1개 저장
	public PCommentDto pCommentInsert(PCommentDto pcdto) {
		// session_id를 pcdto의 id에 저장
		pcdto.setId((String) session.getAttribute("session_id"));

		// Mapper연결
		pboardMapper.pCommentInsert(pcdto);
		System.out.println("서비스 임플 p_cno : " + pcdto.getP_cno());

		return pcdto;
	}// pCommentInsert(pcdto)

	@Override // 9. 파티원모집 - 하단댓글 1개 수정저장
	public PCommentDto pCommentUpdate(PCommentDto pcdto) {

		// ① session_id를 pcdto의 id에 저장
		pcdto.setId((String) session.getAttribute("session_id"));

		// ② 댓글 수정저장
		pboardMapper.pCommentUpdate(pcdto);

		// ③파티원 모집 - 원본댓글 1개 가져오기
		PCommentDto pCommentDto = pboardMapper.pCommentSelectOne(pcdto.getP_cno());
		return pCommentDto;

	}// pCommentUpdate(pcdto)

	@Override // 10. 파티원모집 - 하단댓글 1개 삭제
	public String pCommentDelete(int p_cno) {
		String re = "";

		// Mapper연결
		int result = pboardMapper.pCommentDelete(p_cno);
		return result + re;
	}// pCommentDelete(p_cno)

}// PServiceImpl(파티원 모집)
