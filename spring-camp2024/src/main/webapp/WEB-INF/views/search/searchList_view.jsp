<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>검색어리스트-게시글</title>
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
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
		
		<!-- Template nWrite JS File -->
  		<script src="../assets/js/community/fView.js"></script>
	</head>
	<script>
		let f_bno = ${map.bdto.bno};
		let id ="${session_id}";
		let temp=0; //댓글 수정창 비활성화
	</script>
	<body>
	<!-- ======= Header ======= -->
	<%@include file="../include/header.jsp" %>
	<!-- End Header -->
	<!-- 자유게시글 보기 -->
		<section class="notice">
	    	<h1 style="float: left; margin: 40px 0 0 700px; font-weight: 700; position: relative; left:50px;"><a href="searchList">검색어 게시글</a></h1>
		    <form action="#" id="freeViewFrm" method="post">
		    	<input type="hidden" name="bno" value="${map.bdto.bno }"> <!-- 자유게시글 수정 및 삭제 게시판 번호 넘기기 Form-->
		    </form>
		    <table>
		     <colgroup>
		        <col width="10%">
		        <col width="63%">
		        <col width="15%">
		        <col width="12%">
   			</colgroup>
		      <tr>
		        <th style="text-align: center;"><strong id="f_bno">${map.bdto.bno }</strong></th>
		        <th style="text-align: left;"><span>${map.bdto.btitle }</span></th>
		        <th style="text-align: right;"><strong>작성일</strong></th>
		        <th><fmt:formatDate value="${map.bdto.bdate}" pattern="yyyy-MM-dd"/></th>
		      </tr>
		      <tr style="border-bottom: 2px solid #009223">
		        <td style="text-align: center;"><strong>작성자</strong style="text-align: center;"></td>
		        <td>${map.bdto.id }</td>
		        <td style="text-align: right;"><strong>조회수</strong></td>
		        <td>${map.bdto.bhit }</td>
		      </tr>
		      <tr>
		        <td colspan="4" class="article">${map.bdto.bcontent }<br><br>
		          <c:if test="${map.bdto.bfile!=null }">
		        	<img src="/upload/${map.bdto.bfile }">
		          </c:if>
		        <br><br><br><br><br></td>
		      </tr>
		       <tr style="border-bottom: 2px solid #009223;">
		        <td class="article" style="text-align: center;"><strong>첨부파일 </strong>
		        </td>
		        <c:if test="${map.bdto.bfile!=null }">
		       	 	<td colspan="3">${map.bdto.bfile }</td>
		        </c:if>
		        <c:if test="${map.bdto.bfile==null }">
		        	<td colspan="3">※첨부파일 없음</td>
		        </c:if>
		      </tr>
		    </table>
		    
		    <!-- 버튼 -->
		    <div class="listBtn">
		    	<c:if test="${session_id==map.bdto.id or session_id=='admin'}">
		    	<button class="list" id="fDelBtn">삭제</button>
		    	</c:if>
		    	<c:if test="${session_id==map.bdto.id }">
		    	<button class="list" id="fUpdateBtn">수정</button></a>
		    	</c:if>
		    	<button class="list" id="fReplyBtn">답글</button></a>
		    	<a href="searchList"><button class="list">목록</button></a>
		    </div>
		    <!-- 버튼 -->
		    
		    <!-- 댓글입력창-->
		    <table id="replyPw">
			    <tr>
				    <td id="replyBorder">
					 	<strong>댓글 비밀번호&nbsp;&nbsp;</strong><input type="password" name="replyPw" id="replyIPw" placeholder=" ※ 입력시 비밀글로 저장">
				    </td>
			    </tr>
		    </table>
			 <table style="position: relative; bottom: 200px;">
			  <tr>
			  	<td style="display: flex; border: 1px solid white; margin: -80px 0 0 -20px;">
				  	<textarea id="replyCont" placeholder=" ※ 댓글을 입력하세요. (타인을 향한 욕설 및 비방은 무통보 삭제됩니다.)" style="width: 1200px; "></textarea>
				  	<button id="replybtn">등록</button>
			  	</td>
			  </tr>
		   	</table>
		    <!-- 댓글입력창-->
		    
		    <!-- 이전글/다음글-->
		    <table style="margin-top: -150px; ">
		      <tr>
		        <td colspan="4"><strong>다음글▲</strong> <span class="separator">|</span>
		        	<c:if test="${map.nextbdto!=null }">
		        	<a href="searchList_view?bno=${map.nextbdto.bno }" class="selNextPrev"> ${map.nextbdto.btitle }</a>
		        	</c:if>
		        	<c:if test="${map.nextbdto==null }">
		        	 <span style="color: red; font-weight: 700;">※ 다음 게시글이 없습니다.</span>
		        	</c:if>
		        </td>
		      </tr>
		      <tr>
		        <td colspan="4"><strong>이전글▼</strong> <span class="separator">|</span>
		        <c:if test="${map.prebdto!=null }">
		        	<a href="searchList_view?bno=${map.prebdto.bno }" class="selNextPrev"> ${map.prebdto.btitle }</a>
		        </c:if>
		        <c:if test="${map.prebdto==null }">
		        	<span style="color: red; font-weight: 700;">※ 이전 게시글이 없습니다.</span>
		        </c:if>
		        </td>
		      </tr>
		    </table>
		    <!-- 이전글/다음글 끝-->
		    
		    <!-- 댓글보기-->
		    <table style="margin-top: 70px;">
		    	<tr>
		     		<td style="font-weight: 700"><strong>댓 글|</strong>&nbsp;&nbsp;총<strong style="color: #009223">&nbsp;${map.fCmmtlist.size() }</strong>&nbsp;개의 댓글이 등록되었습니다.</td>
		    	</tr>
		    	<tbody id="replyBox">
				    <c:forEach var="fCommentList" items="${map.fCmmtlist }">
							  <tr id="${fCommentList.f_cno }">
							  	<input type="hidden" value="${fCommentList.f_cpw }" class="f_cpw">
								<td><strong style="color: navy;">댓글 작성자</strong> | <strong style="color: #009223;" class="f_cid">${fCommentList.id}</strong>
								&nbsp;&nbsp;[<span class="f_cdate"><fmt:formatDate value="${fCommentList.f_cdate }" pattern="YYYY-MM-dd HH:mm:ss"/> </span>]
									<li id="replyTxt">${fCommentList.f_ccontent}</li>
									<li id="replyBtn">
										<c:if test="${session_id==fCommentList.id or session_id=='admin'}">
											<button class="rDelBtn">삭제</button>
										</c:if>
										<c:if test="${session_id==fCommentList.id}">
											<button class="rUBtn">수정</button>
										</c:if>
									</li>
								</td>			
							  </tr>
					  <!-- 나중에 
					  <c:if test="${session_id!=fCommentList.id or session_id!='admin'}">
						  <c:if test="${fCommentList.f_cpw!=null}">
						  	<tr id="${fCommentList.f_cno }">
						  	<input type="hidden" value="${fCommentList.f_cpw }" class="f_cpw">
							<td><strong style="color: navy;">댓글 작성자</strong> | <strong style="color: #009223;" class="f_cid">${fCommentList.id}</strong>
							&nbsp;&nbsp;[<span class="f_cdate"><fmt:formatDate value="${fCommentList.f_cdate }" pattern="YYYY-MM-dd HH:mm:ss"/> </span>]
							<li id="replyTxt" style="color: red;">※ 비밀댓글입니다.(댓글 작성자와 관리자만 열람이 가능합니다.)</li>
						  	</tr>
						  </c:if>
					  </c:if>
					  -->
						  <!-- 댓글 수정입력창 
						   <tr id="${fCommentList.f_cno }">
							<td><strong style="color: navy;">댓글 작성자</strong> | <span style="color: #009223; font-weight: 700;">${fCommentList.id}</span>&nbsp;&nbsp;<span>[ ${fCommentList.f_cdate } ]</span>
							<li style="list-style: none; float: right; line-height: 27px;"><strong>비밀번호 |<strong><input type="text" value="${fCommentList.f_cpw }" placeholder=" ※입력시 비밀글로 저장"></li>
							<li id="replyTxt"><textarea cols="145%">${fCommentList.f_ccontent}</textarea></li>
							<li id="replyBtn">
								<button class="rCanBtn">취소</button>
								<button class="rSaveBtn">저장</button>
							</li>
							</td>			
						  </tr>
						 -->
					  <!-- 비밀댓글  
					  <c:if test="${fCommentList.f_cpw!=null ||fCommentList.f_cpw!='' }">
						  <tr id="${fCommentList.f_cno }">
							<td><strong style="color: navy;">댓글 작성자</strong> | <span style="color: #009223; font-weight: 700;">${fCommentList.id}</span>&nbsp;&nbsp;<span>[ ${fCommentList.f_cdate } ]</span>
							<li id="replyTxt">&nbsp;&nbsp; <span style="color: #009223; font-weight: 700;">※ 비밀 댓글입니다. (작성자 또는 관리자 열람가능)</span></li>
							</td>			
						  </tr>
					  </c:if>
					  -->
				    </c:forEach>
		    	</tbody>
		    </table>
		    <!-- 댓글보기 끝-->
		    
 		 </section>
		
		<!-- ======= Footer ======= -->
	  	<%@include file="../include/footer.jsp" %>
	 	<!-- End Footer -->
	</body>
</html>