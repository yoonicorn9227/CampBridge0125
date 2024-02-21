<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>캠핑장리뷰_글작성</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	    <meta content="" name="description">
	    <meta content="" name="keywords">
	
	    <!-- Favicons -->
	    <link href="assets/img/favicon.png" rel="icon">
	    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
	
	    <!-- Google Fonts -->
	    
	    
	    <link rel="preconnect" href="https://fonts.googleapis.com">
	    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Amatic+SC:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Inter:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">
	
	    <!-- Vendor CSS Files -->
	    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	    <link href="../assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	    <link href="../assets/vendor/aos/aos.css" rel="stylesheet">
	    <link href="../assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
	    <link href="../assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
	
	    <!-- Template Main CSS File -->
 		<link href="../assets/css/main2.css" rel="stylesheet">
       	<link href="../assets/css/header.css" rel="stylesheet">
		<link href="../assets/css/community/listStyle.css" rel="stylesheet">
		<link href="../assets/css/community/viewStyle.css" rel="stylesheet">
		<link href="../assets/css/community/writeStyle.css" rel="stylesheet">
		
		<!-- 
		<script src="../assets/js/summernote-lite.js"></script>
        <script src="../assets/js/summernote/lang/summernote-ko-KR.js"></script>
		<link href="../assets/css/summernote-lite.css" rel="stylesheet">
		 -->
		
		<!-- Template nWrite JS File -->
  		<script src="../assets/js/cps_review/RE_Update.js"></script>
  		<style type="text/css">
  			#cps_btitle{width: 900px; margin-left: -50px; border: none;}
  		</style>
	</head>
	<body>
	<!-- ======= Header ======= -->
	<%@include file="../include/header.jsp" %>
	<!-- End Header -->
	
		<section class="notice">
		   
			<!-- 글쓰기 -->
	    	<h1 style="float: left; margin: 40px; font-weight: 700; position: relative; left:235px; top: 30px;">캠핑장리뷰 작성</h1>
			<form action="site_doUpdate" name="site_doUpdateFrm" method="post" enctype="multipart/form-data">
			    <table>
			    <input type="hidden" name="cps_bfile" value="${map.c_redto.cps_bfile}">
      			<input type="hidden" name="cps_bno" value="${map.c_redto.cps_bno}">
			     <colgroup>
			        <col width="10%">
			        <col width="65%">
			        <col width="10%">
			        <col width="15%">
	   			</colgroup>
			      <tr>
			      <th style="text-align: left;"><strong>글제목 | </strong></th>
			        <th colspan="2" style="text-align: left;"><input type="text" id="cps_btitle" name="cps_btitle" value="${map.c_redto.cps_btitle}"></th>
			        <th style="text-align: left;">
		        	 	<select name="cps_sitename" id="cps_sitename" class="cps_sitename" style="width: 146px;">
					       <option value="freeCont">지역선택</option>
					       <option value="서울시" <c:if test="${fn:contains(map.c_redto.cps_sitename,'서울시')}">selected</c:if>>서울시</option>
					       <option value="경기도" <c:if test="${fn:contains(map.c_redto.cps_sitename,'경기도')}">selected</c:if>>경기도</option>
					       <option value="부산시" <c:if test="${fn:contains(map.c_redto.cps_sitename,'부산시')}">selected</c:if>>부산시</option>
					       <option value="경상남도" <c:if test="${fn:contains(map.c_redto.cps_sitename,'경상남도')}">selected</c:if>>경상남도</option>
					       <option value="경상북도" <c:if test="${fn:contains(map.c_redto.cps_sitename,'경상북도')}">selected</c:if>>경상북도</option>
					       <option value="대구시" <c:if test="${fn:contains(map.c_redto.cps_sitename,'대구시')}">selected</c:if>>대구시</option>
					       <option value="인천시" <c:if test="${fn:contains(map.c_redto.cps_sitename,'인천시')}">selected</c:if>>인천시</option>
					       <option value="충청남도" <c:if test="${fn:contains(map.c_redto.cps_sitename,'충청남도')}">selected</c:if>>충청남도</option>
					       <option value="충청북도" <c:if test="${fn:contains(map.c_redto.cps_sitename,'충청북도')}">selected</c:if>>충청북도</option>
					       <option value="강원도" <c:if test="${fn:contains(map.c_redto.cps_sitename,'강원도')}">selected</c:if>>강원도</option>
					       <option value="전라남도" <c:if test="${fn:contains(map.c_redto.cps_sitename,'전라남도')}">selected</c:if>>전라남도</option>
					       <option value="전라북도" <c:if test="${fn:contains(map.c_redto.cps_sitename,'전라북도')}">selected</c:if>>전라북도</option>
					       <option value="광주시" <c:if test="${fn:contains(map.c_redto.cps_sitename,'광주시')}">selected</c:if>>광주시</option>
					       <option value="대전시" <c:if test="${fn:contains(map.c_redto.cps_sitename,'대전시')}">selected</c:if>>대전시</option>
					       <option value="울산시" <c:if test="${fn:contains(map.c_redto.cps_sitename,'울산시')}">selected</c:if>>울산시</option>
					       <option value="제주시" <c:if test="${fn:contains(map.c_redto.cps_sitename,'제주시')}">selected</c:if>>제주시</option>
					       <option value="세종시" <c:if test="${fn:contains(map.c_redto.cps_sitename,'세종시')}">selected</c:if>>세종시</option>
					    </select>
			        </th>
			      </tr>
			      <tr style="border-bottom: 2px solid #009223">
			        <td style="text-align: left;"><strong>작성자 | </strong></td>
			        <td><input type="text" name="id" readonly="readonly" style="border: 1px solid transparent; margin-left: -40px;" value="${map.c_redto.id}"></td>
			      </tr>
			      <tr>
			        <td colspan="4" class="article"><textarea rows="9" name="cps_bcontent" id="summernote" placeholder=" ※ 게시글 내용을 입력해주세요.">${map.c_redto.cps_bcontent}</textarea></td>
			      </tr>
			      <tr style="border-top: 2px solid #009223; line-height: 20px;">
			        <td colspan="4" class="re_article" style="height: 40px;">기존업로드 파일 | ${map.c_redto.cps_bfile}</td>
			      </tr>
			      <tr style="border-bottom: 2px solid #009223; line-height: 20px;">
			        <td colspan="4" class="re_article" style="height: 40px;"><input type="file" name="re_bfile" id="cps_bfile"></td>
			      </tr>
			    </table>
			</form>
			
			<div class="listBtn">
		    	<a><div class="list" id="reUp_saveBtn">수정완료</div></a>
		    	<a href="siteReview"><div class="list">작성취소</div></a>
			</div>
 		 </section>
		
		<!-- ======= Footer ======= -->
	  	<%@include file="../include/footer.jsp" %>
	 	<!-- End Footer -->
	</body>
</html>