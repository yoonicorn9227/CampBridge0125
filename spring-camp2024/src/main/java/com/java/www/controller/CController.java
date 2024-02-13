package com.java.www.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import org.eclipse.tags.shaded.org.apache.xpath.operations.Mult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.java.www.dto.FBoardDto;
import com.java.www.dto.FCommentDto;
import com.java.www.dto.PBoardDto;
import com.java.www.dto.PCommentDto;
import com.java.www.dto.PJoinDto;
import com.java.www.service.FService;
import com.java.www.service.PService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("community")
public class CController {
	@Autowired
	FService fService;

	@Autowired
	PService pService;

	@Autowired
	HttpSession session;

	// 1.공지사항 리스트
	@GetMapping("nList")
	public String nList() {
		return "/community/nList";
	}// nList()

	// 1.공지사항 게시글 보기
	@GetMapping("nView")
	public String nView() {
		return "/community/nView";
	}// nView()

	// 1.공지사항 게시글작성 페이지
	@GetMapping("nWrite")
	public String nWrite() {
		return "/community/nWrite";
	}// nWrite()

	// 1.공지사항 글수정 페이지
	@GetMapping("nUpdate")
	public String nUpdate() {
		return "/community/nUpdate";
	}// nUpdate()

	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 공지사항
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 게시판

	@GetMapping("psearch") // 파티원 모집 - 게시글 검색
	public String psearch(@RequestParam(defaultValue = "1") int page, @RequestParam(required = false) String pCategory,
			@RequestParam(required = false) String pSearchWord, Model model) {

		System.out.println("Controller 카테고리 : " + pCategory);
		System.out.println("Controller 검색어 : " + pSearchWord);

		// service연결
		Map<String, Object> map = pService.pSelectSearch(page, pCategory, pSearchWord);

		// model 저장 후 전송 ⓛlist → ②map
		model.addAttribute("map", map);

		return "/community/pList";
	}// pList(page,pCategory,pSearchWord)

	// 2.파티원 모집 게시판Pg - 게시글 전체가져오기
	@GetMapping("pList")
	public String pList(@RequestParam(defaultValue = "1") int page, @RequestParam(required = false) String pCategory,
			@RequestParam(required = false) String pSearchWord, Model model) {
		// service연결
		Map<String, Object> map = pService.pSelectAll(page, pCategory, pSearchWord);

		// model 저장 후 전송 ⓛlist → ②map
		model.addAttribute("map", map);

		return "/community/pList";
	}// pList()

	// 2.파티원 모집 게시글보기 Pg
	@GetMapping("pView")
	public String pView(@RequestParam(defaultValue = "1") int p_bno, Model model) {

		int joinCount = 0;
		// service 연결
		Map<String, Object> map = pService.pSelectOne(p_bno);

		// map에서 pJList를 가져옵니다.
		ArrayList<PJoinDto> pJList = (ArrayList<PJoinDto>) map.get("pJList");
		for (int i = 0; i < pJList.size(); i++) {
			if (session.getAttribute("session_id").equals(pJList.get(i).getId())) {
				joinCount = 1;
			} // if(파티참여여부0
		} // for

		map.put("joinCount", joinCount); // 파티참여여부 상태 map저장
		// model에 pJList를 저장합니다.

		// model 저장후 전송
		model.addAttribute("map", map);
		return "/community/pView";
	}// pView()

	@PostMapping("pDelete")
	public String pDelete(@RequestParam(defaultValue = "1") int p_bno, Model model) {
		// service 연결
		pService.pDelete(p_bno);

		// model 저장후 전송
		model.addAttribute("result", "pView-Delete");

		return "/community/doFBoard";
	}// pDelete(p_bno, model)

	// 2.파티원 모집 게시글 수정Pg
	@PostMapping("pUpdate")
	public String pUpdate(@RequestParam(defaultValue = "1") int p_bno, Model model) {

		// service연결
		Map<String, Object> map = pService.pSelectOne(p_bno);

		// model 저장후 전송
		model.addAttribute("map", map);

		return "/community/pUpdate";
	}// pUpdate(p_bno, model)

	// 2. 파티원 모집 - 게시글 수정 저장
	@PostMapping("doPUpdate")
	public String doPUpdate(PBoardDto pbdto, @RequestParam MultipartFile p_uBfile, Model model) throws Exception {

		if (!p_uBfile.isEmpty()) {
			String oriFName = p_uBfile.getOriginalFilename();
			long time = System.currentTimeMillis();
			String upFName = time + "_" + oriFName; // String upName = String.format("%s_%d", oriFName, time)
			String upload = "c:/upload/"; // 파일업로드 위치

			// 파일업로드
			File f = new File(upload + upFName);
			p_uBfile.transferTo(f);

			// pbdto파일이름 저장
			pbdto.setP_bfile(upFName);
		} else {
			pbdto.setP_bfile("");
		} // if(p_ufile)

		// service 연결
		pService.doPUpdate(pbdto);

		// model 저장후 전송
		model.addAttribute("result", "pUpdate-Save");

		return "/community/doFBoard";

	}// doFUpdate(pbdto, p_ufile, model)

	// 2.파티원 모집 - 게시글 하단댓글 1개저장
	@PostMapping("pCommentInsert")
	@ResponseBody // ajax - 데이터 전송
	public PCommentDto pCommentInsert(PCommentDto pcdto) {
		System.out.println("CController pView p_ccontent : " + pcdto.getP_ccontent());
		// service 연결 - 저장시간, f_cno
		PCommentDto pCommentDto = pService.pCommentInsert(pcdto); // 현재글
		System.out.println("CController fView f_bno : " + pcdto.getP_bno());

		return pCommentDto;
	}// pCommentInsert(pcdto)

	@PostMapping("partyJoin")
	@ResponseBody // ajax데이터 전송
	public PJoinDto partyJoin(PJoinDto pjdto) {
		System.out.println("Controller id:" + pjdto.getId());
		System.out.println("Controller bno:" + pjdto.getP_bno());

		// service연결
		PJoinDto pJoinDto = pService.partyJoin(pjdto);

		return pJoinDto;
	}// partyJoin

	// 2.파티원 모집 - 게시글 하단댓글 1개 삭제
	@PostMapping("pCommentDelete")
	@ResponseBody
	public String pCommentDelete(int p_cno) {
		String result = pService.pCommentDelete(p_cno);
		return result;
	}// pCommentDelete(p_cno)

	// 2.파티원 모집 - 파티원 탈퇴
	@PostMapping("pJoinDelete")
	@ResponseBody
	public String pJoinDelete(int p_jcno) {
		String result = pService.pJoinDelete(p_jcno);
		return result;
	}// pJoinDelete(p_jcno)

	// 2. 자유게시글 -하단댓글 1개 수정저장
	@PostMapping("pCommentUpdate")
	@ResponseBody
	public PCommentDto pCommentUpdate(PCommentDto pcdto) {
		System.out.println("CController pCommentUpdate p_cno : " + pcdto.getP_cno());

		// service 연결 - 댓글수정저장
		PCommentDto pCommentDto = pService.pCommentUpdate(pcdto);

		return pCommentDto;
	}// pCommentUpdate(p_cno)

	// 2.파티원 모집 작성Pg
	@GetMapping("pWrite")
	public String pWrite() {
		return "/community/pWrite";
	}// pWrite

	// 2.파티원 모집 글저장
	@PostMapping("pWrite")
	public String pWrite(PBoardDto pbdto, @RequestParam MultipartFile pFile, Model model) throws Exception {
		System.out.println("Ccontroller pbdto p_btitle : " + pbdto.getP_btitle());
		System.out.println("Ccontroller pbdto p_bcontent : " + pbdto.getP_bcontent());

		if (!pFile.isEmpty()) {
			String oriFName = pFile.getOriginalFilename();
			long time = System.currentTimeMillis();
			String upFName = time + "_" + oriFName;
			String fupload = "c:/upload/";

			// 파일업로드 부분
			File f = new File(fupload + upFName);
			pFile.transferTo(f);

			// pbdto f_bfile추가
			pbdto.setP_bfile(upFName);
		} else {
			pbdto.setP_bfile("");
		} // if-else

		System.out.println("파일첨부 이름 : " + pbdto.getP_bfile());

		// service연결 - 파일저장
		pService.pWrite(pbdto);

		// model
		model.addAttribute("result", "pWrite-Save");
		return "/community/doFBoard";
	}// pWrite()

	// 4.SummerNote 내용부분 - 이미지 추가시 파일업로드
	@PostMapping("summernotePartyWrite")
	@ResponseBody
	public String summernotePartyWrite(@RequestParam MultipartFile pFile) throws Exception {
		String urlLink = "";
		if (!pFile.isEmpty()) {
			String oriFName = pFile.getOriginalFilename();
			long time = System.currentTimeMillis();
			String upFName = time + "_" + oriFName;
			String fupload = "c:/upload/";

			// 파일업로드 부분
			File f = new File(fupload + upFName);
			pFile.transferTo(f);

			// 파일저장위치
			urlLink = "/upload/" + upFName;
			System.out.println("summernoteUpload 파일저장 위치 : " + urlLink);
		} // if
		return urlLink;
	}// pWrite(summernotePartyWrite)

	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 파티원
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 모집
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 게시판

	// 3.꿀팁 게시판 리스트Pg
	@GetMapping("tList")
	public String tipList() {
		return "/community/tList";
	}// tList()

	// 3.꿀팁 게시글 보기Pg
	@GetMapping("tView")
	public String tView() {
		return "/community/tView";
	}// tView()

	// 3.꿀팁 게시글 작성Pg
	@GetMapping("tWrite")
	public String tWrite() {
		return "/community/tWrite";
	}// tWrite()

	// 3. 꿀팁 게시글 수정Pg
	@GetMapping("tUpdate")
	public String tUpdate() {
		return "/community/tUpdate";
	}// tUpdate()

	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 꿀팁
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 게시판

	// 4.자유 게시판 리스트Pg
	@GetMapping("fList")
	public String fList(@RequestParam(defaultValue = "1") int page, @RequestParam(required = false) String searchTitle,
			@RequestParam(required = false) String searchWord, Model model) {
		System.out.println("CController searchTitle : " + searchTitle);
		System.out.println("CController searchWord : " + searchWord);

		// service연결(list)
		Map<String, Object> map = fService.fselectAll(page, searchTitle, searchWord);

		// model전송
		model.addAttribute("map", map);

		return "/community/fList";
	}// fList()

	// 4.자유 게시판 - 게시글 검색
	@GetMapping("fsearch")
	public String fsearch(@RequestParam(defaultValue = "1") int page,
			@RequestParam(required = false) String searchTitle, @RequestParam(required = false) String searchWord,
			Model model) {

		System.out.println("CController searchTitle : " + searchTitle);
		System.out.println("CController searchWord : " + searchWord);

		// service연결(list)
		Map<String, Object> map = fService.fselectSearch(page, searchTitle, searchWord);

		// model전송
		model.addAttribute("map", map);

		return "/community/fList";
	}// fsearch()

	// 4.자유 게시글 보기Pg
	@GetMapping("fView")
	public String fView(@RequestParam(defaultValue = "1") int f_bno, Model model) {
		System.out.println("CController fView f_bno : " + f_bno);
		// service 연결(fbdto), 이전글,현재글, 다음글 가져오기
		Map<String, Object> map = fService.fselectOne(f_bno); // 현재글

		// model 전송
		model.addAttribute("map", map);
		return "/community/fView";
	}// fView()

	// 4.자유 게시글 삭제
	@PostMapping("fDelete")
	public String fDelete(@RequestParam(defaultValue = "1") int f_bno, Model model) {
		System.out.println("CController fDelete f_bno : " + f_bno);

		// service연결
		fService.fDelete(f_bno);

		// model
		model.addAttribute("result", "fView-Delete");

		return "/community/doFBoard";
	}// fDelete

	// 4.자유 게시글 - 하단댓글 1개저장
	@PostMapping("fCommentInsert")
	@ResponseBody // ajax - 데이터 전송
	public FCommentDto fCommentInsert(FCommentDto fcdto) {
		System.out.println("CController fView f_ccontent : " + fcdto.getF_ccontent());
		// service 연결 - 저장시간, f_cno
		FCommentDto fCommentDto = fService.fCommentInsert(fcdto); // 현재글
		System.out.println("CController fView f_bno : " + fcdto.getF_bno());

		return fCommentDto;
	}// fCommentInsert(fcdto)

	// 4.자유 게시글 - 하단댓글 1개삭제
	@PostMapping("fCommentDelete")
	@ResponseBody // ajax - 데이터 전송
	public String fCommentDelete(int f_cno) {
		System.out.println("CController 댓글삭제번호 : " + f_cno);

		// service연결
		String result = fService.fCommentDelete(f_cno);

		return result;
	}// fCommentDelete(f_cno)

	// 4. 자유게시글 -하단댓글 1개 수정저장
	@PostMapping("fCommentUpdate")
	@ResponseBody
	public FCommentDto fCommentUpdate(FCommentDto fcdto) {
		System.out.println("CController fCommentUpdate f_cno : " + fcdto.getF_cno());

		// service 연결 - 댓글수정저장
		FCommentDto fCommentDto = fService.fCommentUpdate(fcdto);

		return fCommentDto;
	}// fCommentUpdate(f_cno)

	// 4.자유 게시글 작성Pg
	@GetMapping("fWrite")
	public String fWrite() {
		return "/community/fWrite";
	}// fWrite

	// 4.자유 게시글 작성(작성 클릭시 파일업로드)
	@PostMapping("fWrite")
	public String fWrite(FBoardDto fbdto, @RequestParam MultipartFile fFile, Model model) throws Exception {
		System.out.println("Ccontroller fbdto f_btitle : " + fbdto.getF_btitle());
		System.out.println("Ccontroller fbdto f_bcontent : " + fbdto.getF_bcontent());
		System.out.println("Ccontroller fbdto f_bcontent : " + fbdto.getId());
		// System.out.println("Ccontroller fbdto btype :"+fbdto.getF_btype());
		if (!fFile.isEmpty()) {
			String oriFName = fFile.getOriginalFilename();
			long time = System.currentTimeMillis();
			String upFName = time + "_" + oriFName;
			String fupload = "c:/upload/";

			// 파일업로드 부분
			File f = new File(fupload + upFName);
			fFile.transferTo(f);

			// fbdto f_bfile추가
			fbdto.setF_bfile(upFName);
		} else {
			fbdto.setF_bfile("");
		} // if-else

		System.out.println("파일첨부 이름 : " + fbdto.getF_bfile());

		// service연결 - 파일저장
		fService.fWrite(fbdto);

		// model
		model.addAttribute("result", "fWrite-Save");
		return "/community/doFBoard";
	}// fWrite()

	// 4.SummerNote 내용부분 - 이미지 추가시 파일업로드
	@PostMapping("summernoteUpload")
	@ResponseBody
	public String summernoteUpload(@RequestParam MultipartFile fFile) throws Exception {
		String urlLink = "";
		if (!fFile.isEmpty()) {
			String oriFName = fFile.getOriginalFilename();
			long time = System.currentTimeMillis();
			String upFName = time + "_" + oriFName;
			String fupload = "c:/upload/";

			// 파일업로드 부분
			File f = new File(fupload + upFName);
			fFile.transferTo(f);

			// 파일저장위치
			urlLink = "/upload/" + upFName;
			System.out.println("summernoteUpload 파일저장 위치 : " + urlLink);
		} // if
		return urlLink;
	}// summerNote

	// 4.자유게시글 수정Pg
	@PostMapping("fUpdate")
	public String fUpdate(@RequestParam(defaultValue = "1") int f_bno, Model model) {

		System.out.println("CController fUpdate f_bno : " + f_bno);
		// service 연결(fbdto)
		Map<String, Object> map = fService.fselectOne(f_bno); // 게시글 1개 가져오기

		// model 전송
		model.addAttribute("map", map);

		return "/community/fUpdate";
	}// fUpdate()

	// 4.자유게시글 수정저장
	@PostMapping("doFUpdate")
	public String doFUpdate(FBoardDto fbdto, @RequestPart MultipartFile uFile, Model model) throws Exception {

		// fbdto ->fFile
		System.out.println("CController doFUpdate f_bno : " + fbdto.getF_bno());
		if (!uFile.isEmpty()) {
			String oriFName = uFile.getOriginalFilename();
			long time = System.currentTimeMillis();
			String upFName = time + "_" + oriFName; // String upName = String.format("%s_%d", oriFName, time)
			String upload = "c:/upload/"; // 파일업로드 위치

			// 파일업로드
			File f = new File(upload + upFName);
			uFile.transferTo(f);

			// fbdto파일이름 저장
			fbdto.setF_bfile(upFName);
		} else {
			fbdto.setF_bfile("");
		} // if(uFile)

		// service연결
		fService.doFUpdate(fbdto); // 새로운 파일업로드가 없으면 기존파일이름 그대로 사용

		// model
		model.addAttribute("result", "fUpdate-Save");

		return "/community/doFBoard";
	}// doFUpdate

	// 4.SummerNote 답글 내용부분 - 이미지 추가시 파일업로드
	@PostMapping("summernoteFReplyUpload")
	@ResponseBody
	public String summernoteFReplyUpload(@RequestParam MultipartFile rfFile) throws Exception {
		String urlLink = "";
		if (!rfFile.isEmpty()) {
			String oriFName = rfFile.getOriginalFilename();
			long time = System.currentTimeMillis();
			String upFName = time + "_" + oriFName;
			String fupload = "c:/upload/";

			// 파일업로드 부분
			File f = new File(fupload + upFName);
			rfFile.transferTo(f);

			// 파일저장위치
			urlLink = "/upload/" + upFName;
			System.out.println("summernoteUpload 파일저장 위치 : " + urlLink);
		} // if
		return urlLink;
	}// summerNote

	// 4.자유게시글 답글Pg
	@PostMapping("fReply")
	public String fReply(@RequestParam(defaultValue = "1") int f_bno, Model model) {
		System.out.println("CController fReply f_bno : " + f_bno);

		// service 연결(fbdto)
		Map<String, Object> map = fService.fselectOne(f_bno); // 게시글 1개 가져오기

		// model 전송
		model.addAttribute("map", map);

		return "/community/fReply";
	}// fReply()

	// 4.자유게시글 답글저장
	@PostMapping("doFReply")
	public String doFReply(FBoardDto fbdto, @RequestPart MultipartFile rFile, Model model) throws Exception {

		// fbdto ->fRFile
		System.out.println("CController doFUpdate f_bno : " + fbdto.getF_bno());
		// 답변달기 - f_bgroup, f_bstep, f_bindent 값이 있어야 함.
		if (!rFile.isEmpty()) {
			String oriFName = rFile.getOriginalFilename();
			long time = System.currentTimeMillis();
			String upFName = time + "_" + oriFName; // String upName = String.format("%s_%d", oriFName, time)
			String upload = "c:/upload/"; // 파일업로드 위치

			// 파일업로드
			File f = new File(upload + upFName);
			rFile.transferTo(f);

			// fbdto파일이름 저장
			fbdto.setF_bfile(upFName);
		} else {
			fbdto.setF_bfile("");
		} // if(rFile)

		// service연결
		fService.doFReply(fbdto); // 새로운 파일업로드가 없으면 기존파일이름 그대로 사용

		// model
		model.addAttribute("result", "fReply-Save");

		return "/community/doFBoard";
	}// doFReply
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 자유
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 게시판

}// CController
