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
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
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
		    		let temp=0; //댓글 수정창 비활성화
		    		let f_bno = ${map.fbdto.f_bno};
		    		//1.댓글저장
		    		$("#replybtn").click(function(){
		    			
		    			let id ="${session_id}";
		    			let f_cpw = $("#replyIPw").val();
		    			let f_ccontent = $("#replyCont").val();
		    			
		    			if($("#replyCont").val().length<1){
		    				alert("※ 댓글 미입력시 댓글등록 되지 않습니다.");
		    				$('#replyCont').focus();
		    				return false;
		    			}//if(댓글 미입력시)
		    			
		    			//♠ajax
		    			$.ajax({
		    				url:"/community/fCommentInsert",
		    				type:"post",
		    				data:{"f_bno":f_bno,"id":id,"f_cpw":f_cpw,"f_ccontent":f_ccontent},
		    				dataType:"json", //data를 받는 타입
		    				success:function(data){
		    					alert("댓글이 등록되었습니다.");
		    					console.log(data);
		    					let hdata ="";
		    					hdata+='<tr id="'+data.f_cno+'">';
		    					hdata+='<input type="hidden" value="'+data.f_cpw+'" class="f_cpw">';
		    					hdata+='<td><strong style="color: navy;">댓글 작성자</strong> | <strong style="color: #009223;" class="f_cid">'+data.id+'</strong>&nbsp;&nbsp;[<span class="f_cdate">'+moment(data.f_cdate).format("YYYY-MM-DD HH:mm:ss")+'</span>]';
		    					hdata+='<li id="replyTxt">'+data.f_ccontent+'</li>';
		    					hdata+='<li id="replyBtn">';
		    					hdata+='<button class="rDelBtn">삭제</button>&nbsp';
		    					hdata+='<button class="rUBtn">수정</button>';
		    					hdata+='</li>';
		    					hdata+='</td>';
		    					hdata+='</tr>';
		    					$("#replyBox").prepend(hdata);
		    					$("#replyCont").val("");
		    					$("#replyIPw").val("");
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
		    <script>
		    $(function(){
		    	let temp=0; //댓글 수정창 비활성화
				
		    	//2. 댓글 삭제
		    	$(document).on("click",".rDelBtn",function(){
	    			//alert("부모의 부모의 부모 id(f_cno) : "+$(this).closest("tr").attr("id")); //=//alert("부모의 부모의 부모 id(f_cno) : "+$(this).parent().parent().parent().attr("id"));
	    			let f_cno = $(this).closest("tr").attr("id");
	    			if(confirm("댓글을 삭제 하시겠습니까?")){
	    				
	    				//♠ajax(댓글삭제)
	    				$.ajax({
	    					url:"/community/fCommentDelete",
		    				type:"post",
		    				data:{"f_cno":f_cno},
		    				dataType:"text", //data를 받는 타입
		    				success:function(data){
		    					$("#"+f_cno).remove();//삭제
		    				}, //success
		    				error(){
		    					alert("실패");
		    				}//error
	    				});//ajax(댓글삭제)
	    				alert("댓글을 삭제되었습니다.");
	    			}//if(댓글 삭제)
	    		});//(댓글삭제)
	    		
	    		//3. 댓글 수정(프로그램 미완성)
	    		$(document).on("click",".rUBtn",function(){
					if(temp!=0){
						alert("다른 댓글 수정창이 열려있습니다.");
						return false;
					}//if(다중수정 입력창 방지) 
	    			//alert("댓글 내용 : "+$(this).parent().prev().text()); //내용
	    			//alert("댓글 작성자 : "+$(this).parent().prev().prev().prev().text()); //작성자
	    			//alert("댓글 작성일 : "+$(this).parent().parent().find("span").text()); // 작성일
					
	    			let f_cno=$(this).closest("tr").attr("id");
	    			let id="${session_id}"; 
	    			let f_cdate=$ (this).parent().parent().find("span").text();
	    			let f_ccontent =$(this).parent().prev().text();
	    			let f_cpw =$(this).parent().parent().prev().val();
	    			//alert("비번 : "+$(this).parent().parent().prev().val());
	    			
	    			let hdata ='';
	    			hdata+='<td><strong style="color: navy;">댓글 작성자</strong> | <strong style="color: #009223;" class="f_cid">'+id+'</strong>&nbsp;&nbsp;[<span class="f_cdate">'+f_cdate+'</span>]';
	    			hdata+='<li style="list-style: none; float: right; line-height: 27px;"><strong>비밀번호 |<strong><input type="text" value="'+f_cpw+'" placeholder=" ※입력시 비밀글로 저장" class="f_cpw"></li>';
	    			hdata+='<li id="replyTxt"><textarea cols="145%">'+f_ccontent+'</textarea></li>';
	    			hdata+='<li id="replyBtn">';
	    			hdata+='<button class="rCanBtn">취소</button>&nbsp&nbsp';
	    			hdata+='<button class="rSaveBtn">저장</button>';
	    			hdata+='</li>';
	    			hdata+='</td>';
	    			
	    			$("#"+f_cno).html(hdata); //기존 HTML 삭제후 추가
	    			temp=1; //수정창 활성화
	    		});//댓글수정 
	    		
	    		
	    		// 댓글 수정저장
	    		$(document).on("click",".rSaveBtn",function(){
	    			alert("댓글수정 완료");
	    			//alert("아이디 : "+$(this).parent().parent().parent().parent().find(".f_cid").text());
	    			//alert("날짜 : "+$(this).parent().parent().parent().parent().find(".f_cdate").text());
	    			//alert("비번 : "+$(this).parent().parent().parent().prev().prev().find(".f_cpw").val());
	    			//alert("내용 : "+$(this).parent().parent().parent().prev().find("textarea").val());
	    			
	    			//let id = $(this).parent().parent().parent().parent().find(".f_cid").text();
	    			let f_cpw = $(this).parent().parent().parent().prev().prev().find(".f_cpw").val();
	    			let f_ccontent = $(this).parent().parent().parent().prev().find("textarea").val();
	    			let f_cno= $(this).closest("tr").attr("id");
	    			
	    			//♠ajax(댓글 수정저장)
	    			$.ajax({
	    				url:"/community/fCommentUpdate",
	    				type:"post",
	    				data:{"f_cno":f_cno,"f_cpw":f_cpw,"f_ccontent":f_ccontent},
	    				dataType:"json",
	    				success:function(data){
	    					alert("성공")
		    				let hdata ="";
			    			hdata+='<input type="hidden" value="'+data.f_cpw+'" class="f_cpw">';
			    			hdata+='<td><strong style="color: navy;">댓글 작성자</strong> | <strong style="color: #009223;" class="f_cid">'+data.id+'</strong>&nbsp;&nbsp;[<span class="f_cdate">'+moment(data.f_cdate).format("YYYY-MM-DD HH:mm:ss")+'</span>]';
			    			hdata+='<li id="replyTxt">'+data.f_ccontent+'</li>';
							hdata+='<li id="replyBtn">';
							hdata+='<button class="rDelBtn">삭제</button>&nbsp';
							hdata+='<button class="rUBtn">수정</button>';
							hdata+='</li>';
							hdata+='</td>';
							hdata+='</tr>';
			    			$("#"+f_cno).html(hdata); //기존 HTML 삭제후 추가
	    				},//success
	    				error(){
	    					alert("실패");
	    				}//error
	    			});//ajax(댓글 수정저장)
	    			temp=0; 
	    		});// 댓글수정 저장
	    		
	    		
	    		
	    		//댓글 수정취소
	    		$(document).on("click",".rCanBtn",function(){
	    			//alert("댓글 수정을 취소합니다.");
	    			//alert("댓글 수정을 취소 f_cno : "+$(this).closest("tr").attr("id"));
	    			//alert("댓글 수정을 취소 f_cdate : "+$(this).parent().parent().find("span").text());
	    			//alert("댓글 수정을 취소 f_ccontent : "+$(this).parent().prev().text());
	    			let f_cno=$(this).closest("tr").attr("id");
	    			let id ="${session_id}"; //${session_id} 변경예정
	    			let f_cdate=$(this).parent().parent().parent().parent().find("span").text();
	    			let f_ccontent=$(this).parent().parent().parent().prev().find("textarea").val();
	    			let f_cpw=$(this).parent().parent().parent().parent().find("strong").find("input").val();
	    			//alert("비번 : "+$(this).parent().parent().parent().prev().prev().find(".f_cpw").val());
	    			//alert("내용 : "+$(this).parent().parent().parent().prev().find("textarea").val());
	    			//alert("날짜 : "+$(this).parent().parent().parent().parent().find("span").text());
	    			//console.log("내용"+$(this).parent().parent().parent().prev().find("textarea").val());
	    			
	    			
	    			let hdata ="";
	    			hdata+='<input type="hidden" value="'+f_cpw+'" class="f_cpw">';
	    			hdata+='<td><strong style="color: navy;">댓글 작성자</strong> | <strong style="color: #009223;" class="f_cid">'+id+'</strong>&nbsp;&nbsp;[<span class="f_cdate">'+f_cdate+'</span>]';
	    			hdata+='<li id="replyTxt">'+f_ccontent+'</li>';
					hdata+='<li id="replyBtn">';
					hdata+='<button class="rDelBtn">삭제</button>&nbsp';
					hdata+='<button class="rUBtn">수정</button>';
					hdata+='</li>';
					hdata+='</td>';
					hdata+='</tr>';
	    			$("#"+f_cno).html(hdata); //기존 HTML 삭제후 추가
	    			temp=0;//댓글 수정창 비활성화
	    		});//댓글 수정취소
	    		
	    		
		    });//제이쿼리 최신
		    </script>
		    <table style="margin-top: 70px;">
		    	<tr>
		     		<td style="font-weight: 700"><strong>댓 글|</strong>&nbsp;&nbsp;총<strong style="color: #009223">&nbsp;${map.fCmmtlist.size() }</strong>&nbsp;개의 댓글이 등록되었습니다.</td>
		    	</tr>
		    	<tbody id="replyBox">
			    <c:forEach var="fCommentList" items="${map.fCmmtlist }">
					  <tr id="${fCommentList.f_cno }">
					  	<input type="hidden" value="${fCommentList.f_cpw }" class="f_cpw">
						<td><strong style="color: navy;">댓글 작성자</strong> | <strong style="color: #009223;" class="f_cid">${fCommentList.id}</strong>
						&nbsp;&nbsp;[<span class="f_cdate"><fmt:formatDate value="${fCommentList.f_cdate }" pattern="YYYY-MM-DD HH:mm:ss"/> </span>]
						<li id="replyTxt">${fCommentList.f_ccontent}</li>
						<li id="replyBtn">
							<button class="rDelBtn">삭제</button>
							<button class="rUBtn">수정</button>
						</li>
						</td>			
					  </tr>
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