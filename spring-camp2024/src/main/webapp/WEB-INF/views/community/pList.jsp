<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>파티원 모집</title>
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
	</head>
	<script>
		$(function(){
			$("#searchBtn").click(function(){
				
				if($("#searchWord").val().length<1){
					alert("※ 검색어를 입력해주세요.");
					$("#searchWord").focus();
					return false;
				}//if(검색어 미입력시)
				
			 alert("test");
				
			 pSearchFrm.submit();
				
			});//#searchBtn(파티원 모집 검색어)
		});//제이쿼리 최신
	</script>
	<body>
	<!-- ======= Header ======= -->
	<%@include file="../include/header.jsp" %>
	<!-- End Header -->
	
		<section class="notice">
			<!-- 공지사항 리스트 -->
	    	<h1 style="margin: 10px; font-weight: 700; position: relative; top: 70px; left: -560px; ">파티원 모집</h1>
		    <!-- 검색창 -->
		    <div class="searchDiv">
			  <form action="pList" name="pSearchFrm" method="get">
			    <select name="pCategory" id="searchTitle" class="category">
			       <option value="all">전체</option>
			       <option value="p_btitle">제목</option>
			       <option value="p_bcontent">내용</option>
			       <option value="p_local">지역</option>
			       <option value="id">작성자</option>
			    </select>
			    	<input type="text" name="pSearchWord" id="searchWord" class="searchWord" placeholder=" 검색어를 입력해주세요.">
			    	<button type="button" onclick="searchBtn()" id="searchBtn" class="searchBtn">검색</button>
			  </form>
			</div>
			<table>
		  		<div class="page-title">
			      <colgroup>
			        <col width="10%">
			        <col width="10%">
			        <col width="40%">
			        <col width="10%">
			        <col width="7%">
			        <col width="5%">
			        <col width="7%">
			        <col width="10%">
			      </colgroup>
			      <tr>
			        <th>No.</th>
			        <th>캠핑유형</th>
			        <th>제목</th>
			        <th>작성자</th>
			        <th>지역</th>
			        <th>모집인원</th>
			        <th>모집상태</th>
			        <th>작성일</th>
			      </tr>
		          <c:if test="${map.list.size()==0 }">
		            <tr>
			        	<td colspan="8"> <strong>※ 게시글이 존재 하지 않습니다.</strong></td>
			      	</tr>
	              </c:if>    
			      <c:forEach var="pbdto" items="${map.list }">
				      <c:if test="${pbdto.p_bnum!=8}">
					      <tr>
					        <td id="No">${pbdto.p_bno}</td>
					        <td style="font-weight: 700;">${pbdto.p_btype}</td>
					        <td class="table-title"><a href="pView?p_bno=${pbdto.p_bno }">${pbdto.p_btitle}</a></td>
					        <td>${pbdto.id}</td>
					        <td>${pbdto.p_local}</td>
					        <td>${pbdto.p_bnum}</td>
					        <td><strong style="color: blue;">모집중</strong></td>
					        <td><fmt:formatDate value="${pbdto.p_bdate}" pattern="YYYY-MM-dd"/></td>
					      </tr>
				      </c:if>
				      <c:if test="${pbdto.p_bnum==8}">
					      <tr>
					        <td id="No">${pbdto.p_bno}</td>
					        <td style="font-weight: 700;">${pbdto.p_btype}</td>
					        <td class="table-title" style="color: gray; text-decoration: none">${pbdto.p_btitle}</td>
					        <td>${pbdto.id}</td>
					        <td>${pbdto.p_local}</td>
					        <td>${pbdto.p_bnum}</td>
					        <td><strong style="color: red;">모집완료</strong></td>
					        <td><fmt:formatDate value="${pbdto.p_bdate}" pattern="YYYY-MM-dd"/></td>
					      </tr>
				      </c:if>
			      </c:forEach>
		  		</div>
		    </table>
			 	<a href="pWrite"><button class="write">글쓰기</button></a>
  			 	<button class="write" onclick="location.href='/'">메인홈</button>
	    	
	    	<!-- 하단넘버링 시작 -->
		     <ul class="page-num">
			     <c:if test="${map.page<=1 }">
				      <li class="first"></li>
			     </c:if>
			     <c:if test="${map.page>1 }">
				      <a href="pList?page=1&pCategory=${map.pCategory }&pSearchWord=${map.pSearchWord}"><li class="first"></li></a>
			     </c:if>
		     	
		     	<c:if test="${map.page<=1 }">
			      <li class="prev"></li>
		     	</c:if>
		     	<c:if test="${map.page>1 }">
			      <a href="pList?page=${map.page-1 }&pCategory=${map.pCategory }&pSearchWord=${map.pSearchWord}"><li class="prev"></li></a>
		     	</c:if>
			      
			      <!--페이지 넘버링 -->
			      <c:forEach var="i" begin="${map.startArryPage }" end="${map.endArryPage }" step="1">
			      	<c:if test="${map.page==i }">
			      		<li class="num on">${i }</li>
			      	</c:if>
			      	<c:if test="${map.page!=i }">
			      		<a href="pList?page=${i}&pCategory=${map.pCategory}&pSearchWord=${map.pSearchWord}"><li class="num"> ${i }</li></a>
			      	</c:if>
			      </c:forEach>
			      <!--페이지 넘버링 -->
			      
			      <c:if test="${map.page>=map.maxArryPage }">
			      	<li class="next"></li>
			      </c:if>
			      <c:if test="${map.page<map.maxArryPage }">
			     	<a href="pList?page=${map.page+1 }&pCategory=${map.pCategory }&pSearchWord=${map.pSearchWord}"><li class="next"></li></a>
			      </c:if>
			      
			      <c:if test="${map.page>=map.maxArryPage }">
			      	<li class="last"></li>
			      </c:if>
			      <c:if test="${map.page<map.maxArryPage }">
			      	<a href="pList?page=${map.maxArryPage }&pCategory=${map.pCategory }&pSearchWord=${map.pSearchWord}"><li class="last"></li></a>
			      </c:if>
   			 </ul>
	    	<!-- 하단넘버링 끝 -->
		</section>
		
		<!-- ======= Footer ======= -->
	  	<%@include file="../include/footer.jsp" %>
	 	<!-- End Footer -->
	</body>
</html>