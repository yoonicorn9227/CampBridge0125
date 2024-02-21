<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>캠핑꿀팁(Tip)_글수정</title>
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
		<link href="../assets/css/summernote-lite.css" rel="stylesheet">
		
	    <!-- Template Main CSS File -->
	    <script src="/assets/js/summernote.js"></script>
		<script src="../assets/js/summernote-lite.js"></script>
        <script src="../assets/js/summernote/lang/summernote-ko-KR.js"></script>
	</head>
	<body>
	<!-- ======= Header ======= -->
	<%@include file="../include/header.jsp" %>
	
	<!-- End Header -->
	
		<section class="notice">
			<!-- 꿀팁 게시판 글수정 -->
	    	<h1 style="float: left; margin: 40px; font-weight: 700; position: relative; left:235px; top: 30px;">꿀팁게시글 수정</h1>
			<form action="doTBUpdate" name="tipFrm" method="post" enctype="multipart/form-data">
	   			  	<input type="hidden" name="t_bno" value="${map.tbdto.t_bno}">
	   			  	<input type="hidden" name="t_bfile" value="${map.tbdto.t_bfile}">
			    <table>
			     <colgroup>
			        <col width="5%">
			        <col width="75%">
			        <col width="10%">
			        <col width="10%">
	   			</colgroup>
	   			  <tr>
	   			  </tr>
			      <tr>
			        <th colspan="4" style="text-align: left;"><input type="text" name="t_btitle" id="t_btitle" value="${map.tbdto.t_btitle}"></th>
			      </tr>
			      <tr style="border-bottom: 2px solid #009223">
			        <td colspan="4"><strong style="text-align: center;">작성자 | </strong>
			        <input type="text" value="${map.tbdto.id}" readonly="readonly" style="border: 1px solid transparent;">
			        </td>
			      </tr>
			      <tr>
			        <td colspan="4" class="article"><textarea rows="9" name="t_bcontent" id="summernote" placeholder=" ※ 게시글 내용을 입력해주세요.">${map.tbdto.t_bcontent}</textarea></td>
			      </tr>
			      <tr style="border-bottom: 2px solid #009223; line-height: 20px;">
			        <td colspan="4" class="article">파일 첨부 : ${map.tbdto.t_bfile}</td>
			      </tr>
			      <tr style="border-bottom: 2px solid #009223; line-height: 20px;">
			        <td colspan="4" class="article"><input type="file" name="files" id="file"></td>
			      </tr>
			    </table>
			<div class="listBtn">
		    	<button type="submit" class="list tUpdateBtn">수정</button>
			</div>
			</form>
			<div class="listBtn">
		    	<a href="tView?t_bno=${map.tbdto.t_bno}"><button class="list ">취소</button></a>
			</div>
 		 </section>
		<!-- ======= Footer ======= -->
	  	<%@include file="../include/footer.jsp" %>
	 	<!-- End Footer -->
	</body>
</html>