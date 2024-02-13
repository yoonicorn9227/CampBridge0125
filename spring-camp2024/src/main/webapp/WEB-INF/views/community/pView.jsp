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
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
	</head>
	 <script>
    	$(function(){
    		let join =0; //파티참여 상태 0:미참여 1: 참여
    		
    		$("#pDeleteBtn").click(function(){
    			if(confirm("게시글을 삭제하시겠습니까?")){
    				$("#partyViewFrm").attr("action", "pDelete").submit();
    			}//if(confirm)
    		});//#pDeleteBtn(파티원 게시글 삭제)
    		
    		$("#pUpdateBtn").click(function(){
    			if(confirm("게시글을 수정하시겠습니까?")){
    				$("#partyViewFrm").attr("action", "pUpdate").submit();
    			}//if(confirm)
    		});//#pUpdateBtn(파티원 게시글 수정)
    		
    		$("#pJoinBtn").click(function(){
    			
    			if(${session_id==null}){
    				alert("※ 로그인시 파티에 참여 할 수 있습니다.");
    				return false;
    			}//if(로그인이 되어 있지 않을 경우)
    				
    				
    			if(confirm("★파티에 참여 하시겠습니까?")){
    				
    				if(join==1){
    					alert("※ 파티에 이미 참여하셨습니다.");
    					return false;
    				}//if(파티참여 ajax)
    				
    				if(${map.joinCount==1}){
    					alert("※ 파티에 이미 참여하셨습니다.");
    					return false;
    				}//if(파티참여)
    					
    				if(${map.pbdto.p_bnum}<=${map.pJList.size()}){
    					alert("※ 파티원 인원이 만석입니다.");
    					return false;
    				}//if(모집인원 만석시)
    				
    				//alert($(this).parent().prev().prev().find("tr").find("#p_bno").text())
    				//alert(Number($("#partyJoinNum").text()));
    				let id ="${session_id}";
    				let p_bno=$(this).parent().prev().prev().find("tr").find("#p_bno").text()
    				let p_jCount = Number($("#partyJoinNum").text());
    				//♠ajax(파티참가)
    				$.ajax({
    					url:"/community/partyJoin",
    					type:"post",
    					data:{"id":id,"p_bno":p_bno},
    					dataType:"json",
    					success:function(data){
    						//console.log(data)
    						let jdata="";
    						jdata+='<div class="participant_no" id="'+data.p_jcno+'">';
    					    jdata+= '<div class="participant_img" style="background-image: url(\'../upload/' + data.m_img + '\'); background-repeat: no-repeat; background-size: cover;"></div>';
    						jdata+='<div class="participant_in">';
    						jdata+='<tr>';
    						jdata+='<td><strong>파티원(ID)</strong></td>';
    						jdata+='<td>'+data.id+'</td>';
    						jdata+='</br>';
    						jdata+='<td><strong>닉네임</strong></td>';
    						jdata+='<td>'+data.nickname+'</td>';
    						jdata+='</tr>';
    						if("${session_id==data.id}"){
	    						jdata+='<span id="pJoinDelBtn" style="display: inline; list-style: none; cursor: pointer;"><i class="fa fa-trash-o" aria-hidden="true" style="font-weight: 700; color: red">탈퇴</i></span>';
    						}
    						jdata+='</div>';
    						jdata+='</div>';
    						
	   						$(".participant").append(jdata);
	   					   	$("#partyJoinNum").text(p_jCount+1);
	   						
	   					   	if($("#partyJoinNum").text()==${map.pbdto.p_bnum}){
	   					   	$("#ing_join").css("color", "red").text("모집완료");
	   					   	}//if
	   					   	
	   						join=1; //파티참여
	   						
	   						
    					},//success
    					error(){
    						alert("실패");
    					}//error
    				});//ajax(파티참가)
    				
    			}//if(confirm)
    		
    		});//#pJoinBtn(파티에 참여)
    		
    		//2. 파티원 탈퇴
   			$(document).on("click", "#pJoinDelBtn", function(){
   				//alert($(this).parent().parent().attr("id"))
   				//alert(Number($("#partyJoinNum").text()));
   				let p_jcno = $(this).parent().parent().attr("id");
   				let p_jCount = Number($("#partyJoinNum").text());
   				
   				if(confirm("※ 파티원을 탈퇴하시겠습니까?")){
   				   //♠ajax(파티원 탈퇴)
   				   $.ajax({
   					   url:"/community/pJoinDelete",
   					   type:"post",
   					   data:{"p_jcno":p_jcno},
   					   dataType:"text",
   					   success:function(data){
   						   $("#"+p_jcno).remove();// 파티원 탈퇴 삭제
   						   $("#partyJoinNum").text(p_jCount-1);
   					   },//success
   					   error(){alert("실패")}//error
   				   });//ajax(파티원 탈퇴) */
   				   alert("파티원에서 탈퇴했습니다.");
   				   
   				if($("#partyJoinNum").text()<=${map.pbdto.p_bnum}) {
   					$("#ing_join").css("color", "blue").text("모집중");
				   	}//if
   				   
   				   
   				   join=0; //파티 미참여
   				}//if(confirm)
   			});//파티원 탈퇴
    		
    	});//제이쿼리 최신
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
				    		<td>${pjdto.nickname}</td>
				    	</tr>
				    	<c:if test="${session_id==pjdto.id }">
		    				<span id="pJoinDelBtn" style="display: inline; list-style: none; cursor: pointer;"><i class="fa fa-trash-o" aria-hidden="true" style="font-weight: 700; color: red">탈퇴</i></span>
				    	</c:if>
		    		</div>
		    	</div>
			</c:forEach>
		    	
		    </div>
		    <!-- 버튼 -->
		    <div class="listBtn">
	    		<button class="list" id="pJoinBtn">파티참가</button>
		    	<button class="list" id="pDeleteBtn">삭제</button>
		    	<button class="list" id="pUpdateBtn">수정</button>
		    	<a href="pList"><button class="list">목록</button></a>
		    </div>
		    
		    <!-- 비밀댓글입력-->
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
		   	<!-- 댓글등록창 스크립트 -->
		   	<script>
		   		$(function(){
		   			let p_bno = ${map.pbdto.p_bno}
		   			let id = "${session_id}";
		   			let temp = 0; // 댓글 수정창 비활성화 temp=1 (활성화)
		   			
		   			//1. 하단댓글 1개 저장
		   			$("#replybtn").click(function(){
		   			let p_cpw = $("#replyIPw").val();
		   			let p_ccontent = $("#replyCont").val();
		   			let p_count = Number($(".p_count").text());
		   				if(${session_id==null}){
		   					alert("※ 로그인 상태에서만 댓글이 등록됩니다.");
		   					return false;
		   				}//로그인 미실시
		   				
		   				if($("#replyCont").val().length<1){
		   					alert("※ 댓글 미입력시 댓글등록 되지 않습니다.");
		   					$('#replyCont').focus();
		   					return false;
		   				}//if(댓글 미입력시)
		   					
		   			//♠파티원 하단댓글 저장 ajax
		   				$.ajax({
		   					url:"/community/pCommentInsert",
		   					type:"post",
		   					data:{"p_bno":p_bno, "id":id, "p_cpw":p_cpw, "p_ccontent":p_ccontent},
		   					dataType:"json",
		   					success:function(data){
		   						alert("댓글이 등록 되었습니다.");
		   						
		   						let pdata="";
		   						pdata+='<tr id="'+data.p_cno+'">';
		   						pdata+='<input type="hidden" value="'+data.p_cpw+'" class="p_cpw">';
		   						pdata+='<td><strong style="color: navy">댓글 작성자</strong> | <strong style="color: #009223;" class="p_cid">'+data.id+'</strong>&nbsp;&nbsp;<span class="p_cdate">'+moment(data.p_cdate).format("YYYY-MM-DD HH:mm:ss")+'</span>';
		   						pdata+='<li id="replyTxt">&nbsp;&nbsp;'+data.p_ccontent+'</li>';
		   						pdata+='<li id="replyBtn">';
		   						pdata+='<button class="rDelBtn">삭제</button>&nbsp;';
		   						pdata+='<button class="rUBtn">수정</button>';
		   						pdata+='</li>';
		   						pdata+='</td>';
		   						pdata+='</tr>';
		   						$("#replyBox").prepend(pdata);
		   						$(".p_count").text(p_count+1);
		   						$("#replyCont").val("");
		   						$("#replyIPw").val("");
		   					},//success
		   					error(){alert("실패");}//error
		   				});//ajax(댓글저장)
		   					
		   			});//#replyBtn(댓글저장)
		   			
		   			//2. 하단댓글 1개 삭제
		   			$(document).on("click", ".rDelBtn", function(){
		   				let p_cno = $(this).closest("tr").attr("id");
		   				let p_count = Number($(".p_count").text());
		   				
		   				if(confirm("※ 댓글을 삭제하시겠습니까?")){
		   				   //♠ajax(파티원 댓글 삭제)
		   				   $.ajax({
		   					   url:"/community/pCommentDelete",
		   					   type:"post",
		   					   data:{"p_cno":p_cno},
		   					   dataType:"text",
		   					   success:function(data){
		   						   $("#"+p_cno).remove();// 하단댓글 삭제
		   						   $(".p_count").text(p_count-1);
		   					   },//success
		   					   error(){alert("실패")}//error
		   				   });//ajax(댓글삭제)
		   				   alert("댓글이 삭제되었습니다.")
		   				}//if(confirm)
		   			});//하단댓글 삭제
		   			
		   			//3. 하단댓글 1개 수정창 활성화
		   			$(document).on("click",".rUBtn",function(){
		   				if (temp != 0) {
		   					alert("다른 댓글 수정창이 열려있습니다.");
		   					return false;
		   				}//if(다중수정 입력창 방지) 
		   				let p_cno = $(this).closest("tr").attr("id");
		   				let id = $(this).parent().parent().find(".p_cid").text();
		   				let p_cdate = $(this).parent().parent().find("span").text();
		   				let p_ccontent = $(this).parent().prev().text();
		   				let p_cpw = $(this).parent().parent().prev().val();
		   					
		   				let pdata='';
		   				pdata+='<td><strong style="color: navy;">댓글 작성자</strong> | <strong style="color: #009223;" class="p_cid">'+id+'</strong>&nbsp;&nbsp;[<span class="p_cdate">'+p_cdate+'</span>]';
		   				pdata+='<li style="list-style: none; float: right; line-height: 27px;"><strong>비밀번호 |<strong><input type="text" value="'+p_cpw+'" placeholder=" ※입력시 비밀글로 저장" class="p_cpw"></li>';
		   				pdata+='<li id="replyTxt"><textarea cols="145%">'+p_ccontent+'</textarea></li>';
		   				pdata+='<li id="replyBtn">';
		   				pdata+='<button class="rCanBtn">취소</button>&nbsp;';
		   				pdata+='<button class="rSaveBtn">저장</button>';
		   				pdata+='</li>';
		   				pdata+='</td>';
						
		   				$("#" + p_cno).html(pdata); //기존 HTML 삭제후 추가
		   				temp = 1; //수정창 활성화
		   			});//하단댓글 1개 수정창 활성화
		   			
		   			//4. 하단댓글 1개 수정저장
		   			$(document).on("click",".rSaveBtn",function(){
		   				let p_cpw = $(this).parent().parent().parent().prev().prev().find(".p_cpw").val();
		   				let p_ccontent = $(this).parent().parent().parent().prev().find("textarea").val();
		   				let p_cno = $(this).closest("tr").attr("id");
		   				
		   				alert(p_cno);
		   				alert(p_cpw);
		   				alert(p_ccontent);
		   			 //♠ajax(파티원 댓글 수정저장)
		   				   $.ajax({
		   					   url:"/community/pCommentUpdate",
		   					   type:"post",
		   					   data: {"p_cno":p_cno,"p_cpw":p_cpw,"p_ccontent":p_ccontent},
		   					   dataType:"json",
		   					   success:function(data){
		   						
		   						let pdata="";   
		   						pdata+='<input type="hidden" value="'+data.p_cpw+'" class="p_cpw">';
		   						pdata+='<td><strong style="color: navy">댓글 작성자</strong> | <strong style="color: #009223;" class="p_cid">'+data.id+'</strong>&nbsp;&nbsp;<span class="p_cdate">'+moment(data.p_cdate).format("YYYY-MM-DD HH:mm:ss")+'</span>';
		   						pdata+='<li id="replyTxt">'+data.p_ccontent+'</li>';
		   						pdata+='<li id="replyBtn">';
		   						pdata+='<button class="rDelBtn">삭제</button>&nbsp;';
		   						pdata+='<button class="rUBtn">수정</button>';
		   						pdata+='</li>';
		   						pdata+='</td>';
		   						pdata+='</tr>';
		   						
		   						$("#" + p_cno).html(pdata); //기존 HTML 삭제후 추가
		   					   },//success
		   					   error(){alert("실패")}//error
		   				   });//ajax(댓글수정저장)
		   				alert("댓글을 수정하였습니다.");
		   				temp=0;
		   			});////하단댓글 1개 수정저장
		   			
		   			//5. 하단댓글 1개 수정취소
		   			$(document).on("click",".rCanBtn",function(){
		   				let p_cno = $(this).closest("tr").attr("id");
		   				let id = $(this).parent().parent().parent().parent().find(".p_cid").text();
		   				let p_cdate = $(this).parent().parent().parent().parent().find("span").text();
		   				let p_ccontent = $(this).parent().parent().parent().prev().find("textarea").val();
		   				let p_cpw = $(this).parent().parent().parent().parent().find("strong").find("input").val();
		   			
		   				let pdata = "";
		   				pdata += '<input type="hidden" value="'+p_cpw+'" class="p_cpw">';
		   				pdata += '<td><strong style="color: navy;">댓글 작성자</strong> | <strong style="color: #009223;" class="p_cid">'+id+'</strong>&nbsp;&nbsp;[<span class="p_cdate">'+p_cdate+'</span>]';
		   				pdata += '<li id="replyTxt">'+p_ccontent+'</li>';
		   				pdata += '<li id="replyBtn">';
		   				pdata += '<button class="rDelBtn">삭제</button>&nbsp';
		   				pdata += '<button class="rUBtn">수정</button>';
		   				pdata += '</li>';
		   				pdata += '</td>';
		   				pdata += '</tr>';
		   				$("#" + p_cno).html(pdata); //기존 HTML 삭제후 추가
		   				temp = 0;//댓글 수정창 비활성화
		   			});//댓글 수정취소
		   				
		   			
		   		});//제이쿼리 최신
		   	</script>
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