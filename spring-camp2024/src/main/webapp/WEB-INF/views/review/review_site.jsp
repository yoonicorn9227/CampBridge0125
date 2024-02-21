<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑장리뷰 - 뷰</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Amatic+SC:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Inter:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="/assets/css/main2.css" rel="stylesheet">
<link href="/assets/css/review/reviewcontent.css" rel="stylesheet" type="text/css">
<link href="/assets/css/review/siteReview.css" rel="stylesheet" type="text/css">
<link href="/assets/css/review/listStyle2.css" rel="stylesheet" type="text/css">
<link href="/assets/css/review/header2.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

<script src="../assets/js/cps_review/RE_site.js"></script>
</head>
<style>
	.replynum{margin-left: 72px; margin-top: -53px; width: 200px; height: 22px;}
	.notice_img img{text-align: left; width:50%}
	.notice_noimgfile {padding: 20px 0 20px 48px;}
	.notice_noimg img{height:30px;}
	#notice_bfile{border-top : 1px solid silver; border-bottom : 1px solid silver;}
	.password{width: 75px; height: 28px; position: relative; top: 45px; left: 20px;}
</style>
<body>
	<!-- ======= Header ======= -->
	<%@include file="../include/header.jsp"%>
	<!-- End Header -->
	<section class="headerCss">
		<div id="contentWrap">
			<link type="text/css" rel="stylesheet" href="#">
			<div id="content">
				<div id="bbsData">
					<div class="page-body">
					
						<!-- 캠핑장 리뷰 메뉴 시작 -->
						<div class="camp-img-div">
							<img src="../assets/img/campReview/free_icon_icon.png" alt="캠핑용품리뷰" style="position: relative; margin-top: 40px; margin-bottom: 10px;">
							<h1 style="text-align: center;">캠핑장리뷰</h1>
						</div>
						<br>
						<!-- 캠핑장 리뷰 메뉴 끝 -->
	
						<form id="siteUpdateFrm" name="siteUpdateFrm" action="#" method="post" autocomplete="off" style="height: 1800px; position: relative; top: 100px; left: 270px;">
						<input type="hidden" name="cps_bno" value="${map.c_redto.cps_bno}">
						
						<!-- 본문 시작 -->
						<div class="bbs-table-view">
							<table summary="게시글 보기">
							
							<colgroup>
						        <col width="10%">
						        <col width="70%">
						        <col width="7%">
						        <col width="13%">
				   			</colgroup>
						    <tr>
						       <th style="text-align: left;"><strong>글제목</strong></th>
						       <th style="text-align: left;"><span>${map.c_redto.cps_btitle}</span></th>
						       <th style="text-align: left;"><strong>DATE</strong></th>
						       <th><fmt:formatDate value="${map.c_redto.cps_bdate}" pattern="yyyy-MM-dd"/></th>
						    </tr>
						    <tr style="border-bottom: 2px solid #009223;">
						       <td style="text-align: left; font-size: 15px;"><strong>NAME</strong></td>
						       <td style="font-size: 15px; text-align: left;">${map.c_redto.id}</td>
						       <td style="text-align: left; font-size: 15px;"><strong>HIT</strong></td>
						       <td style="font-size: 15px; text-align: left;">${map.c_redto.cps_bhit}</td>
						    </tr>
							<tr>
								<td>
									<div class="data-bd-cont">
										<div id="MS_WritenBySEB">${map.c_redto.cps_bcontent}</div>
										<!-- <br> <img src="../assets/img/campReview/campReview.jpg" style="width: 400px; height: 400px;"> -->
									</div>
								</td>
							</tr>
							</tbody>
						</table>
						<div id="comment_list_0">
							<div class="bfileUpload" style="border-bottom: 1px solid #eee; border-top: 1px solid #eee; height: 45px; display: flex; padding: 10px 0 10px 19px;">
								<tr id="notice_bfile">
									<td class="article" style="text-align: center;"><strong style="width: 100px">첨부파일</strong></td>
									<c:if test="${map.c_redto.cps_bfile!=null}">
										<td colspan="3">${map.c_redto.cps_bfile}</td>
									</c:if>
							</div>
									
							<div class="bfileUpload" style="border-bottom: 2px solid #009223; border-top: 1px solid #eee; height: 100%; display: flex; padding: 10px 0 10px 19px;">
									<tr style="border-bottom: 2px solid #009223;">
										<td class="notice_noimgfile"><strong  style="width: 100px">메인이미지</strong></td>
										<td colspan="3" class="notice_img" ><img src="/upload/${map.c_redto.cps_bfile}"></td>
									</tr>
								
									<c:if test="${map.c_redto.cps_bfile==null}">
										<td colspan="3">※첨부파일 없음※</td>
										<tr style="border-bottom: 2px solid #009223;">
											<td class="notice_noimgfile"><strong  style="width: 100px">이미지</strong></td>
											<td colspan="3" class="notice_noimg"><img src="#"></td>
										</tr>
									</c:if>
								</tr>
							</div>
						</div>
						<!-- 본문 끝 -->
						
						<!-- 이전글/다음글 시작-->
						<table style="margin-top: -80px; position: relative; top: 120px; font-size: 14px; width: 1100px;">
							<tr>
								<td colspan="4" style="border-bottom: 2px solid #eee;"><strong>다음글</strong>
								<c:if test="${map.next_c_redto != null}">
									<span class="separator">|</span><a href="review_site?cps_bno=${map.next_c_redto.cps_bno}">${map.next_c_redto.cps_btitle}</a></td>
								</c:if>
								<c:if test="${map.next_c_redto == null}">
									<span class="separator">|</span>다음글이 없습니다.
								</c:if>
							</tr>
							<tr>
								<td colspan="4"><strong>이전글</strong>
								<c:if test="${map.prev_c_redto != null}">
									<span class="separator">|</span><a href="review_site?cps_bno=${map.prev_c_redto.cps_bno}">${map.prev_c_redto.cps_btitle}</a></td>
								</c:if>
								<c:if test="${map.prev_c_redto == null}">
									<span class="separator">|</span>이전글이 없습니다.
								</c:if>
							</tr>
						</table>
						<!-- 이전글/다음글 끝-->
						
						<script>
					    	var authorId = "${map.c_redto.id}";
					        var currentUserId = "${session_id}";
					    </script>
						
						<div class="listBtn">
							<button type="button" class="list site_Delete">삭제</button>
							<button type="button" class="list site_Update">수정</button>
							<a href="siteReview"><button type="button" class="list">목록</button></a>
						</div>
											
						<!-- 댓글 입력 시작 -->
						<tr>
							<p class="password"><strong>비밀번호&nbsp;&nbsp;</strong><input type="password" class="replynum" placeholder=" ※ 입력시 비밀글로 저장"/></p>
						</tr>
						
						<script type="text/javascript">
							let temp = 0;
							let cps_bno = "${map.c_redto.cps_bno}";
						</script>
						
						<table>
							<tr>
								<textarea class="review_replyTxt" placeholder=" ※ 댓글을 입력하세요. (타인을 향한 욕설 및 비방은 무통보 삭제됩니다.)" style="width: 1000px; height: 88px; position: relative; bottom: 2px;"></textarea>
								<button type="button" id="replybtn" style="width: 90px; height: 88px;">등록</button>
							</tr>
						</table>
						<!-- 댓글 입력 끝 -->

						<!-- 댓글보기 시작-->
						<table style="margin-top: 70px; position: relative; top: -100px; font-size: 14px; width: 1100px; border-collapse: collapse;">
						    <tr>
						        <td style="font-weight: 700; border-bottom: 2px solid #eee;">총<strong class="cps_count" style="color: #009223; margin: 0 10px;">${map.Cps_commentlist.size()}</strong>&nbsp;개의 댓글이 등록되었습니다.</td>
						    </tr>
						    <tbody class="replyBox">
					        <c:forEach var="Cps_comment" items="${map.Cps_commentlist}" varStatus="loop">
						    <tr id="${Cps_comment.cps_cno}">
				                <td style="border-bottom: 2px solid #eee; padding: 10px;">
				                    <strong>댓글 작성자</strong> | <strong style="color: blue;"class="cps_id">${Cps_comment.id}</strong>&nbsp;&nbsp;[<span>${Cps_comment.cps_cdate}</span>]
				                    <li class="review_replyTxt">${Cps_comment.cps_ccontent}</li>
				                    <c:if test="${session_id == Cps_comment.id}">
				                    <li id="replyBtn">
				                        <button type="button" class="rDelBtn">삭제</button>&nbsp;
				                        <button type="button" class="rUBtn">수정</button>
				                    </li>
				                    </c:if>
				                    <c:if test="${session_id == Cps_comment.id}">
				                    <li id="replyBtn">
				                    </li>
				                    </c:if>
				                </td>
						    </tr>
						    
						    <!-- 수정창 시작-->
						    <!--  
						    <tr id="${Cps_comment.cps_bno}">
				                <td style="border-bottom: 2px solid #eee; padding: 10px;">
				                    <strong>댓글 작성자</strong> | <strong style="color: blue;">${Cps_comment.id}</strong>&nbsp;&nbsp;<span><fmt:formatDate value="${Cps_comment.cps_cdate}" pattern="YYYY-MM-DD HH:mm:ss"/></span>
				                    <li class="review_replyTxt"><textarea cols="145%">${Cps_comment.cps_ccontent}</textarea></li>
				                    <li id="replyBtn">
				                        <button type="button" class="cps_cancel">취소</button>&nbsp;
				                        <button type="button" class="cps_save">저장</button>
				                    </li>
				                </td>
						    </tr>
						    -->
							<!-- 수정창 끝-->  
							 
							<!-- 비밀댓글 시작 -->
							<!--  
							<c:if test="${Cps_comment.cps_cpw !=null || Cps_comment.cps_cpw!='' }">
								<tr id="${Cps_comment.cps_cno}">
									<td style="border-bottom: 2px solid #eee; padding: 10px;">
										<strong>댓글 작성자</strong> | <strong style="color: blue;">${Cps_comment.id}</strong>&nbsp;&nbsp;<span><fmt:formatDate value="${Cps_comment.cps_cdate}" pattern="YYYY-MM-dd HH:mm:ss"/></span>
										<li class="review_replyTxt">※ 비밀 댓글입니다.</li>
									</td>			
								</tr>
							</c:if>
							-->
							<!-- 비밀댓글 끝 -->
							 
					        </c:forEach>
						    </tbody>
						</table>

						<!-- 댓글보기 끝-->
						
						</div> <!-- bbs-table-view 본문 끝 -->
						</form>
					</div> <!-- .page-body -->
				</div> <!-- #bbsData -->
			</div> <!-- #content -->
		</div> <!-- #contentWrap -->
	</section>
	<!-- ======= Footer ======= -->
	<%@include file="../include/footer.jsp"%>
	<!-- End Footer -->
</body>
</html>