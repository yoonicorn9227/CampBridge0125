package com.java.www.controller;

import java.io.File;
import java.util.Map;

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
import com.java.www.service.FService;

@Controller
@RequestMapping("community")
public class CController {
	@Autowired
	FService fService;

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

	// 2.파티원 모집 게시판Pg
	@GetMapping("pList")
	public String partyList() {
		return "/community/pList";
	}// pList()

	// 2.파티원 모집 게시글보기 Pg
	@GetMapping("pView")
	public String pView() {
		return "/community/pView";
	}// pView()

	// 2.파티원 모집 작성Pg
	@GetMapping("pWrite")
	public String pWrite() {
		return "/community/pWrite";
	}// pView()

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
		
	// 4.자유 게시글 - 하단댓글 1개저장
	@PostMapping("fCommentInsert")
	@ResponseBody //ajax - 데이터 전송
	public FCommentDto fCommentInsert(FCommentDto fcdto) {
		System.out.println("CController fView f_ccontent : " + fcdto.getF_ccontent());
		// service 연결 - 저장시간, f_cno
		FCommentDto fCommentDto = fService.fCommentInsert(fcdto); // 현재글
		System.out.println("CController fView f_bno : " + fcdto.getF_bno());

		return fCommentDto;
	}// fCommentInsert(fcdto)

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

	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 자유
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 게시판

}// CController
