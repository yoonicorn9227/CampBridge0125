<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>자유게시판</title>
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
		<link href="../assets/css/commuinty/listStyle.css" rel="stylesheet">
	</head>
	<script>
		$(function(){
			$("#searchBtn").click(function(){
				if($("#searchWord").val().length<1){
					alert("※검색어를 입력해주세요.");
					$("#searchWord").focus();
					return false;
				}//if
				alert("입려하신 검색어로 검색합니다.");
				fsearchFrm.submit();
				
			});//#searchBtn
		});//제이쿼리 최신
	</script>
	<body>
	<!-- ======= Header ======= -->
	<%@include file="../include/header.jsp" %>
	<!-- End Header -->
	
		<section class="notice">
			<!-- 자유게시판 리스트 -->
	    	<h1 style="margin: 10px; font-weight: 700; position: relative; top: 40px; left: -570px; ">자유 게시판</h1>
		    <!-- 검색창 -->
		    <div class="searchDiv">
			  <form action="fsearch" name="fsearchFrm" method="get" >
			    <select name="searchTitle" id="searchTitle" class="searchTitle">
			       <option value="all">전체</option>
			       <option value="f_btitle">제목</option>
			       <option value="f_bcontent">내용</option>
			       <option value="id">작성자</option>
			    </select>
			    	<input type="text" name="searchWord" id="searchWord" class="searchWord" placeholder=" 검색어를 입력해주세요.">
			    	<button type="button" onclick="searchBtn()" id="searchBtn" class="searchBtn">검색</button>
			  </form>
			</div>
			<table>
		  		<div class="page-title">
			      <colgroup>
			        <col width="8%">
			        <col width="12%">
			        <col width="44%">
			        <col width="15%">
			        <col width="10%">
			        <col width="10%">
			      </colgroup>
			      <tr>
			        <th>No.</th>
			        <th>게시글 유형</th>
			        <th>제목</th>
			        <th>작성자</th>
			        <th>작성일</th>
			        <th>조회수</th>
			      </tr>
			      <c:forEach var="fbdto" items="${map.list }">
				      <tr>
				        <td id="No">${fbdto.f_bno }</td>
				        <td>${fbdto.f_btype }</td>
				        <td class="table-title"><a href="fView?f_bno=${fbdto.f_bno }">${fbdto.f_btitle}</a></td>
				        <td>${fbdto. id}</td>
				        <td>
				        <fmt:formatDate value="${fbdto.f_bdate }" pattern="yyyy-MM-dd"/></td>
				        <td>${fbdto.f_bhit }</td>
				      </tr>
			      </c:forEach>
		  		</div>
		    </table>
			 	<a href="fWrite"><button class="write">글쓰기</button></a>
  			 	<button class="write" onclick="location.href='/'">메인홈</button>
	    	
	    	<!-- 하단넘버링 시작 -->
		     <ul class="page-num">
			      <a href="fList?page=1"><li class="first"></li></a>
			      
			      <c:if test="${map.page<=1 }">
			      	<li class="prev"></li>
			      </c:if>
			      <c:if test="${map.page>1 }">
			      	<a href="fList?page=${map.page-1 }"><li class="prev"></li></a>
			      </c:if>
			      
			      <c:forEach var="i" begin="${map.startPageNum }" end="${map.endPageNum }" step="1">
				      <c:if test="${map.page==i }">
					      <li class="num on">${i}</li>
				      </c:if>
				      <c:if test="${map.page!=i }">
				      	<a href="fList?page=${i }"><li class="num">${i}</li></a>
				      </c:if>
			      </c:forEach>
			     
			     <c:if test="${map.page<map.maxPageNum }">
			      	<a href="fList?page=${map.page+1 }"><li class="next"></li></a>
			     </c:if>
			     <c:if test="${map.page>=map.maxPageNum }">
			      	<li class="next"></li>
			     </c:if>
			      
			      <a href="fList?page=${map.maxPageNum }"><li class="last"></li></a>
   			 </ul>
   			 <!-- 하단넘버링 끝 -->
		</section>
		
		<!-- ======= Footer ======= -->
	  	<%@include file="../include/footer.jsp" %>
	 	<!-- End Footer -->
	</body>
</html>