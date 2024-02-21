<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
		<link href="../assets/css/community/viewStyle.css" rel="stylesheet">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		
		<!-- Template nWrite JS File -->
  		<script src="../assets/js/community/pView.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
	</head>
	 <script>
   		let id = "${session_id}";
   		let p_bno = ${map.pbdto.p_bno};
   		let join = 0; //파티참여 상태 0:미참여 1: 참여
   		let joinCount = ${map.joinCount}
   		let p_bnum = ${ map.pbdto.p_bnum }
   		let joinSize = ${ map.pJList.size() }
   		let temp = 0;
    </script>
	<body>
	<!-- ======= Header ======= -->
	<%@include file="../include/header.jsp" %>
	<!-- End Header -->
	<!-- 파티원모집 글보기-->
		<section class="notice_search">
	    	<h1 style="float: left; margin: 40px 0 0 700px; font-weight: 700; position: relative; left:50px;">파티원 모집</h1>
		     <form action="#" id="partyViewFrm"  method="post">
		    	<input type="hidden" name="p_bno" value="${map.pbdto.p_bno }"> <!-- 파티원모집 수정 및 삭제 게시판 번호 넘기기 Form-->
		    </form>
		    <table>
		     <colgroup>
		        <col width="10%">
		        <col width="50%">
		        <col width="20%">
		        <col width="20%">
   			</colgroup>
		      <tr>
		        <th style="text-align: center;"><strong id="p_bno">${map.pbdto.p_bno }</strong></th>
		        <th style="text-align: left;"><span>[${map.pbdto.p_btype }] ${map.pbdto.p_btitle }</span></th>
		        <th style="text-align: right;"><strong>모집상태</strong></th>
		        <th>
			        <c:if test="${map.pbdto.p_bnum!=map.pJList.size() }"><span id="ing_join" style="color: blue;">모집중</span></c:if>
			    	<c:if test="${map.pbdto.p_bnum==map.pJList.size()}"><span id="ed_join" style="color: red;">모집완료</span></c:if>
		        </th>
		      </tr>
		      <tr style="border-bottom: 2px solid #009223">
		        <td style="text-align: center;"><strong>파티장</strong style="text-align: center;"></td>
		        <td>${map.pbdto.id }</td>
		        <td style="text-align: right;"><strong>파티인원</strong></td>
		        <td><strong id="partyJoinNum">${map.pJList.size()}</strong>명&nbsp;/&nbsp;<span>${map.pbdto.p_bnum }명</span></td>
		      </tr>
		      <tr>
		        <td colspan="6" class="article">${map.pbdto.p_bcontent }<br>
		        <c:if test="${map.pbdto.p_bfile!=null }">
		        	<img src="/upload/${map.pbdto.p_bfile }">
	          	</c:if>
		        </td>
		      </tr>
		      <c:if test="${map.pbdto.p_bfile!=null }">
		      <tr style="border-bottom: 2px solid #009223;">
		        <td class="article"><strong>첨부파일</strong>
		        </td>
		        <td colspan="5">${map.pbdto.p_bfile }</td>
		      </tr>
		      </c:if>
		      <c:if test="${map.pbdto.p_bfile==null }">
		      <tr style="border-bottom: 2px solid #009223;">
		        <td class="article"><strong>첨부파일</strong>
		        </td>
		        <td colspan="5">※첨부파일 없음</td>
		      </tr>
		      </c:if>
		    </table>
		    
		    <!-- 참석자 -->
		    <div class="participant">
			<c:forEach var="pjdto" items="${map.pJList }" begin="0" end="4">
		    	<div class="participant_no" id="${pjdto.p_jcno }">
		    		<div class="participant_img" style="background-image: url('../upload/${pjdto.m_img}'); background-repeat: no-repeat; background-size: cover;"></div>
			    	<div class="participant_in">
				    	<tr>
				    		<td><strong>파티원(ID)</strong></td>
				    		<td>${pjdto.id}</td>
				    		</br>
				    		<td><strong>닉네임</strong></td>
				    		<td>${pjdto.nickname}</td>&nbsp;
				    	</tr>
				    	<c:if test="${session_id==pjdto.id }">
		    				<span id="pJoinDelBtn"><i class="fa fa-sign-out" id="pJoinDelBtnTxt" aria-hidden="true">탈퇴</i></span>
				    	</c:if>
		    		</div>
		    	</div>
			</c:forEach>
		    	
		    </div>
		    <!-- 버튼 -->
		    <div class="listBtn">
	    		<button class="list" id="pJoinBtn">파티참가</button>
		    	<c:if test="${session_id==map.pbdto.id }">
		    	<button class="list" id="pDeleteBtn">삭제</button>
		    	<button class="list" id="pUpdateBtn">수정</button>
		    	</c:if>
		    	<a href="pList"><button class="list">목록</button></a>
		    </div>
		    
		    <!-- 댓글입력-->
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
		   
		    <!-- 댓글보기-->
		    <div class="reply_body">
		    <table style="margin-top: 30px;">
		      <td style="font-weight: 700">총<strong style="color: #009223" class="p_count">${map.pCList.size() }</strong>&nbsp;개의 댓글이 등록되었습니다.</td>
			  <tbody id="replyBox">
			  <c:forEach var="pCommentList" items="${map.pCList }">
				  <tr id="${pCommentList.p_cno }">
				  <input type="hidden" value="${pCommentList.p_cpw }" class="p_cpw">
					<td><strong style="color: navy">댓글 작성자</strong> | <strong style="color: #009223;" class="p_cid">${pCommentList.id }</strong>&nbsp;&nbsp;<span class="p_cdate"><fmt:formatDate value="${pCommentList.p_cdate }" pattern="YYYY-MM-dd HH:mm:ss"/> </span>
					<li id="replyTxt">&nbsp;&nbsp;${pCommentList.p_ccontent }</li>
					<li id="replyBtn">
						<button class="rDelBtn">삭제</button>
						<button class="rUBtn">수정</button>
					</li>
					</td>			
				  </tr>
			  </c:forEach>
			   <!-- 댓글 수정입력창 
			   <tr id="#">
				<td><strong style="color: navy;">댓글 작성자</strong> | <span style="color: #009223; font-weight: 700;">aaa</span>&nbsp;&nbsp;<span>[ 2024-02-05 ]</span>
				<li style="list-style: none; float: right; line-height: 27px;"><strong>비밀번호 |<strong><input type="text" value="1234" placeholder=" ※입력시 비밀글로 저장"></li>
				<li id="replyTxt"><textarea cols="145%"></textarea></li>
				<li id="replyBtn">
					<button class="rCanBtn">취소</button>
					<button class="rSaveBtn">저장</button>
				</li>
				</td>			
			  </tr>
					 -->	
			  </tbody>
		    </table>
		    </div>
		    <!-- 댓글보기 끝-->
		    
 		 </section>
		
		<!-- ======= Footer ======= -->
	  	<%@include file="../include/footer.jsp" %>
	 	<!-- End Footer -->
	</body>
</html>