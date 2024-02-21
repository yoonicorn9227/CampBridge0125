<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<c:if test="${session_id==null }">
			<script>
			 alert("※ 로그인 상태만 접근이 가능합니다.")
			 location.href="../my/login";
			</script>
		</c:if>
		<meta charset="UTF-8">
		<title>파티원모집_글수정</title>
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
		
		<!-- Template nWrite JS File -->
  		<script src="../assets/js/community/pUpdate.js"></script>
	</head>
	<body>
	<!-- ======= Header ======= -->
	<%@include file="../include/header.jsp" %>
	<!-- End Header -->
	<!-- 글쓰기 -->
		<section class="notice">
	    	<h1 style="float: left; margin: 40px; font-weight: 700; position: relative; left:235px; top: 30px;">파티원모집 수정</h1>
			<form action="doPUpdate" name="partyUpdateFrm" method="post" enctype="multipart/form-data">
			    <input type="hidden" name="pFile" value="${map.pbdto.p_bfile}">
			    <input type="hidden" name="p_bno" value="${map.pbdto.p_bno }">
			    <table>
			     <colgroup>
			        <col width="19%">
			        <col width="43%">
			        <col width="29%">
			        <col width="9%">
	   			</colgroup>
			      <tr>
			      <th style="text-align: left;" >
		        	 	<select name="p_btype" id="p_bType" class="p_bType">
					       <option value="오토캠핑" <c:if test="${fn:contains(map.pbdto.p_btype,'오토캠핑')}">selected</c:if>>오토캠핑</option>
					       <option value="노지캠핑" <c:if test="${fn:contains(map.pbdto.p_btype,'노지캠핑')}">selected</c:if>>노지캠핑</option>
					       <option value="차박캠핑" <c:if test="${fn:contains(map.pbdto.p_btype,'차박캠핑')}">selected</c:if>>차박캠핑</option>
					       <option value="모토캠핑" <c:if test="${fn:contains(map.pbdto.p_btype,'모토캠핑')}">selected</c:if>>모토캠핑</option>
					       <option value="글램핑" <c:if test="${fn:contains(map.pbdto.p_btype,'글램핑')}">selected</c:if>>글램핑</option>
					       <option value="백캠핑" <c:if test="${fn:contains(map.pbdto.p_btype,'백캠핑')}">selected</c:if>>백캠핑</option>
					    </select>
			      </th>
			        <th style="text-align: left;"><input type="text" id="p_btitle" name="p_btitle" placeholder=" ※ 게시글 제목을 입력해주세요." value="${map.pbdto.p_btitle }"></th>
			        <th style="text-align: right;"><strong>파티인원ㅣ</strong>
			        </th>
			        <th style="text-align: left;">
		        	 	<select name="p_bnum" id="p_bnum" class="p_bType">
					       <option value="1"<c:if test="${fn:contains(map.pbdto.p_bnum,'1')}">selected</c:if>>1명</option>
					       <option value="2"<c:if test="${fn:contains(map.pbdto.p_bnum,'2')}">selected</c:if>>2명</option>
					       <option value="3"<c:if test="${fn:contains(map.pbdto.p_bnum,'3')}">selected</c:if>>3명</option>
					       <option value="4"<c:if test="${fn:contains(map.pbdto.p_bnum,'4')}">selected</c:if>>4명</option>
					    </select>
			        </th>
			      </tr>
			      <tr style="border-bottom: 2px solid #009223">
			        <td style="text-align: left;" ><strong>파티장 |<span>&nbsp;&nbsp;${map.pbdto.id }</span> </strong></td>
			        <td><input type="hidden" name="id" value="${map.pbdto.id }"></td>
			        <td style="text-align: right;" ><strong>캠핑지역 | </strong></td>
			        <td style="text-align: left">
		        	<select name="p_local" id="p_local" class="p_bType" style="width: 100%;">
				       <option value="서울시"<c:if test="${fn:contains(map.pbdto.p_local,'서울시')}">selected</c:if>>서울시</option>
				       <option value="부산시"<c:if test="${fn:contains(map.pbdto.p_local,'부산시')}">selected</c:if>>부산시</option>
				       <option value="대구시"<c:if test="${fn:contains(map.pbdto.p_local,'대구시')}">selected</c:if>>대구시</option>
				       <option value="인천시"<c:if test="${fn:contains(map.pbdto.p_local,'인천시')}">selected</c:if>>인천시</option>
				       <option value="광주시"<c:if test="${fn:contains(map.pbdto.p_local,'광주시')}">selected</c:if>>광주시</option>
				       <option value="대전시"<c:if test="${fn:contains(map.pbdto.p_local,'대전시')}">selected</c:if>>대전시</option>
				       <option value="울산시"<c:if test="${fn:contains(map.pbdto.p_local,'울산시')}">selected</c:if>>울산시</option>
				       <option value="세종시"<c:if test="${fn:contains(map.pbdto.p_local,'세종시')}">selected</c:if>>세종시</option>
				       <option value="경기도"<c:if test="${fn:contains(map.pbdto.p_local,'경기도')}">selected</c:if>>경기도</option>
				       <option value="강원도"<c:if test="${fn:contains(map.pbdto.p_local,'강원도')}">selected</c:if>>강원도</option>
				       <option value="충청북도"<c:if test="${fn:contains(map.pbdto.p_local,'충청북도')}">selected</c:if>>충청북도</option>
				       <option value="충청남도"<c:if test="${fn:contains(map.pbdto.p_local,'충청남도')}">selected</c:if>>충청남도</option>
				       <option value="전라북도"<c:if test="${fn:contains(map.pbdto.p_local,'전라북도')}">selected</c:if>>전라북도</option>
				       <option value="전라남도"<c:if test="${fn:contains(map.pbdto.p_local,'전라남도')}">selected</c:if>>전라남도</option>
				       <option value="경상북도"<c:if test="${fn:contains(map.pbdto.p_local,'경상북도')}">selected</c:if>>경상북도</option>
				       <option value="경상남도"<c:if test="${fn:contains(map.pbdto.p_local,'경상남도')}">selected</c:if>>경상남도</option>
				       <option value="제주도"<c:if test="${fn:contains(map.pbdto.p_local,'제주도')}">selected</c:if>>제주도</option>
				    </select>
			        </td>
			      </tr>
			      <tr>
			        <td colspan="4" class="article"><textarea rows="9" name="p_bcontent" id="summernote" placeholder=" ※ 게시글 내용을 입력해주세요.">${map.pbdto.p_bcontent }</textarea> </td>
			      </tr>
			      <c:if test="${map.pbdto.p_bfile!=null }">
			        <tr style="border-top: 2px solid #009223; line-height: 20px;">
				        <td colspan="4" class="article"><strong>업로드 파일 | </strong>${map.pbdto.p_bfile}</td>
			        </tr>
			      </c:if>
			      <c:if test="${map.pbdto.p_bfile==null }">
			     	<tr style="border-top: 2px solid #009223; line-height: 20px;">
				        <td colspan="4" class="article"><strong>업로드 파일 | </strong>※첨부파일 없음</td>
			        </tr>
			      </c:if>
			      <tr style="border-bottom: 2px solid #009223; line-height: 20px;">
			        <td colspan="4" class="article"><input type="file" name="p_uBfile" id="p_bfile"></td>
			      </tr>
			    </table>
			</form>
			<div class="listBtn">
		    	<a href="#"><div class="list" id="updateSaveBtn">수정</div></a>
		    	<a href="pList"><div class="list">취소</div></a>
			</div>
 		 </section>
		
		<!-- ======= Footer ======= -->
	  	<%@include file="../include/footer.jsp" %>
	 	<!-- End Footer -->
	</body>
</html>