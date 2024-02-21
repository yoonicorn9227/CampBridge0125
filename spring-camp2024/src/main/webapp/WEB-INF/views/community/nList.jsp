<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 게시글</title>
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
	
	    <!-- JS File -->
	    <script src="../assets/js/community/n_total.js"></script>
	    
	    <!-- Template Main CSS File -->
	    <link href="../assets/css/main2.css" rel="stylesheet">
		<link href="../assets/css/header.css" rel="stylesheet">
		<link href="../assets/css/community/listStyle.css" rel="stylesheet">
		<link href="../assets/css/community/nstyle.css" rel="stylesheet">
	</head>
	<body>
	<!-- ======= Header ======= -->
	<%@include file="../include/header.jsp" %>
	<!-- End Header -->
	
		<section class="notice">
		<!-- 공지사항 리스트 -->
		<h1 style="margin: 10px; font-weight: 700; position: relative; top: 40px; left: -600px; ">공지사항</h1>
		    <!-- 검색창 -->
		    <div class="searchDiv">
			  <form action="nList" method="get" name="nListSearchFrm">
			    <select name="category" id="searchTitle" class="searchTitle">
			       <option value="all">전체</option>
			       <option value="n_btitle">제목</option>
			       <option value="n_bcontent">내용</option>
			    </select>
			    	<input type="text" name="searchWord" id="searchWord" class="searchWord" placeholder=" 검색어를 입력해주세요.">
			    	<button type="button" id="searchBtn" class="searchBtn">검색</button>
			  </form>

			</div>
			<table class="nList_table">
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
			  
			      <c:forEach var="n_bdto" items="${map.list}">
			      <tr>
			        <td id="No">${n_bdto.n_bno }</td>
			        <c:if test="${n_bdto.n_btype=='instapayment'}">
			       	 <td>공지사항</td>
			        </c:if> 
			        
			        <c:if test="${n_bdto.n_btype=='event'}">
			        	<td>이벤트</td>
			        </c:if> 
				
			        <td class="table-title1">
			        <a href="nView?n_bno=${n_bdto.n_bno}">${n_bdto.n_btitle}</a>
			        </td>
			    

			        <td>${n_bdto.id }</td>
			        <td>
			        <fmt:formatDate value="${n_bdto.n_bdate}" pattern="yyyy-MM-dd"/>
			        </td>
			        <td>${n_bdto.n_bhit}</td>
			      </tr>
			      </c:forEach>
		  		</div>
		    </table>
		   
		    <!-- 로그인 안되어 있을 경우, 글쓰기 금지 -->
			 	<a href="nWrite" id="n_write"><button class="write" >글쓰기</button></a>
  			 	<button class="write" onclick="location.href='/'">메인홈</button>
	    	
	    	<!-- 하단넘버링 시작 -->
		     <ul class="page-num">
		     
			      <a href="nList?page=1&category=${map.category}&searchWord=${map.searchWord}"><li class="first"></li></a>
			      <c:if test="${map.page>1 }">
			      	<a href="nList?page=${map.page-1}&category=${map.category}&searchWord=${map.searchWord}"><li class="prev"></li></a>
			      </c:if>
					<c:if test="${map.page<=1 }">
			       	<li class="prev"></li>
			       </c:if>
			       
			       <c:forEach var="i" begin="${map.startPage}" end="${map.endPage}">
			       	<c:if test="${map.page==i}">
			       		<li class="num on"><div>${i}</div></li>
			       	</c:if>
			       	<c:if test="${map.page!=i}">
			       		<a href="nList?page=${i}&category=${map.category}&searchWord=${map.searchWord}">
			       			<li class="num"><div>${i}</div></li>
			       		</a>
			       	</c:if>
			     </c:forEach>
			     
			     <c:if test="${map.page<map.maxPage }">
			     	<a href="nList?page=${map.page+1}&category=${map.category}&searchWord=${map.searchWord}"><li class="next"></li></a>
			     </c:if>
			     <c:if test="${map.page>=map.maxPage}">
			     	<li class="next"></li>
			     </c:if>
			      <a href="nList?page=${map.maxPage}&category=${map.category}&searchWord=${map.searchWord}"><li class="last"></li></a>
   			 </ul>
   			 
   			 <!-- 하단넘버링 끝 -->
		</section>
		
		<!-- ======= Footer ======= -->
	  	<%@include file="../include/footer.jsp" %>
	 	<!-- End Footer -->
	</body>
</html>