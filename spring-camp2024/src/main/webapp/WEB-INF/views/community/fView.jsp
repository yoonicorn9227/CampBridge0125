<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>자유게시판_게시글</title>
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
	</head>
	<script>
		$(function(){
			$("#fDelBtn").click(function(){
				if(confirm("게시글을 삭제 하시겠습니까?")){
				$("#freeViewFrm").attr("action","fDelete").submit();
				}//if-confirm(게시글 삭제 확인창)
			});//#fDelBtn(게시글 삭제)
			
			$("#fUpdateBtn").click(function(){
				if(confirm("게시글을 수정 하시겠습니까?")){
				$("#freeViewFrm").attr("action","fUpdate").submit();
				}//if-confirm(게시글 수정 확인창)
			});//#fUpdateBtn(게시글 수정)
		
		
		
		});//제이쿼리 최신
	</script>
	<body>
	<!-- ======= Header ======= -->
	<%@include file="../include/header.jsp" %>
	<!-- End Header -->
	
		<section class="notice">
		
			<!-- 자유게시글 보기 -->
	    	<h1 style="float: left; margin: 40px 0 0 700px; font-weight: 700; position: relative; left:50px;">자유게시판 게시글</h1>
		    
			<!-- 자유게시글 수정 및 삭제 값넘기기 Form-->
		    <form action="#" id="freeViewFrm" method="post">
		    	<input type="hidden" name="f_bno" value="${map.fbdto.f_bno }">
		    </form>
		    
		    <table>
		     <colgroup>
		        <col width="10%">
		        <col width="63%">
		        <col width="15%">
		        <col width="12%">
   			</colgroup>
		      <tr>
		        <th style="text-align: center;"><strong>${map.fbdto.f_bno }</strong></th>
		        <th style="text-align: left;"><span>[${map.fbdto.f_btype }]</span>&nbsp;&nbsp;<span>${map.fbdto.f_btitle }</span></th>
		        <th style="text-align: right;"><strong>작성일</strong></th>
		        <th><fmt:formatDate value="${map.fbdto.f_bdate}" pattern="yyyy-MM-dd"/></th>
		      </tr>
		      <tr style="border-bottom: 2px solid #009223">
		        <td style="text-align: center;"><strong>작성자</strong style="text-align: center;"></td>
		        <td>${map.fbdto.id }</td>
		        <td style="text-align: right;"><strong>조회수</strong></td>
		        <td>${map.fbdto.f_bhit }</td>
		      </tr>
		      <tr>
		        <td colspan="4" class="article">${map.fbdto.f_bcontent }<br><br>
		          <c:if test="${map.fbdto.f_bfile!=null }">
		        	<img src="/upload/${map.fbdto.f_bfile }">
		          </c:if>
		        <br><br><br><br><br></td>
		      </tr>
		       <tr style="border-bottom: 2px solid #009223;">
		        <td class="article" style="text-align: center;"><strong>첨부파일 </strong>
		        </td>
		        <c:if test="${map.fbdto.f_bfile!=null }">
		       	 	<td colspan="3">${map.fbdto.f_bfile }</td>
		        </c:if>
		        <c:if test="${map.fbdto.f_bfile==null }">
		        	<td colspan="3">※첨부파일 없음</td>
		        </c:if>
		      </tr>
		    </table>
		    
		    <!-- 버튼 -->
		    <div class="listBtn">
		    	<button class="list" id="fDelBtn">삭제</button>
		    	<button class="list" id="fUpdateBtn">수정</button></a>
		    	<a href="fList"><button class="list">목록</button></a>
		    </div>
		    
		    <!-- 댓글입력-->
		    <script>
		    	$(function(){
		    		let f_bno = ${map.fbdto.f_bno};
		    		$("#replybtn").click(function(){
		    			alert("댓글이 등록되었습니다.");
		    			let f_cpw = $("#replyIPw").val();
		    			let f_ccontent = $("#replyCont").val();
		    			
		    			//♠ajax
		    			$.ajax({
		    				url:"/community/fCommentInsert",
		    				type:"post",
		    				data:{"f_bno":f_bno,"f_cpw":f_cpw,"f_ccontent":f_ccontent},
		    				dataType:"json", //data를 받는 타입
		    				success:function(data){
		    					alert("성공");
		    					//console.log(data);
		    					let hdata ="";
		    					hdata+='<tr id="'+data.f_cno+'">';
		    					hdata+='<td><strong style="color: navy;">댓글 작성자</strong> | <span style="color: #009223; font-weight: 700;">'+data.id+'</span>&nbsp;&nbsp;<span>['+data.f_cdate+']</span>';
		    					hdata+='<li id="replyTxt">&nbsp;&nbsp;'+ data.f_ccontent+'</li>';
		    					hdata+='<li id="replyBtn">';
		    					hdata+='<button id="rDelBtn">삭제</button>';
		    					hdata+='<button id="rUBtn">수정</button>';
		    					hdata+='</li>';
		    					hdata+='</td>';
		    					hdata+='</tr>';
		    					
		    					
		    					$("#replyBox").prepend(hdata);
		    				}, //success
		    				error(){
		    					alert("실패");
		    					
		    				}//error
		    			
		    			});//ajax(댓글)
		    			
		    		});//replybtn(댓글저장)
		    		
		    	});//제이쿼리 최신
		    </script>
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
		    
		    <!-- 이전글/다음글-->
		    <table style="margin-top: -150px; ">
		      <tr>
		        <td colspan="4"><strong>다음글▲</strong> <span class="separator">|</span>
		        	<c:if test="${map.nextFbdto!=null }">
		        	<a href="fView?f_bno=${map.nextFbdto.f_bno }" class="selNextPrev"> ${map.nextFbdto.f_btitle }</a>
		        	</c:if>
		        	<c:if test="${map.nextFbdto==null }">
		        	 <span style="color: red; font-weight: 700;">※ 다음 게시글이 없습니다.</span>
		        	</c:if>
		        </td>
		      </tr>
		      <tr>
		        <td colspan="4"><strong>이전글▼</strong> <span class="separator">|</span>
		        <c:if test="${map.prevFbdto!=null }">
		        	<a href="fView?f_bno=${map.prevFbdto.f_bno }" class="selNextPrev"> ${map.prevFbdto.f_btitle }</a>
		        </c:if>
		        <c:if test="${map.prevFbdto==null }">
		        	<span style="color: red; font-weight: 700;">※ 이전 게시글이 없습니다.</span>
		        </c:if>
		        </td>
		      </tr>
		    </table>
		    <!-- 이전글/다음글 끝-->
		    
		    <!-- 댓글보기-->
		    <table  style="margin-top: 70px;">
		    	<tr>
		     		<td style="font-weight: 700"><strong>댓 글|</strong>&nbsp;&nbsp;총<strong style="color: #009223">&nbsp;${map.fCmmtlist.size() }</strong>&nbsp;개의 댓글이 등록되었습니다.</td>
		    	</tr>
			    <c:forEach var="fCommentList" items="${map.fCmmtlist }">
					  <tr id="replyBox"style="width: 100%">
					  <tr id="${fCommentList.f_cno }">
						<td><strong style="color: navy;">댓글 작성자</strong> | <span style="color: #009223; font-weight: 700;">${fCommentList.id}</span>&nbsp;&nbsp;<span>[ ${fCommentList.f_cdate } ]</span>
						<li id="replyTxt">&nbsp;&nbsp; ${fCommentList.f_ccontent}</li>
						<li id="replyBtn">
							<button id="rDelBtn">삭제</button>
							<button id="rUBtn">수정</button>
						</li>
						</td>			
					  </tr>
					  </tr>
			    </c:forEach>
		    </table>
		    <!-- 댓글보기 끝-->
		    
 		 </section>
		
		<!-- ======= Footer ======= -->
	  	<%@include file="../include/footer.jsp" %>
	 	<!-- End Footer -->
	</body>
</html>