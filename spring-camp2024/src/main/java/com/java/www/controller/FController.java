package com.java.www.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class FController {
	
	
	//★메인페이지
	@GetMapping("/")
	public String index() {
		return "index";
	}// index()
	
	
	//메인 상단 캠핑장 추천 랜덤 출력 파트
		@GetMapping("/searchCamp")
		@ResponseBody
		public String searchCamp(@RequestParam String txt) throws Exception {
		    String page = "1";
		    String serviceKey = "rgwtD5hlZJI%2B%2FMIZfOwMde5s0vZ1PPasgYvemFcimBgSs8%2FkeqeKqdIsq9xOcths41UWZtjITR9bp%2BKPEm43Jw%3D%3D";
		    String encodedTxt = URLEncoder.encode(txt, "UTF-8");
		    
		    StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/B551011/GoCamping/basedList");
		    urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + serviceKey);
		    urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("12", "UTF-8"));
		    urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(page, "UTF-8"));
		    urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8"));
		    urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8"));

	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/xml");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder(); 
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line); 
	        }
	        rd.close();
	        conn.disconnect();
	        System.out.println(sb.toString());
			
			return sb.toString();
		}
		
		
		  //메인 상단 캠핑장 추천 바로가기 클릭 시 뷰페이지 파트
		   @GetMapping("campsearch_view")
		   public String campsearch_view(String _addr1, String _firstImageUrl,String _tel, String _lctCl,String _facltDivNm, String _induty,String _tourEraCl,String _operDeCl,String _homepage, 
				  String _sbrsEtc, String _intro, String _posblFcltyCl, String _allar, String _direction,String _tooltip, int _gnrlSiteCo, int _autoSiteCo, int _glampSiteCo, 
				  int _caravSiteCo, int _indvdlCaravSiteCo,String _sbrsCl, int _sitedStnc, int _siteBottomCl1,int _siteBottomCl2 ,int _siteBottomCl3, int _siteBottomCl4, int _siteBottomCl5,
				  int _siteMg1Width,int _siteMg1Vrticl,int _siteMg1Co, String _eqpmnLendCl,String _brazierCl,
				  int _extshrCo, int _frprvtWrppCo,int _frprvtSandCo,int _fireSensorCo,
				  Model model) {
			   model.addAttribute("_addr1", _addr1);
			   model.addAttribute("_firstImageUrl", _firstImageUrl);
			   model.addAttribute("_tel", _tel);
			   model.addAttribute("_lctCl", _lctCl);
			   model.addAttribute("_facltDivNm", _facltDivNm);
			   model.addAttribute("_induty", _induty);
			   model.addAttribute("_tourEraCl", _tourEraCl);
			   model.addAttribute("_operDeCl", _operDeCl);
			   model.addAttribute("_homepage", _homepage);
			   model.addAttribute("_sbrsEtc", _sbrsEtc);
			   model.addAttribute("_intro", _intro);
			   model.addAttribute("_posblFcltyCl", _posblFcltyCl);
			   model.addAttribute("_allar", _allar);
			   model.addAttribute("_direction", _direction);
			   model.addAttribute("_gnrlSiteCo", _gnrlSiteCo);
			   model.addAttribute("_autoSiteCo", _autoSiteCo);
			   model.addAttribute("_glampSiteCo", _glampSiteCo);
			   model.addAttribute("_caravSiteCo", _caravSiteCo);
			   model.addAttribute("_indvdlCaravSiteCo", _indvdlCaravSiteCo);
			   model.addAttribute("_sbrsCl", _sbrsCl);
			   model.addAttribute("_sitedStnc", _sitedStnc);
			   model.addAttribute("_siteBottomCl1", _siteBottomCl1);
			   model.addAttribute("_siteBottomCl2", _siteBottomCl2);
			   model.addAttribute("_siteBottomCl3", _siteBottomCl3);
			   model.addAttribute("_siteBottomCl4", _siteBottomCl4);
			   model.addAttribute("_siteBottomCl5", _siteBottomCl5);
			   model.addAttribute("_siteMg1Width", _siteMg1Width);
			   model.addAttribute("_siteMg1Vrticl", _siteMg1Vrticl);
			   model.addAttribute("_siteMg1Co", _siteMg1Co);
			   model.addAttribute("_eqpmnLendCl", _eqpmnLendCl);
			   model.addAttribute("_brazierCl", _brazierCl);
			   model.addAttribute("_extshrCo", _extshrCo);
			   model.addAttribute("_frprvtWrppCo", _frprvtWrppCo);
			   model.addAttribute("_frprvtSandCo", _frprvtSandCo);
			   model.addAttribute("_fireSensorCo", _fireSensorCo);
			   return "/search/campsearch_view";
		   }
		
		
		//메인 캠핑장 리뷰 랜덤 출력 파트
		@GetMapping("/reviewCamp")
		@ResponseBody
		public String reviewCamp(@RequestParam String txt) throws Exception {
			String page = "1";
			String serviceKey = "rgwtD5hlZJI%2B%2FMIZfOwMde5s0vZ1PPasgYvemFcimBgSs8%2FkeqeKqdIsq9xOcths41UWZtjITR9bp%2BKPEm43Jw%3D%3D";
			String encodedTxt = URLEncoder.encode(txt, "UTF-8");
			
			StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/B551011/GoCamping/basedList");
			urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + serviceKey);
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("4", "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(page, "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8"));
			//urlBuilder.append("&" + URLEncoder.encode("keyword","UTF-8") + "=" + URLEncoder.encode(txt, "UTF-8"));
			
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/xml");
			System.out.println("Response code: " + conn.getResponseCode());
			BufferedReader rd;
			if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			StringBuilder sb = new StringBuilder(); 
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line); 
			}
			rd.close();
			conn.disconnect();
			System.out.println(sb.toString());
			
			return sb.toString();
		}
		
		

	   //메인 캠핑장 리뷰 더보기 클릭 시 뷰페이지 출력 파트
	   @GetMapping("equipReview")
		public String equipReview() {
			return "/review/equipReview";
		}//equipReview()

		
		@GetMapping("review_site2")
		public String review_site2(String _firstImageUrl,String _facltNm,String _createdtime,String _lineIntro,
			String _tooltip, String _addr1, Model model) {
			model.addAttribute("_firstImageUrl", _firstImageUrl);
			model.addAttribute("_facltNm", _facltNm);
			model.addAttribute("_createdtime", _createdtime);
			model.addAttribute("_lineIntro", _lineIntro);
			model.addAttribute("_addr1", _addr1);
			model.addAttribute("_tooltip", _tooltip);
			return "/review/review_site2";
		}
	
	
	//사이트소개
	@GetMapping("aboutCB")
	public String aboutCB() {
		return "aboutCB";
	}// adminPage()
	
	//campbridge 소개
	@GetMapping("developers")
	public String developers() {
		return "developers";
	}// developers()
	
	// 내용부분 - 이미지추가시 파일업로드
	@PostMapping("uploadImage")
	@ResponseBody
	public String uploadImage(@RequestParam MultipartFile file) throws Exception {
		String urlLink = "";
		if(!file.isEmpty()) {
			String oriFName = file.getOriginalFilename();
			long time = System.currentTimeMillis();
			String upFName = time+"_"+oriFName;
			String fupload = "c:/upload/";
			
			//파일서버에 업로드 부분
			File f = new File(fupload+upFName);
			file.transferTo(f);
			
			//파일저장위치
			urlLink = "/upload/"+upFName;
			System.out.println("summernoteUpload 파일 저장위치 : "+ urlLink);
		}
		return urlLink;
	}
	

}// FController
