package com.java.www.controller;

import java.io.File;
import java.io.IOException;
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

import com.java.www.dto.Cps_commentDto;
import com.java.www.dto.Cps_reviewDto;
import com.java.www.service.ReviewService;

import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("review")
public class ReController {
	
	@Autowired ReviewService reviewService;
	@Autowired HttpSession session;
	
	//캠핑리뷰 - 리스트(캠핑장)    전체글검색
	@GetMapping("re_search")
	public String re_search(@RequestParam(defaultValue = "1")int page, @RequestParam(required = false)String re_category,
			@RequestParam(required = false)String re_searchWord, Model model) {
		
		Map<String, Object> map = reviewService.Cps_selectsearch(page, re_category, re_searchWord);
		System.out.println("ReController siteReview re_contAll : "+(int)map.get("re_contAll"));
		model.addAttribute("map",map);
		return "/review/siteReview";
	}// review()
	
	//캠핑리뷰 - 리스트(캠핑장)    전체글가져오기
	@GetMapping("siteReview")
	public String siteReview(@RequestParam(defaultValue = "1")int page, @RequestParam(required = false)String re_category,
		@RequestParam(required = false)String re_searchWord, Model model) {
		Map<String, Object> map = reviewService.Cps_selectAll(page, re_category, re_searchWord);
		System.out.println("ReController siteReview re_contAll : "+(int)map.get("re_contAll"));
		model.addAttribute("map",map);
		return "/review/siteReview";
	}// review()
	
	//캠핑리뷰 - 리스트(캠핑장)    게시글 1개 가져오기
	@GetMapping("review_site")
	public String review_site(@RequestParam(defaultValue = "1")int cps_bno, Model model) {
		System.out.println("ReController review_site cps_bno : "+cps_bno);
		Map<String, Object> map = reviewService.Cps_selectOne(cps_bno);
		model.addAttribute("map",map);
		return "/review/review_site";
	}//siteReview()
	
	//캠핑리뷰 - 리스트(캠핑장)    게시글 페이지
	@GetMapping("siteWrite")
	public String siteWrite() {
		return "/review/siteWrite";
	}	
	
	//캠핑리뷰 - 리스트(캠핑장)    게시글 글작성
	@PostMapping("siteWrite")
	public String siteWrite(Cps_reviewDto c_redto, @RequestPart MultipartFile re_bfile, Model model) throws Exception{
		System.out.println("reController btitle: "+c_redto.getCps_btitle());
		System.out.println("reController bcontent: "+c_redto.getCps_bcontent());
		System.out.println("reController sitename: "+c_redto.getCps_sitename());
		System.out.println("reController bfile: "+c_redto.getCps_bfile());
		System.out.println("reController blike: "+c_redto.getCps_blike());
		if(!re_bfile.isEmpty()) {
			String re_orgName = re_bfile.getOriginalFilename();
			System.out.println("ReviewService siteWrite 파일이름 : "+re_orgName);
			long re_time = System.currentTimeMillis();
			String re_newName = re_time+"_"+re_orgName;
			String re_upload = "C:/upload/";
			File re_f = new File(re_upload+re_newName);
			re_bfile.transferTo(re_f);
			c_redto.setCps_bfile(re_newName);
		}else {
			c_redto.setCps_bfile("");
			System.out.println("파일첨부가 없습니다.");
		}
		reviewService.siteWrite(c_redto);
		return "/review/site_doWrite";
	}	
	
	//캠핑리뷰 - 리스트(캠핑장)    게시글 수정페이지
	@PostMapping("siteUpdate")
	public String siteUpdate(@RequestParam(defaultValue = "1")int cps_bno, Model model) {
		System.out.println("ReController siteUpdate cps_bno : "+cps_bno);
		Map<String, Object> map = reviewService.Cps_selectOne(cps_bno);
		model.addAttribute("map",map);
		return "/review/siteUpdate";
	}
	
	//캠핑리뷰 - 리스트(캠핑장)    게시글 수정
	@PostMapping("site_doUpdate")
	public String site_doUpdate(Cps_reviewDto c_redto, @RequestPart MultipartFile re_bfile) throws Exception {
		System.out.println("ReController site_doUpdate bno : "+c_redto.getCps_bno());
		String re_orgName = "";
		String re_newName = "";
		if(!re_bfile.isEmpty()) {
			re_orgName = re_bfile.getOriginalFilename();
			long re_time = System.currentTimeMillis();
			re_newName = re_time +"_"+ re_orgName;
			String re_upload = "C:/upload/";
			File re_f = new File(re_upload+re_newName);
			re_bfile.transferTo(re_f);
			c_redto.setCps_bfile(re_newName);
		}
		
		reviewService.site_doUpdate(c_redto);
		return "/review/site_doUpdate";
	}
	
	//캠핑리뷰 - 리스트(캠핑장)    게시글 삭제
	@PostMapping("siteDelete")
	public String siteDelete(@RequestParam(defaultValue = "1")int cps_bno) {
		System.out.println("ReController siteDelete cps_bno : "+cps_bno);
		reviewService.siteDelete(cps_bno);
		return "/review/siteDelete";
	}
	
	//캠핑리뷰 - 리스트(캠핑장)    댓글 1개 저장후 댓글 1개 가져오기
	@PostMapping("Cps_commentInsert")
	@ResponseBody
	public Cps_commentDto Cps_commentInsert(Cps_commentDto c_recdto) {
		System.out.println("ReController Cps_commentInsert cps_bno : "+c_recdto.getCps_bno());
		Cps_commentDto cps_commentDto = reviewService.Cps_commentInsert(c_recdto);
		return cps_commentDto;
	}
	
	//캠핑리뷰 - 리스트(캠핑장)    댓글 1개 삭제
	@PostMapping("Cps_commentDelete")
	@ResponseBody
	public String Cps_commentDelete(int cps_cno) {
		System.out.println("ReController Cps_commentDelete cps_cno : "+cps_cno);
		//서비스 연결
		String result = reviewService.Cps_commentDelete(cps_cno);
		System.out.println("result: "+result);
		return result;
	}
	
	//캠핑리뷰 - 리스트(캠핑장)    댓글 1개 수정저장
	@PostMapping("Cps_commentUpdate")
	@ResponseBody
	public Cps_commentDto Cps_commentUpdate(Cps_commentDto c_recdto) {
		System.out.println("ReController Cps_commentUpdate cps_cno : "+c_recdto.getCps_cno());
		Cps_commentDto cps_commentDto = reviewService.Cps_commentUpdate(c_recdto);
		return cps_commentDto;
	}


	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////캠핑장 리뷰
	
	//캠핑리뷰 - 리스트(용품)
	@GetMapping("equipReview")
	public String equipReview() {
		return "/review/equipReview";
	}//equipReview()
	
	//캠핑리뷰 - 뷰(용품)
	@GetMapping("review_equip")
	public String review_equip() {
		return "/review/review_equip";
	}// review()

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////캠핑용품 리뷰

}
