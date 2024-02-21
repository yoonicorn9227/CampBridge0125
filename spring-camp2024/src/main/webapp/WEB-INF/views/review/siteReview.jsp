<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑장리뷰 - 리스트</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Amatic+SC:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Inter:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="/assets/css/main2.css" rel="stylesheet">
<link href="/assets/css/review/review.css" rel="stylesheet" type="text/css">
<link href="/assets/css/review/campsearch1.css" rel="stylesheet" type="text/css">
<link href="/assets/css/review/header2.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- ======= Header ======= -->
	<%@include file="../include/header.jsp"%>
	<!-- End Header -->
	<br>
	<br>
	<br>
	<div id="contentWrapper">
		<div id="contentWrap">
			<link type="text/css" rel="stylesheet" href="#">
			<div id="content">
				<div id="bbsData">
					<div class="page-body">
					
						<!-- 상단 캠핑장 리뷰 시작 -->
						<div class="camp-img-div">
							<img src="../assets/img/campReview/free-icon-forest-8856738.png" alt="캠핑리뷰이미지" style="position: relative; left: 475px;">
							<h1 style="text-align: center; margin-bottom: 40px;">캠핑장 리뷰</h1>
						</div>
						<!-- 상단 캠핑장 리뷰 끝 -->
						
						<div class="bbs-sch">
						   <!-- .검색 폼시작 -->
						  <form action="siteReview" name="re_search" method="get" id="searchForm">
						    <fieldset>
						      <legend>게시판 검색 폼</legend>
						      <label><input type="checkbox" name="re_category" value="re_all" checked onclick="update_Check('re_all')">전체</label>
						      <label><input type="checkbox" name="re_category" value="cps_sitename" onclick="update_Check('cps_sitename')">지역</label>
						      <label><input type="checkbox" name="re_category" value="cps_btitle" onclick="update_Check('cps_btitle')">제목</label>
						      <label><input type="checkbox" name="re_category" value="cps_bcontent" onclick="update_Check('cps_bcontent')">내용</label>
						      <span class="key-wrap"> 
						        <input type="text" name="re_searchWord" id="re_searchWord" class="MS_input_txt">
						        <button type="button" onclick="submitForm()" style="width: 28px; height: 28px; border: none; background: none;">
						          <img src="https://image.makeshop.co.kr/makeshop/d3/basic_simple/bbs/btn_bbs_sch.gif" alt="검색" title="검색">
						        </button>
						      </span>
						    </fieldset>
						  </form>
						  <script>
						    // JavaScript 코드
						    function update_Check(clickedValue) {
						      // 클릭한 체크박스의 값을 확인
						      var clicked = clickedValue;
						
						      // 전체 체크박스가 클릭되었을 경우 다른 체크박스의 선택을 초기화
						      if (clicked === 're_all') {
						        var checkboxes = document.querySelectorAll('input[name="re_category"]');
						        checkboxes.forEach(function(checkbox) {
						          if (checkbox.value !== 're_all') {
						            checkbox.checked = false;
						          }
						        });
						      } else {
						        // 다른 체크박스가 클릭되었을 경우 전체 체크박스의 선택을 해제
						        var allCheckbox = document.querySelector('input[value="re_all"]');
						        allCheckbox.checked = false;
						      }
						      
						    }
						  </script>
						   <!-- .검색 폼 끝 -->
						</div> <!-- bbs-sch -->
								
						<!-- 탭 시작 -->
						<div class="bbs-tit">
							<div class="viewtab-review">
								<input type="radio" name="tabreview" id="tabreview1" checked>
								<label for="tabreview1">캠핑장리뷰</label> 
								<input type="radio" name="tabreview" id="tabreview2"> 
								<label for="tabreview2">캠핑용품리뷰</label>
							</div>
							<div class="reviewbox1"></div> 
						</div>
						<!-- 탭 끝  -->
						
					
						<!-- 카드형 리스트 시작 -->
						<div class="list_wrap">
							<ul>
								<c:forEach var="redto" items="${map.list}">
						        
								<li class="item item1">
									<div class="image">										
										<c:if test="${redto.cps_bfile != null}">
										<img src="/upload/${redto.cps_bfile}" style="width: 100%; height: 100%; border-radius: 10px; background-size: cover;"/>
										</c:if>
										<c:if test="${redto.cps_bfile == null}">
										<img src="../assets/img/noPhoto_s.jpg" style="width: 100%; height: 100%; border-radius: 10px; background-size: cover;"/>
										</c:if>
									</div>
									<div class="cont">
										<strong class="brief_title">${redto.cps_btitle}</strong>
										<p>${redto.id}</p>
										<p>지역&nbsp&nbsp&nbsp ${redto.cps_sitename}</p>
										<p class="brief_description" id="txt">${redto.cps_bcontent}</p>
										<span class="date"><i class="fa fa-clock-o" aria-hidden="true"></i><fmt:formatDate value="${redto.cps_bdate}" pattern="yyyy-MM-dd"/></span>
										<div class="heartwrap">
											 <span class="reviewhit">${redto.cps_bhit}</span>
											 <img src="https://www.5gcamp.com/modules/usemarket/theme/_pc/default/image/heart-o.svg" alt="" width="20" class="heart1">
										</div>
										<a href="review_site?cps_bno=${redto.cps_bno}">바로가기</a>
									</div>
								</li>
								</c:forEach>
							</ul>
						</div><!-- list_wrap -->
						<!-- 카드형 리스트 끝 -->
						
					</div><!-- page-body -->
				</div><!-- bbsData -->

				<!-- 하단 페이징 & 버튼 시작 -->
				<div class="bbs-btm">
				
				<div>
					<ul class="page-num-review">
						<a href="siteReview?page=1"><li class="first-num"></li></a>
						<c:if test="${map.page > 1}">
							<a href="siteReview?page=${map.page-1}"><li class="prev-num"></li></a>
						</c:if>
						<c:if test="${map.page <= 1}">
							<li class="prev-num"></li>
						</c:if>
						
						<c:forEach var="i" begin="${map.re_startPage}" end="${map.re_endPage}" step="1">
							<c:if test="${map.page == i}">
								<li class="num-review on">${i}</li>
							</c:if>
							<c:if test="${map.page != i}">
								<a href="siteReview?page=${i}"><li class="num-review">${i}</li></a>
							</c:if>
						</c:forEach>
						
						<c:if test="${map.page < map.re_maxPage}">
							<a href="siteReview?page=${map.page+1}"><li class="next-num"></li></a>
						</c:if>
						<c:if test="${map.page >= map.re_maxPage}">
							<li class="next-num"></li>
						</c:if>
						<a href="siteReview?page=${map.re_maxPage}"><li class="last-num"></li></a>
					</ul>
				</div>
				<div class="bbs-link">
					<a href="siteWrite" class="CSSbuttonWhite">글쓰기</a>
				</div>
				</div>
				<!-- //하단 페이징 & 버튼 끝 -->

			</div><!-- content -->
		</div><!-- contentWrap -->
	</div><!-- contentWrapper -->

	<!-- ======= Footer ======= -->
	<%@include file="../include/footer.jsp"%>
	<!-- End Footer -->
</body>
</html>