<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>CampBridge_메인 페이지</title>
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Swiper -->
	<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
	<link href="assets/css/main_swiper1.css" rel="stylesheet">
	<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
  
  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Amatic+SC:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Inter:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/main2.css" rel="stylesheet">
  <link href="assets/css/header.css" rel="stylesheet">
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	0c74f5d01be449a3dcaa336db1cd0d99"></script>
  <!-- =======================================================
  * Template Name: Yummy
  * Updated: Jan 09 2024 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/yummy-bootstrap-restaurant-website-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<style>
#main{width:1500px; margin:20px auto; text-align: center; }
#body{width:1600px; height:700px; margin:20px auto; border:3px solid black; }
table{width:1400px; margin:0 auto; }
table,th,td{border:1px solid black; border-collapse: collapse;}
th{height:40px; }
td{height:35px; }
td img{width:50%;}
.swiper-slide.event-item {
width: 800px; height: 600px;
background-size: cover; /* 이미지를 확장 또는 축소하여 가득 채우도록 설정 */
background-position: center; /* 이미지를 가운데 정렬 */
margin: 2px;
margin-right: 10px; /* 간격 조절을 위한 마진 값 설정 */
}

.baroBtn{
width: 100px;
border-color: transparent;
color: black;
display: inline-block;
margin-top: 10px;
margin-left: 170px;
padding: 5px 10px;
font-size: 13px;
letter-spacing: -1px;
background: #ffce32;
font-weight: 700;
border-radius: 3px;
transition: all 1s ease;
opacity: 0.8; /* 바로가기 버튼의 투명도 조절 */
}

.baroBtn:hover{
background: #009223; color: #fff; font-weight: 700;
}

.review_moredetail{
border-color: transparent;
color:black; display: inline-block;
margin-top: 10px; 
padding: 5px 10px; font-size: 13px; 
letter-spacing: -1px; background: #FFCE32; 
font-weight: 700; border-radius: 3px; transition: all 1s ease;
}

.review_moredetail:hover{
background: #009223; color: #fff; font-weight: 700;
}

.swiper-slide.event-item {
    position: relative;
}

.swiper-slide.event-item::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(255, 255, 255, -0); /* 사진의 투명도 조절 */
    filter: contrast(200%); /* 컨트라스트를 150%로 조절, 필요에 따라 값 조절 가능 */
    margin-right: 20px; /* 간격 조절을 위한 마진 값 설정 */
}

.swiper-slide.event-item:hover h3,
.swiper-slide.event-item:hover .price {
    color: #ffce32; /* 커서를 갖다 대었을 때 글꼴 색상 설정 */
}

.button {
    text-align: center;
}

</style>
<body>
<!-- ======= Header ======= -->
<%@include file="include/header.jsp" %>
<!-- End Header -->

  <main id="main">

  
      <!-- ======= 추천 캠핑 Section (Events Section) ======= -->
	<section id="events" class="events">
      <div class="container-fluid" data-aos="fade-up">

        <div class="section-header">
       	 <h2>Recommend</h2>
          <p><span>CampBridge</span> 와 여행가자<i class="fa-solid fa-exclamation"></i>   <i class="fa-solid fa-trailer"></i></p>
        </div>
        <div class="slides-3 swiper" data-aos="fade-up" data-aos-delay="100">
        <div id="search_go_top">
        <p class="search_go"><a href="#">더보기</a></p>  
        </div>
          <div class="swiper-wrapper" id="content">
          <br>
   			<!-- <form action="/search/campsearch_view" method="get" > -->
         	<div class="swiper-slide event-item d-flex flex-column justify-content-end" style="width: 488px; height: 600px;background-image: ">
               <h3></h3>
               <div class="price align-self-start"></div>
               <div class="price align-self-start"></div>
               <button class="baroBtn">바로가기</button>
            </div>
         	 <div class="swiper-slide event-item d-flex flex-column justify-content-end" style="width: 488px; height: 600px;background-image: ">
              <h3></h3>
              <div class="price align-self-start"></div>
              <div class="price align-self-start"></div>
              <button class="baroBtn">바로가기</button>
            </div>
         	 <div class="swiper-slide event-item d-flex flex-column justify-content-end" style="width: 488px; height: 600px;background-image: ">
              <h3></h3>
              <div class="price align-self-start"></div>
              <div class="price align-self-start"></div>
               <button class="baroBtn">바로가기</button>   
            </div>
         	 <div class="swiper-slide event-item d-flex flex-column justify-content-end" style="width: 488px; height: 600px;background-image: ">
              <h3></h3>
              <div class="price align-self-start"></div>
              <div class="price align-self-start"></div> 
             <button class="baroBtn">바로가기</button>             
            </div>
           <!--  </form> -->
          </div>
          <div class="swiper-pagination"></div>
        </div>
      </div>
    </section>
    		
 			<script>
 			//메인 상단 캠프장 추천 랜덤 출력 파트
   			$(function () {      	
	        	let _xml;
	        	let _firstImageUrl = [];
	        	let  _facltNm = [];
	        	let _addr1 = [];
	        	let _lineIntro = [];
	        	let _tel = [];
	        	let _lctCl = [];
	        	let _facltDivNm = [];
	        	let _induty = [];
	        	let _tourEraCl = [];
	        	let _operDeCl = [];
	        	let _homepage = [];
	        	let _sbrsEtc = [];
	        	let _intro = [];
	        	let _posblFcltyCl = [];
	        	let _allar = [];
	        	let _direction = [];
	        	let _tooltip = [];
	        	let _gnrlSiteCo = [];
	        	let _autoSiteCo = [];
	        	let _glampSiteCo = [];
	        	let _caravSiteCo = [];
	        	let _indvdlCaravSiteCo = [];
	        	let _sbrsCl = [];
	        	let _sitedStnc = [];
	        	let _siteBottomCl1 = [];
	        	let _siteBottomCl2 = [];
	        	let _siteBottomCl3 = [];
	        	let _siteBottomCl4 = [];
	        	let _siteBottomCl5 = [];
	        	let _siteMg1Width = [];
	        	let _siteMg1Vrticl = [];
	        	let _siteMg1Co = [];
	        	let _eqpmnLendCl = [];
	        	let _brazierCl = [];
	        	let _extshrCo = [];
	        	let _frprvtWrppCo = [];
	        	let _frprvtSandCo = [];
	        	let _fireSensorCo = []; 
	        	let hdata = "";
	        	
	            $.ajax({
	                url: '/searchCamp', 
	                type: 'get',        
	                data: {txt: 'txt'}, 
	                dataType: 'xml',
	                success: function (data) {
	                    var _xml = $(data).find("items");
	                    var len = _xml.find("item").length;
	                    for (var i = 0; i < len; i++) {
	                        _firstImageUrl[i] = _xml.find('item').eq(i).find('firstImageUrl').text();
	                        _facltNm[i] = _xml.find('item').eq(i).find('facltNm').text();
	                        _addr1[i] = _xml.find('item').eq(i).find('addr1').text();
	                        _lineIntro[i] = _xml.find('item').eq(i).find('lineIntro').text();
	                        _tel[i] = _xml.find('item').eq(i).find('tel').text();
	                        _lctCl[i] = _xml.find('item').eq(i).find('lctCl').text();
	                        _facltDivNm[i] = _xml.find('item').eq(i).find('facltDivNm').text();
	                        _induty[i] = _xml.find('item').eq(i).find('induty').text();
	                        _tourEraCl[i] = _xml.find('item').eq(i).find('tourEraCl').text();
	                        _operDeCl[i] = _xml.find('item').eq(i).find('operDeCl').text();
	                        _homepage[i] = _xml.find('item').eq(i).find('homepage').text();
	                        _sbrsEtc[i] = _xml.find('item').eq(i).find('sbrsEtc').text();
	                        _intro[i] = _xml.find('item').eq(i).find('intro').text();
	                        _posblFcltyCl[i] = _xml.find('item').eq(i).find('posblFcltyCl').text();
	                        _allar[i] = _xml.find('item').eq(i).find('allar').text();
	                        _direction[i] = _xml.find('item').eq(i).find('direction').text();
	                        _tooltip[i] = _xml.find('item').eq(i).find('tooltip').text();
	                        _gnrlSiteCo[i] = _xml.find('item').eq(i).find('gnrlSiteCo').text();
	                        _autoSiteCo[i] = _xml.find('item').eq(i).find('autoSiteCo').text();
	                        _glampSiteCo[i] = _xml.find('item').eq(i).find('glampSiteCo').text();
	                        _caravSiteCo[i] = _xml.find('item').eq(i).find('caravSiteCo').text();
	                        _indvdlCaravSiteCo[i] = _xml.find('item').eq(i).find('indvdlCaravSiteCo').text();
	                        _sbrsCl[i] = _xml.find('item').eq(i).find('sbrsCl').text();
	                        _sitedStnc[i] = _xml.find('item').eq(i).find('sitedStnc').text();
	                        _siteBottomCl1[i] = _xml.find('item').eq(i).find('siteBottomCl1').text();
	                        _siteBottomCl2[i] = _xml.find('item').eq(i).find('siteBottomCl2').text();
	                        _siteBottomCl3[i] = _xml.find('item').eq(i).find('siteBottomCl3').text();
	                        _siteBottomCl4[i] = _xml.find('item').eq(i).find('siteBottomCl4').text();
	                        _siteBottomCl5[i] = _xml.find('item').eq(i).find('siteBottomCl5').text();
	                        _siteMg1Width[i] = _xml.find('item').eq(i).find('siteMg1Width').text();
	                        _siteMg1Vrticl[i] = _xml.find('item').eq(i).find('siteMg1Vrticl').text();
	                        _siteMg1Co[i] = _xml.find('item').eq(i).find('siteMg1Co').text();
	                        _eqpmnLendCl[i] = _xml.find('item').eq(i).find('eqpmnLendCl').text();
	                        _brazierCl[i] = _xml.find('item').eq(i).find('brazierCl').text();
	                        _extshrCo[i] = _xml.find('item').eq(i).find('extshrCo').text();
	                        _frprvtWrppCo[i] = _xml.find('item').eq(i).find('frprvtWrppCo').text();
	                        _frprvtSandCo[i] = _xml.find('item').eq(i).find('frprvtSandCo').text();
	                        _fireSensorCo[i] = _xml.find('item').eq(i).find('fireSensorCo').text(); 
	                        console.log("이름 : " + _facltNm[i]);  
	                        console.log("사진 : " + _firstImageUrl[i]);  
	                        console.log("주소 : " + _addr1[i]);
	                        console.log("소개 : " + _lineIntro[i]);
	                       	 //폼 형태로 fc컨트롤러 searchCamp 와 campsearch_view 에 공공데이터 정보를 보냄
	                         hdata += '<form action="/campsearch_view" method="get" >'
                         	 hdata += '<input type="hidden" name="_firstImageUrl" value="'+_firstImageUrl[i]+'" >' 
                             hdata += '<input type="hidden" name="_addr1" value="'+_addr1[i]+'" >' 
                             hdata += '<input type="hidden" name="_tel" value="'+_tel[i]+'" >' 
                             hdata += '<input type="hidden" name="_lctCl " value="'+_lctCl[i]+'" >' 
                             hdata += '<input type="hidden" name="_facltDivNm" value="'+_facltDivNm[i]+'" >' 
                             hdata += '<input type="hidden" name="_induty" value="'+_induty[i]+'" >' 
                             hdata += '<input type="hidden" name="_tourEraCl" value="'+_tourEraCl[i]+'" >' 
                             hdata += '<input type="hidden" name="_operDeCl" value="'+_operDeCl[i]+'" >' 
                             hdata += '<input type="hidden" name="_homepage" value="'+_homepage[i]+'" >' 
                             hdata += '<input type="hidden" name="_sbrsEtc" value="'+_sbrsEtc[i]+'" >' 
                             hdata += '<input type="hidden" name="_intro" value="'+_intro[i]+'" >' 
                             hdata += '<input type="hidden" name="_posblFcltyCl" value="'+_posblFcltyCl[i]+'" >' 
                             hdata += '<input type="hidden" name="_allar" value="'+_allar[i]+'" >' 
                             hdata += '<input type="hidden" name="_direction" value="'+_direction[i]+'" >' 
                             hdata += '<input type="hidden" name="_tooltip" value="'+_tooltip[i]+'" >' 
                             hdata += '<input type="hidden" name="_gnrlSiteCo" value="'+_gnrlSiteCo[i]+'" >' 
                             hdata += '<input type="hidden" name="_autoSiteCo" value="'+_autoSiteCo[i]+'" >' 
                             hdata += '<input type="hidden" name="_glampSiteCo" value="'+_glampSiteCo[i]+'" >' 
                             hdata += '<input type="hidden" name="_caravSiteCo" value="'+_caravSiteCo[i]+'" >' 
                             hdata += '<input type="hidden" name="_indvdlCaravSiteCo" value="'+_indvdlCaravSiteCo[i]+'" >' 
                             hdata += '<input type="hidden" name="_sbrsCl" value="'+_sbrsCl[i]+'" >' 
                             hdata += '<input type="hidden" name="_sitedStnc" value="'+_sitedStnc[i]+'" >' 
                             hdata += '<input type="hidden" name="_siteBottomCl1" value="'+_siteBottomCl1[i]+'" >' 
                             hdata += '<input type="hidden" name="_siteBottomCl2" value="'+_siteBottomCl2[i]+'" >' 
                             hdata += '<input type="hidden" name="_siteBottomCl3" value="'+_siteBottomCl3[i]+'" >' 
                             hdata += '<input type="hidden" name="_siteBottomCl4" value="'+_siteBottomCl4[i]+'" >' 
                             hdata += '<input type="hidden" name="_siteBottomCl5" value="'+_siteBottomCl5[i]+'" >' 
                             hdata += '<input type="hidden" name="_siteMg1Width" value="'+_siteMg1Width[i]+'" >' 
                             hdata += '<input type="hidden" name="_siteMg1Vrticl" value="'+_siteMg1Vrticl[i]+'" >' 
                             hdata += '<input type="hidden" name="_siteMg1Co" value="'+_siteMg1Co[i]+'" >' 
                             hdata += '<input type="hidden" name="_eqpmnLendCl" value="'+_eqpmnLendCl[i]+'" >' 
                             hdata += '<input type="hidden" name="_brazierCl" value="'+_brazierCl[i]+'" >' 
                             hdata += '<input type="hidden" name="_extshrCo" value="'+_extshrCo[i]+'" >' 
                             hdata += '<input type="hidden" name="_frprvtWrppCo" value="'+_frprvtWrppCo[i]+'" >' 
                             hdata += '<input type="hidden" name="_frprvtSandCo" value="'+_frprvtSandCo[i]+'" >' 
                             hdata += '<input type="hidden" name="_fireSensorCo" value="'+_fireSensorCo[i]+'" >'  
	                         hdata += '<div class="swiper-slide event-item d-flex flex-column justify-content-end" style="width: 488px; height: 600px; background-image: url(' + _firstImageUrl[i] + ')">';
	                         hdata += '<h3>' +  _facltNm[i] + '</h3>';
	                         hdata += '<div class="price align-self-start">' + _addr1[i] + '</div>';
	                         hdata += '<div class="price align-self-start">' + _lineIntro[i] + '</div>';
	                         hdata += '<button class="baroBtn">바로가기</button>';    
	                         hdata += '</div>';  
	                         hdata += '</form>';       
	                    }
	                    console.log(hdata);
	                    $("#content").html(hdata);
	                },
	                error: function (xhr) {
	                    console.error(xhr);
	                }
	            });
	            });
   	
	            </script> 
	                     
	
 <!-- ======= review Section(Swiper) ======= -->
		 <div class="section-header">
       	 <h2>Review</h2>
          <p><span>CampBridge</span> 리뷰 <i class="fa-solid fa-magnifying-glass"></i></p>
        </div>
        
  	<section class="review_all">
		<div class="swiper mySwiper container">
			<div class="swiper-wrapper content1" id="reviewContent">
				<!--  카드형 반복 -->
				<!-- <form action="/review/review_equip" method="get" > -->
				<div class="swiper-slide card1" style="width:300px; height:600px;">
					<div class="box1"></div>
					<div class="card-content">
						<div class="image" style="width: 100%;"> 
						<img src="" alt="" >
						</div>
					</div>
					<div class="name_profession">
						<span class="main_name"></span>
					</div>
					<div class="main_rating">
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
					</div>
					<p style="margin-top: 20px;"></p>
							<div class="main_about">
							<p></p>
							</div>
							<div style="margin-top: -70px;">
							<p style="position: relative; top:5px;"></p>
							</div>
							<div class="button b1">
								<button class="review_moredetail">더보기</button>
							</div>
					</div>
				</div>
				<!-- </form> -->
				<!-- 반복 끝 -->
			</div>
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
		<div class="swiper-pagination"></div>
	</section><!-- End Review section  -->
		       
	       <script>
	       //메인 캠핑장 리뷰 랜덤 출력 파트
	       $(function () {  
	    	let _xml;
            let _firstImageUrl = [];
            let _facltNm = [];
            let _lineIntro = [];
            let _tooltip = [];    
            let _addr1 = [];    
            let _createdtime = [];    
            let _direction = [];    
            let _featureNm = [];    
            let hdata = "";
	            
	            $.ajax({
	                url: '/reviewCamp', 
	                type: 'get',        
	                data: {txt: '제주'}, 
	                dataType: 'xml',
	                success: function (data) {
	                    var _xml = $(data).find("items");
	                    var len = _xml.find("item").length;   
	                    var hdata = ''; // hdata 변수를 이 위치로 이동

	                    for (var i = 0; i < len; i++) {
	                        _firstImageUrl[i] = _xml.find('item').eq(i).find('firstImageUrl').text();
	                        _facltNm[i] = _xml.find('item').eq(i).find('facltNm').text();
	                        _lineIntro[i] = _xml.find('item').eq(i).find('lineIntro').text() || '정보없음';
	                        _tooltip[i] = _xml.find('item').eq(i).find('tooltip').text();   
	                        _addr1[i] = _xml.find('item').eq(i).find('addr1').text();   
	                        _createdtime[i] = _xml.find('item').eq(i).find('createdtime').text();   
	                        _direction[i] = _xml.find('item').eq(i).find('direction').text();  
	                        _featureNm[i] = _xml.find('item').eq(i).find('featureNm').text();  
	                        console.log("사진 : " + _firstImageUrl[i]);  
	                        console.log("제목 : " + _facltNm[i]);  
	                        console.log("소개 : " + _lineIntro[i]);                        
	                        console.log("리뷰 : " + _tooltip[i]);                        
	                        console.log("리뷰 : " + _addr1[i]);                        
	                        console.log("리뷰 : " + _createdtime[i]);                        
	                        console.log("리뷰 : " + _direction[i])                                            
	                        // 랜덤 별점 생성
	                        let randomRating = Math.floor(Math.random() * 5) + 1;
	                        //폼 형태로 reviewCamp 와 review_site 에 정보를 보냄(나중에 site로 고쳐야함!!)
	                        hdata += '<div class="swiper mySwiper container">';
	                        hdata += '<div class="swiper-wrapper content1" id="reviewContent">';
	                        hdata += '<form action="/review_site2" method="get" >';
	                        hdata += '<input type="hidden" name="_firstImageUrl" value="'+_firstImageUrl[i]+'" >' 
	                        hdata += '<input type="hidden" name="_facltNm" value="'+_facltNm[i]+'" >' 
	                        hdata += '<input type="hidden" name="_lineIntro" value="'+_lineIntro[i]+'" >' 
	                        hdata += '<input type="hidden" name="_tooltip" value="'+_tooltip[i]+'" >' 
	                        hdata += '<input type="hidden" name="_addr1" value="'+_addr1[i]+'" >' 
	                        hdata += '<input type="hidden" name="_createdtime" value="'+_createdtime[i]+'" >'     
	                        hdata += '<input type="hidden" name="_direction" value="'+_direction[i]+'" >'     
	                        hdata += '<div class="swiper-slide card1" style="width:300px; height:600px;">';
	                        hdata += '<div class="box1"></div>';
	                        hdata += '<div class="card-content">';
	                        hdata += '<div class="image" style="width: 100%;">';
	                        hdata += '<img src="'+_firstImageUrl[i]+'" alt="">';
	                        hdata += '</div>';
	                        hdata += '</div>';
	                        hdata += '<div class="name_profession">';
	                        hdata += '<span class="main_name">'+_facltNm[i]+'</span>';
	                        hdata += '</div>';
	                        hdata += '<div class="main_rating">';
	                        
	                        // 랜덤 별점 적용
	                        for(let j = 0; j < randomRating; j++) {
	                            hdata += '<i class="fa-solid fa-star"></i>';
	                        }
	                        hdata += '</div>';
	                        hdata += '<p style="margin-top: 20px;">'+_addr1[i]+'</p>';
	                        hdata += '<div class="main_about">';
	                        hdata += '<p>' + (_featureNm[i] ? _featureNm[i] : _lineIntro[i]) + '</p>';
	                        hdata += '</div>';                     	                               
	                        hdata += '<div class="button b1" style="position:relative; bottom:20px;">';    
	                        hdata += '<button class="review_moredetail">더보기</button>';    
	                        hdata += '</div>';            
	                        hdata += '</div>';    
	                        hdata += '</div>'; 
	                        hdata += '</form>'; 
	                        hdata += '</div>';           
	                    }
	                    console.log(hdata);
	                    $("#reviewContent").html(hdata);
	                },
	                error: function (xhr) {
	                    console.error(xhr);
	                }
	            });       
	        });
	          
   		 </script> 	

  <!-- 날씨 Section -->
      <section id="hero1" style="position:relative; right: 150px;">
  		<div class="section-header">
          <h2>Weather</h2>
          <p style="position:relative; left: 150px;"><i class="fa-solid fa-sun"></i><span> CampBridge</span> 날씨 </p>
        </div>
		<div id="weather_bg"><div id="id47f855e105530" a='{"t":"r","v":"1.2","lang":"ko","locs":[295],"ssot":"c","sics":"ds","cbkg":"rgb(69,90,100)","cfnt":"#FFFFFF","codd":"rgb(84,110,122)","cont":"#E0E0E0"}'>날씨 데이터 소스: <a href="https://sharpweather.com/weather_south_korea/30_days/">weather South Korea 30 days</a></div>
        </div>
		<script async src="https://static1.sharpweather.com/widgetjs/?id=id47f855e105530"></script>
  </section><!-- End hero1 Section -->
    <!-- End 날씨 Section -->




    <!-- ======= Rent Section(Menu Section) ======= -->
    <section id="menu" class="menu">
      <div class="container" data-aos="fade-up">

        <div class="section-header">
          <h2>RENT</h2>
          <p><span> CampBridge   </span><i class="fa-solid fa-tents"></i>대여해드려요 <span id="rent_more"><a href="#">더보기</a></span></p>
        </div>

        <ul class="nav nav-tabs d-flex justify-content-center" data-aos="fade-up" data-aos-delay="200">

          <li class="nav-item">
            <a class="nav-link active show" data-bs-toggle="tab" data-bs-target="#menu-starters">
              <h4>침구</h4>
            </a>
          </li><!-- End tab nav item -->

          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="tab" data-bs-target="#menu-breakfast">
              <h4>가구</h4>
            </a><!-- End tab nav item -->

          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="tab" data-bs-target="#menu-lunch">
              <h4>식기</h4>
            </a>
          </li><!-- End tab nav item -->

          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="tab" data-bs-target="#menu-dinner">
              <h4>기타</h4>
            </a>
          </li><!-- End tab nav item -->

        </ul>

        <div class="tab-content" data-aos="fade-up" data-aos-delay="300">

          <div class="tab-pane fade active show" id="menu-starters">

            <div class="tab-header text-center">
              <p>BEDDING</p>
              <h3>침구</h3>
            </div>

            <div class="row gy-5">

              <div class="col-lg-4 menu-item">
                <a href="assets/img/main/sleepingbag.PNG"  class="glightbox"><img src="assets/img/main/sleepingbag.PNG" class="menu-img img-fluid" alt=""></a>
                <h4>슬링핑백</h4>
                <p class="price">
                 10,000원
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="assets/img/main/pillow.PNG"  class="glightbox"><img src="assets/img/main/pillow.PNG"class="menu-img img-fluid" alt=""></a>
                <h4>필로우침구세트</h4>
                <p class="price">
                  15,000원
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="assets/img/main/mat.PNG"  class="glightbox"><img src="assets/img/main/mat.PNG" class="menu-img img-fluid" alt=""></a>
                <h4>발포매트</h4>
                <p class="price">
                  10,000원
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="assets/img/main/blanket.PNG"  class="glightbox"><img src="assets/img/main/blanket.PNG" class="menu-img img-fluid" alt=""></a>
                <h4>블랭켓</h4>
                <p class="price">
                  10,000원
                </p>
              </div><!-- Menu Item -->
            </div>
          </div><!-- End Starter Menu Content -->

          <div class="tab-pane fade" id="menu-breakfast">

            <div class="tab-header text-center">
              <p>FURNITURE</p>
              <h3>가구</h3>
            </div>

            <div class="row gy-5">

              <div class="col-lg-4 menu-item">
                <a href="assets/img/main/chair.PNG"><img src="assets/img/main/chair.PNG" class="menu-img img-fluid" alt=""></a>
                <h4>캠핑의자</h4>
               
                <p class="price">
                  59,000원
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="assets/img/main/table.PNG"><img src="assets/img/main/table.PNG" class="menu-img img-fluid" alt=""></a>
                <h4>캠핑테이블</h4>
                <p class="price">
                  158,000원
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="assets/img/main/fieldbed.PNG"><img src="assets/img/main/fieldbed.PNG" class="menu-img img-fluid" alt=""></a>
                <h4>야전침대</h4>
                <p class="price">
                  250,000원
                </p>
              </div><!-- Menu Item -->

            </div>
          </div><!-- End Breakfast Menu Content -->

          <div class="tab-pane fade" id="menu-lunch">

            <div class="tab-header text-center">
              <p>TABLEWARE</p>
              <h3>식기</h3>
            </div>

            <div class="row gy-5">

              <div class="col-lg-4 menu-item">
                <a href="assets/img/main/coppell2.PNG"><img src="assets/img/main/coppell2.PNG" class="menu-img img-fluid" alt=""></a>
                <h4>코펠2인</h4>
                <p class="price">
                 25,000원
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="assets/img/main/coppell4.PNG"><img src="assets/img/main/coppell4.PNG" class="menu-img img-fluid" alt=""></a>
                <h4>코펠4인</h4>
                <p class="price">
                  30,000원
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="assets/img/main/iecboxsmall.PNG"><img src="assets/img/main/iecboxsmall.PNG" class="menu-img img-fluid" alt=""></a>
                <h4>아이스박스28L</h4>
                <p class="price">
                  50,000원
                </p>
              </div><!-- Menu Item -->
              
              <div class="col-lg-4 menu-item">
                <a href="assets/img/main/iecboxbig.PNG"><img src="assets/img/main/iecboxbig.PNG" class="menu-img img-fluid" alt=""></a>
                <h4>아이스박스40L</h4>
                <p class="price">
                  70,000원
                </p>
              </div><!-- Menu Item -->

            
            </div>
          </div><!-- End Lunch Menu Content -->

          <div class="tab-pane fade" id="menu-dinner">

            <div class="tab-header text-center">
              <p>OHTER</p>
              <h3>기타</h3>
            </div>

            <div class="row gy-5">

              <div class="col-lg-4 menu-item">
                <a href="assets/img/main/tarp.PNG"><img src="assets/img/main/tarp.PNG" class="menu-img img-fluid" alt=""></a>
                <h4>타프</h4>
            
                <p class="price">
                  500,000원
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="assets/img/main/burner.PNG"><img src="assets/img/main/burner.PNG" class="menu-img img-fluid" alt=""></a>
                <h4>버너</h4>
           
                <p class="price">
                  25,000원
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="assets/img/main/lantern.PNG"><img src="assets/img/main/lantern.PNG" class="menu-img img-fluid" alt=""></a>
                <h4>랜턴</h4>
          
                <p class="price">
                 30,000원
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="assets/img/main/brazier.PNG"><img src="assets/img/main/brazier.PNG" class="menu-img img-fluid" alt=""></a>
                <h4>화로대</h4>
           
                <p class="price">
                 45,000원
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="assets/img/main/electricwire.PNG"><img src="assets/img/main/electricwire.PNG" class="menu-img img-fluid" alt=""></a>
                <h4>전기릴선</h4>
          
                <p class="price">
                  200,000원
                </p>
              </div><!-- Menu Item -->

            </div>
          </div><!-- End Dinner Menu Content -->

        </div>

      </div>
    </section><!-- End Rent Section -->

        <div class="section-header">
          <h2>NOTICE</h2>
          <p><i class="fa-solid fa-bullhorn"></i><span>  CampBridge</span>가 알려드려요.</p>
        </div>
    <!-- ======= Notice(캠핑꿀팁, 자유게시판, 공지사항) (Testimonials Section) ======= -->
    <section id="testimonials" class="testimonials section-bg">
      <div class="container" data-aos="fade-up">
      
	      <div class="main-visual-news-section first">
	      	
	      	<h3 class="main-visual-news-title notice">캠핑꿀팁(Tip)</h3>
	        <div class="main-visual-news-txt">
	          <ul class="main-list">
	          
	          	<li class="main-list-item">
	          	   <a href="#">2024 스카이트랙스 최고공항상 투표에 참여해주세요!</a>
	            </li>
	            
	          	<li class="main-list-item">
	          	  <a href="#">대중교통 프로모션 #1. 어린이와 청소년은 공항버스 무료</a>
	            </li>
	            
	          	<li class="main-list-item">
	          	   <a href="#">주차장 혼잡 안내</a>
	            </li>
	            
	          	<li class="main-list-item">
	          	   <a href="#"> 국가유공자 우선주차구역 운영개시 알림 및 협조요청</a>
	            </li>
	          </ul>
	          <a href="#" class="more-link-plus">더보기</a>
	        </div>
	      </div><!-- End main-visual-news-section first -->
	
	      <div class="main-visual-news-section middle">
	        
	        <h3 class="main-visual-news-title press">자유게시판</h3>
	        <div class="main-visual-news-txt">
	          <ul class="main-list">
	            
	          	<li class="main-list-item">
	              <a href="#">만 4년만에 일일 여객 20만명 돌파!!</a>
	            </li>
	            
	          	<li class="main-list-item">
	          	  <a href="#">2024년도신년인사회 개최</a>
	            </li>
	            
	          	<li class="main-list-item">
	              <a href="#">‘2023년 고용노동행정 유공포상’ 지역산업고용정책분야 고용노동부 장관상 수상 !</a>
	            </li>
	            
	          	<li class="main-list-item">
	          	  <a href="#">인천공항 제2공항물류단지에 글로벌 배송센터(GDC) 신규 유치 !!!</a>
	            </li>
	          </ul>
	          <a href="#" class="more-link-plus">더보기</a>
	        </div>
	      </div><!-- End main-visual-news-section middle -->
	
	      <div class="main-visual-news-section last">
	      	<h3 class="main-visual-news-title notice">공지사항</h3>
	        <div class="main-visual-news-txt">
	          <ul class="main-list">
	          
	          	<li class="main-list-item">
	          	   <a href="#">2024 스카이트랙스 최고공항상 투표에 참여해주세요!</a>
	            </li>
	            
	          	<li class="main-list-item">
	          	  <a href="#">대중교통 프로모션 #1. 어린이와 청소년은 공항버스 무료</a>
	            </li>
	            
	          	<li class="main-list-item">
	          	   <a href="#">주차장 혼잡 안내</a>
	            </li>
	            
	          	<li class="main-list-item">
	          	   <a href="#"> 국가유공자 우선주차구역 운영개시 알림 및 협조요청</a>
	            </li>
	          </ul>
	          <a href="#" class="more-link-plus">더보기</a>
	      </div><!-- End main-visual-news-section last -->

      </div>
     </div> 
    </section><!-- End Testimonials Section -->




    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
      <div class="container" data-aos="fade-up">

        <div class="section-header">
          <h2>Contact</h2>
          <p><span> CampBridge </span>Contact <i class="fa-solid fa-phone-flip"></i></p>
        </div>
	
        <div id="map" style="width:100%; height:350px;"></div>
      
      
		 <!-- 카카오지도 위치  -->
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0c74f5d01be449a3dcaa336db1cd0d99"></script>
        <script>
      		  var mapContainer = document.getElementById('map'),
        		 mapOption = {
      			 center: new kakao.maps.LatLng(37.48549, 126.8982),
        				level:3
      		  };
      		var map = new kakao.maps.Map(mapContainer, mapOption); 
      		var markerPosition  = new kakao.maps.LatLng(37.48549, 126.8982); 
      		var marker = new kakao.maps.Marker({
      		    position: markerPosition
      		});
      		marker.setMap(map);
        </script>
			  

        <div class="row gy-4">

          <div class="col-md-6">
            <div class="info-item  d-flex align-items-center">
              <i class="icon bi bi-map flex-shrink-0"></i>
              <div class="contact_details">
                <h3>회사주소</h3>
                <p>08378 서울 구로구 디지털로34길 27<br> (구로동) 1106-7호 한국직업전문학교<br><strong>[항공 5기] 손발이 Do it팀</strong></p>
              </div>
            </div>
          </div><!-- End Info Item -->

          <div class="col-md-6">
            <div class="info-item d-flex align-items-center">
              <i class="icon bi bi-envelope flex-shrink-0"></i>
              <div class="contact_details">
                <h3>Email(이메일)</h3>
                <p>campBridge@example.com</p>
              </div>
            </div>
          </div><!-- End Info Item -->

          <div class="col-md-6">
            <div class="info-item  d-flex align-items-center">
              <i class="icon bi bi-telephone flex-shrink-0"></i>
              <div class="contact_details">
                <h3>연락처</h3>
                <p>02)7777-7777</p>
              </div>
            </div>
          </div><!-- End Info Item -->

          <div class="col-md-6">
            <div class="info-item  d-flex align-items-center">
              <i class="icon bi bi-share flex-shrink-0"></i>
              <div class="contact_details">
                <h3>서비스 상담</h3>
                <div>월(Mon)-금(Fri) : <strong>10AM - 18PM</strong><br>
                  주말(Weekend) : <strong>자동음성 안내</strong>
                </div>
              </div>
            </div>
          </div><!-- End Info Item -->

        </div>
     
      </div>
    </section><!-- End Contact Section -->

  </main><!-- End #main -->




  <!-- ======= Footer ======= -->
  <%@include file="include/footer.jsp" %>
  <!-- End Footer -->

  <a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>