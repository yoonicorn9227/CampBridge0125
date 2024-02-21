package com.java.www.controller;

import java.io.File;
import java.util.ArrayList;
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
import com.java.www.dto.NBoardDto;
import com.java.www.dto.NCommentDto;
import com.java.www.dto.PBoardDto;
import com.java.www.dto.PCommentDto;
import com.java.www.dto.PJoinDto;
import com.java.www.dto.TBCommentDto;
import com.java.www.dto.TBoardDto;
import com.java.www.service.FService;
import com.java.www.service.NBoardService;
import com.java.www.service.PService;
import com.java.www.service.TBService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("community")
public class CController {

	@Autowired
	NBoardService nbService;
	@Autowired
	FService fService;
	@Autowired
	PService pService;
	@Autowired
	TBService tbService;
	@Autowired
	HttpSession session;

	// 1.공지사항 리스트 session_id 확인하기
	@GetMapping("session_check")
	@ResponseBody
	public String session_check() {

		String session_id = (String) session.getAttribute("session_id");

		if ("admin".equals(session_id)) {
			return "possible";
		} else {
			return "imposs";
		}
	}// nList()

	// 1.공지사항 리스트
	@GetMapping("nList")
	public String nList(Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(required = false) String category, @RequestParam(required = false) String searchWord) {

		// service 연결
		Map<String, Object> map = nbService.selectAll(page, category, searchWord);

		model.addAttribute("map", map);

		return "/community/nList";
	}// nList()

	// 1.공지사항 1개 게시글 가져오기 /댓글 모두 가져오기
	@GetMapping("nView")
	public String nView(@RequestParam(defaultValue = "1") int n_bno, Model model) {
		System.out.println("CController nView bno :" + n_bno);

		Map<String, Object> map = nbService.selectOne(n_bno);
		model.addAttribute("map", map);
		System.out.println("Controller nView bno :" + n_bno);

		return "/community/nView";
	}// nView()

	// 1.공지사항 댓글 저장
	@PostMapping("NCommnetInsert")
	@ResponseBody
	public NCommentDto NCommnetInsert(NCommentDto ncdto) {
		System.out.println("컨트롤러 NCommnetInsert n_ccontent" + ncdto.getN_cno());
		NCommentDto nCommentDto = nbService.NCommnetInsert(ncdto);

		return nCommentDto;
	}// NCommnetInsert

	// 1.공지사항 댓글 삭제
	@PostMapping("NCommnetDelete")
	@ResponseBody
	public String NCommnetDelete(int n_cno) {
		int result = nbService.NCommnetDelete(n_cno);

		return result + "";
	}// NCommnetDelete

	// 1. 공지사항 댓글 수정
	@PostMapping("NCommentUpdate")
	@ResponseBody
	public NCommentDto NCommentUpdate(NCommentDto ncdto) {
		NCommentDto nCommentDto = nbService.NCommentUpdate(ncdto);
		return nCommentDto;
	}// NCommentUpdate

	// 1.공지사항 게시글작성 페이지
	@GetMapping("nWrite")
	public String nWrite() {
		return "/community/nWrite";
	}// nWrite()

	@PostMapping("nWrite")
	public String nWrite(@RequestPart MultipartFile files1, NBoardDto nbdto, Model model) throws Exception {

		if (!files1.isEmpty()) {
			System.out.println("파일이 있어요!!!");
			String orgName = files1.getOriginalFilename();
			System.out.println("CController nWrite 파일첨부 이름 :" + orgName);
			long time = System.currentTimeMillis();
			String newName = time + "_" + orgName;
			String upload = "C:/upload/";
			File f = new File(upload + newName);
			files1.transferTo(f);
			nbdto.setN_bfile(newName);
		} else {
			nbdto.setN_bfile("");
			System.out.println("파일 첨부가 없습니다.");
		}

		nbService.bWrite(nbdto);
		model.addAttribute("result", "Update-S");

		return "/community/nResult";
	}// nWrite()

	// 1.공지사항 게시글 삭제
	@GetMapping("nDelete")
	public String nDelete(@RequestParam(defaultValue = "1") int n_bno, Model model) {
		String result = nbService.nDelete(n_bno);
		model.addAttribute("result", "nView-D");
		return "/community/nResult";
	}// nUpdate()

	// 1.공지사항 글수정 페이지
	@GetMapping("nUpdate")
	public String nUpdate(@RequestParam(defaultValue = "1") int n_bno, Model model) {
		Map<String, Object> map = nbService.selectOne(n_bno);
		model.addAttribute("map", map);
		return "/community/nUpdate";
	}// nUpdate()

	@PostMapping("donUpdate")
	public String donUpdate(NBoardDto nbdto, @RequestPart MultipartFile files1, Model model) throws Exception {
		String orgName = "";
		String newName = "";

		if (!files1.isEmpty())
			orgName = files1.getOriginalFilename();
		long time = System.currentTimeMillis();
		newName = time + "_" + orgName;
		String upload = "c:/upload/";
		File f = new File(upload + newName);
		files1.transferTo(f);
		nbdto.setN_bfile(newName);

		nbService.donUpdate(nbdto);
		model.addAttribute("result", "Update-W");
		return "/community/nResult";

	}// nUpdate()

	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 공지사항게시판

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
	}// pList(page, pCategory, pSearchWord, model)

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
	}// pWrite(pbdto, pFile, model)

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
	}// SummerNote(파티원 글작성)

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
			} // if(파티참여여부0)
		} // for

		map.put("joinCount", joinCount); // 파티참여여부 상태 map저장
		// model에 pJList를 저장합니다.

		// model 저장후 전송
		model.addAttribute("map", map);
		return "/community/pView";
	}// pView()

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

	// 4.SummerNote 내용부분 - 이미지 추가시 파일업로드
	@PostMapping("summernotePartyUpdate")
	@ResponseBody
	public String summernotePartyUpdate(@RequestParam MultipartFile p_uBfile) throws Exception {
		String urlLink = "";
		if (!p_uBfile.isEmpty()) {
			String oriFName = p_uBfile.getOriginalFilename();
			long time = System.currentTimeMillis();
			String upFName = time + "_" + oriFName;
			String fupload = "c:/upload/";

			// 파일업로드 부분
			File f = new File(fupload + upFName);
			p_uBfile.transferTo(f);

			// 파일저장위치
			urlLink = "/upload/" + upFName;
			System.out.println("summernoteUpload 파일저장 위치 : " + urlLink);
		} // if
		return urlLink;
	}// SummerNote(파티원 글수정)

	@PostMapping("pDelete")
	public String pDelete(@RequestParam(defaultValue = "1") int p_bno, Model model) {
		// service 연결
		pService.pDelete(p_bno);

		// model 저장후 전송
		model.addAttribute("result", "pView-Delete");

		return "/community/doFBoard";
	}// pDelete(p_bno, model)

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
	}// partyJoin(pjdto)

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
	public String pJoinDelete(int p_jcno, PJoinDto pjdto) {
		String result = pService.pJoinDelete(p_jcno, pjdto);
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

	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 파티원모집
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 게시판

	// 3.꿀팁 게시판 리스트Pg
	@GetMapping("tsearch") // 꿀팁 - 게시글 검색
	public String tsearch(@RequestParam(defaultValue = "1") int page,
			@RequestParam(required = false) String searchTitle, @RequestParam(required = false) String searchWord,
			Model model) {

		System.out.println("CController tsearch searchTitle : " + searchTitle);
		System.out.println("CController tsearch searchWord : " + searchWord);

		// db에서 가져오기
		Map<String, Object> map = tbService.tb_selectSearch(page, searchTitle, searchWord);
		// model에 저장
		model.addAttribute("map", map);
		System.out.println("게시글 총 개수 : " + (int) map.get("countAll"));
		return "/community/tList";
	}// tsearch() //꿀팁 - 게시글 검색

	// 3.꿀팁 게시판 리스트Pg
	@GetMapping("tList") // 게시글 전체 가져오기
	public String tipList(@RequestParam(defaultValue = "1") int page,
			@RequestParam(required = false) String searchTitle, @RequestParam(required = false) String searchWord,
			Model model) {
		// db에서 가져오기
		Map<String, Object> map = tbService.tb_selectAll(page, searchTitle, searchWord);
		// model에 저장
		model.addAttribute("map", map);
		System.out.println("게시글 총 개수 :" + (int) map.get("countAll"));
		return "/community/tList";
	}// tList()//게시글 전체 가져오기

	// 3.꿀팁 게시글 보기Pg
	@GetMapping("tView") // 게시글 1개 가져오기
	public String tView(@RequestParam(defaultValue = "1") int t_bno, Model model) {
		System.out.println("CController tView t_bno : " + t_bno);
		// 게시글 1개 가져오기
		Map<String, Object> map = tbService.tb_selectOne(t_bno);

		// model에 저장
		model.addAttribute("map", map);
		return "/community/tView";
	}// tView()//게시글 1개 가져오기

	// 3.꿀팁 게시글 작성Pg
	@GetMapping("tWrite") // 글쓰기 화면보기
	public String tWrite() {
		return "/community/tWrite";
	}// tWrite() //글쓰기 화면보기

	// 3.꿀팁 게시글 작성Pg
	@PostMapping("tWrite") // 글쓰기저장, 오버로딩
	public String tWrite(TBoardDto tbdto, @RequestPart MultipartFile tfile, Model model) throws Exception {

		if (!tfile.isEmpty()) {// 파일 첨부가 있을 시 (파일이 비어있지 않다면)
			String orgName = tfile.getOriginalFilename();
			System.out.println("CController 파일첨부 이름 : " + orgName);
			long time = System.currentTimeMillis();
			String newName = time + "_" + orgName; // 중복방지를 위해 새로운 이름
			String upload = "c:/upload/";
			File f = new File(upload + newName);
			tfile.transferTo(f); // 파일을 저장위치에 저장시킴
			tbdto.setT_bfile(newName); // 파일이름을 TBoardDto에 저장시킴
		} else {// 파일첨부가 없다면
			tbdto.setT_bfile("");
			System.out.println("파일첨부가 없습니다.");
		}
		// db로 전송
		tbService.tWrite(tbdto);
		// model
		model.addAttribute("result", "tWrite_Save");
		return "/community/doTBoard";
	}// tWrite() //글쓰기저장, 오버로딩

	// 3. 꿀팁 게시글 삭제Pg
	// 게시글 삭제
	@GetMapping("tDelete")
	public String tDelete(@RequestParam(defaultValue = "1") int t_bno) {
		System.out.println("controller tDelete t_bno :" + t_bno);
		tbService.tDelete(t_bno);
		return "community/tDelete";
	}

	// 3. 꿀팁 게시글 수정Pg
	// 게시글 수정페이지 보기
	@GetMapping("tUpdate")
	public String tUpdate(@RequestParam(defaultValue = "1") int t_bno, Model model) {
		System.out.println("TBController tUpdate 수정페이지 보기 : " + t_bno);
		Map<String, Object> map = tbService.tb_selectOne(t_bno);
		model.addAttribute("map", map);
		return "community/tUpdate";
	}

	// 3. 꿀팁 게시글 수정Pg
	// 게시글 수정페이지 저장
	@PostMapping("doTBUpdate")
	public String doTBUpdate(TBoardDto tbdto, @RequestPart MultipartFile files) throws Exception {

		System.out.println("번호 : " + tbdto.getT_bno());
		System.out.println("제목 : " + tbdto.getT_btitle());
		System.out.println("내용 : " + tbdto.getT_bcontent());
		System.out.println("파일 : " + tbdto.getT_bfile());

		String orgName = "";
		String newName = "";
		if (!files.isEmpty()) {
			orgName = files.getOriginalFilename();
			long time = System.currentTimeMillis();
			newName = time + "_" + orgName;
			String upload = "c:/upload/";
			File f = new File(upload + newName);
			files.transferTo(f);
			tbdto.setT_bfile(newName);

			System.out.println("doTBUpdate tbdto" + tbdto.getT_bno());
			System.out.println("doTBUpdate tbdto" + tbdto.getId());

		} // if
			// db전송
		tbService.doTBUpdate(tbdto);
		System.out.println("TBController doTBUpdate tbdto:" + tbdto);

		return "/community/doTBUpdate";
	}

	// 3.꿀팁 답변 달기Pg
	// 답변달기 페이지 보기
	@GetMapping("tReply")
	public String tReply(@RequestParam(defaultValue = "1") int t_bno, Model model) {
		System.out.println("TBController tReply t_bno" + t_bno);
		Map<String, Object> map = tbService.tb_selectOne(t_bno);
		model.addAttribute("map", map);
		return "/community/tReply";
	}

	// 3.꿀팁 답변 달기Pg
	// 답변달기 저장
	@PostMapping("doTBReply")
	public String doTBReply(TBoardDto tbdto, @RequestPart MultipartFile tfiles, Model model) throws Exception {
		System.out.println("TBController 번호 :" + tbdto.getT_bno());
		System.out.println("TBController 아이디 :" + tbdto.getId());
		System.out.println("TBController 파일 :" + tbdto.getT_bfile());

		// 답변달기 값들은 tbdto에 담겨져 있음
		// 파일첨부의 파일이름
		if (!tfiles.isEmpty()) { // 파일첨부가 있으면
			String orgName = tfiles.getOriginalFilename();
			System.out.println("TBController doTBReply 파일첨부 이름 : " + orgName);
			long time = System.currentTimeMillis();
			String newName = time + "_" + orgName; // 중복방지를 위해 새로운 이름
			String upload = "c:/upload/";
			File f = new File(upload + newName);
			tfiles.transferTo(f); // 파일을 저장위치에 저장시킴
			tbdto.setT_bfile(newName); // 파일이름을 TBoardDto에 저장시킴
		} else { // 파일첨부가 없으면
			tbdto.setT_bfile("");
			System.out.println("doTBReply 파일 첨부가 없습니다.");
		}
		// db로 전송
		tbService.doTBReply(tbdto);

		return "/community/doTBReply";
	}

	// ================= 댓글 ===================
	// 3.꿀팁 댓글 작성Pg
	@PostMapping("t_BCommentInsert") // 댓글 1개 입력
	@ResponseBody // ajax-데이터전송
	public TBCommentDto t_BCommentInsert(TBCommentDto tcdto) {
		System.out.println("CController t_BCommentInsert t_cpw : " + tcdto.getT_cpw());
		System.out.println("CController t_BCommentInsert t_ccontent : " + tcdto.getT_ccontent());
		System.out.println("CController  t_BCommentInsert t_bno : " + tcdto.getT_bno());

		// db에 저장된 댓글 1개 가져오기 -cno,cdate 가 포함되어 있음
		TBCommentDto tbCommentDto = tbService.TBCommentInsert(tcdto);

		return tbCommentDto;
	}// t_BCommentInsert() //댓글 1개 입력

	// 3.꿀팁 댓글 삭제Pg
	@PostMapping("t_BCommentDelete") // 댓글 1개 삭제
	@ResponseBody // ajax-데이터전송
	public String t_BCommentDelete(int t_cno) {
		System.out.println("TBController  t_BCommentDelete t_cno : " + t_cno);
		// service연결
		String result = tbService.TBCommentDelete(t_cno);
		return "삭제처리";
	}

	// 3.꿀팁 댓글 수정Pg
	@PostMapping("t_BCommentUpdate") // 댓글 수정 저장
	@ResponseBody // ajax -데이터 전송
	public TBCommentDto t_BCommentUpdate(TBCommentDto tcdto) {
		System.out.println("TBController t_BCommentUpdate cno : " + tcdto.getT_cno());
		// service연결 - 댓글수정저장
		TBCommentDto tbCommentDto = tbService.t_BCommentUpdate(tcdto);
		return tbCommentDto;
	}

	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 꿀팁게시판

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

	// 4.자유게시글 수정Pg
	@PostMapping("fUpdate")
	public String fUpdate(@RequestParam(defaultValue = "1") int f_bno, Model model) {

		System.out.println("CController fUpdate f_bno : " + f_bno);
		// service 연결(fbdto)
		Map<String, Object> map = fService.fselectOne(f_bno); // 게시글 1개 가져오기

		// model 전송
		model.addAttribute("map", map);

		return "/community/fUpdate";
	}// fUpdate(f_bno, model)

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
	}// doFUpdate(uFile, model)

	// 4.자유게시글 수정저장 - SummerNote
	@PostMapping("summernoteFwriteUpdate")
	@ResponseBody
	public String summernoteFwriteUpdate(@RequestParam MultipartFile uFile) throws Exception {
		String urlLink = "";
		if (!uFile.isEmpty()) {
			String oriFName = uFile.getOriginalFilename();
			long time = System.currentTimeMillis();
			String upFName = time + "_" + oriFName;
			String fupload = "c:/upload/";

			// 파일업로드 부분
			File f = new File(fupload + upFName);
			uFile.transferTo(f);

			// 파일저장위치
			urlLink = "/upload/" + upFName;
			System.out.println("summernoteUpload 파일저장 위치 : " + urlLink);
		} // if
		return urlLink;
	}// summerNote(자유게시글 수정)

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

	// 4.자유게시글 답글Pg
	@PostMapping("fReply")
	public String fReply(@RequestParam(defaultValue = "1") int f_bno, Model model) {
		System.out.println("CController fReply f_bno : " + f_bno);

		// service 연결(fbdto)
		Map<String, Object> map = fService.fselectOne(f_bno); // 게시글 1개 가져오기

		// model 전송
		model.addAttribute("map", map);

		return "/community/fReply";
	}// fReply(f_bno, model)

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
	}// doFReply(fbdto, rFrile, model)

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
	}// summerNote(답글)

	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 자유게시판

}// CController
