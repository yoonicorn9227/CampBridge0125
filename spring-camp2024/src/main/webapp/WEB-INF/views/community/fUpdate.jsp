<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>자유게시판_글수정</title>
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
		<script src="../assets/js/summernote-lite.js"></script>
        <script src="../assets/js/summernote/lang/summernote-ko-KR.js"></script>
		<link href="../assets/css/summernote-lite.css" rel="stylesheet">
		
		<!-- Template fUpdate JS File -->
  		<script src="../assets/js/fUpdate.js"></script>
	</head>
	<body>
	<!-- ======= Header ======= -->
	<%@include file="../include/header.jsp" %>
	<!-- End Header -->
	
		<section class="notice">
		
		   
			<!-- 자유게시판 글수정 -->
	    	<h1 style="float: left; margin: 40px; font-weight: 700; position: relative; left:235px; top: 30px;">자유게시판 글수정</h1>
			<form action="doFUpdate" name="freeUpdateFrm" method="post" enctype="multipart/form-data">
			    <input type="hidden" name="fFile" value="${map.fbdto.f_bfile }">
			    <input type="hidden" name="f_bno" value="${map.fbdto.f_bno }">
			    <table>
			     <colgroup>
			        <col width="5%">
			        <col width="75%">
			        <col width="10%">
			        <col width="10%">
	   			</colgroup>
			      <tr>
			        <th style="text-align: center;">
		        	 	<select name="f_btype" id="bType" class="bType">
					       <option value="자유게시" <c:if test="${fn:contains(map.fbdto.f_btype,'자유게시')}">selected</c:if>>자유게시</option>
					       <option value="맛집추천" <c:if test="${fn:contains(map.fbdto.f_btype,'맛집추천')}">selected</c:if>>맛집추천</option>
					       <option value="소모임" <c:if test="${fn:contains(map.fbdto.f_btype,'소모임')}">selected</c:if>>소모임</option>
					    </select>
			        </th>
			        <th colspan="3" style="text-align: left;"><input type="text" id="f_btitle" name="f_btitle" value="${map.fbdto.f_btitle }"></th>
			      </tr>
			      <tr style="border-bottom: 2px solid #009223">
			        <td style="text-align: center;"><strong>작성자 | </strong style="text-align: center;"></td>
			        <td><input type="text" value="aaa" readonly="readonly" style="border: 1px solid transparent;"> </td>
			      </tr>
			      <tr>
			        <td colspan="4" class="article"><textarea rows="9" name="f_bcontent" id="summernote" placeholder=" ※ 게시글 내용을 입력해주세요.">${map.fbdto.f_bcontent }</textarea> </td>
			      </tr>
			      <c:if test="${map.fbdto.f_bfile==null}">
				      <tr style="border-top: 2px solid #009223; line-height: 20px;">
				        <td colspan="4" class="article"><strong>업로드 파일 | </strong>※첨부파일 없음</td>
				      </tr>
			      </c:if>
			      <c:if test="${map.fbdto.f_bfile!=null}">
				      <tr style="border-top: 2px solid #009223; line-height: 20px;">
				        <td colspan="4" class="article"><strong>업로드 파일 | </strong>${map.fbdto.f_bfile}</td>
				      </tr>
			      </c:if>
			      <tr style="border-bottom: 2px solid #009223; line-height: 20px;">
			        <td colspan="4" class="article"><input type="file" name="uFile" id="f_bfile"></td>
			      </tr>
			    </table>
			</form>
			<div class="listBtn">
		    	<a href="#"><div class="list" id="updateSaveBtn">수정</div></a>
		    	<a href="fView?f_bno=${map.fbdto.f_bno }"><div class="list">취소</div></a>
			</div>
 		 </section>
		
		<!-- ======= Footer ======= -->
	  	<%@include file="../include/footer.jsp" %>
	 	<!-- End Footer -->
	</body>
</html>