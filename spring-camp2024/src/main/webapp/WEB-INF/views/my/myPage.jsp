<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
 	   
	    <meta content="" name="description">
	    <meta content="" name="keywords">
	 	 <meta name="google-signin-client_id" content="YOUR_CLIENT_ID.apps.googleusercontent.com">
		
		
		
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
	    <link href="../assets/css/my/myPage.css" rel="stylesheet">
	
	    <!-- Template Main CSS File -->
	    <link href="../assets/css/main2.css" rel="stylesheet">
	    <link href="../assets/css/header.css" rel="stylesheet">
        
		<title>마이페이지</title>
	</head>
	<script>
		$(function(){
			let id ="${session_id}"
			$("#myInfoBtn").click(function(){
				myInfoFrm.submit();
			});//myInfoBtn
		});//JQuery
	</script>
	<body>
	<!-- ======= Header ======= -->
	<%@include file="../include/header.jsp" %>
	<!-- End Header -->
	<section>
	<form action="myInfo" name="myInfoFrm" method="post">
		<input type="hidden" name="id" value="${session_id}">
	</form>
		<div class="MF_all">
		<div class="titlePM">
			<h3>마이페이지</h3>
		</div>
		<div class="allCont">
			<div class="proF">
		     	<div class="photoPF">
		     		<img src="../upload/${udto.m_img}">
		     	</div>
		     	<div class="userSetting">
		     		<c:forEach var="userCampdto" items="${list}">
					<div class="userPF">
						
					</div>
					</c:forEach>
					<div class="setPF">
						<a class="icon-link-sawtooth" id="myInfoBtn"><img src="../assets/img/login/mySetting.png" alt="나의 게시물"><p>${udto.id}님</p></a>
					</div>
		     	</div>
		    </div><!--proF -->
			 <div class="orderD">
			 	<div class="orderDHigh_top">
				 	<h3>주문 및 배송조회</h3>
				 	<div class="myCartMF">
				 		<a href="../rent/cp_Cart"><img src="../assets/img/mypage/mycart.png" alt="장바구니"><br><p>장바구니</p></a>
				 	</div>
			 	</div>
			 	<ul class="orderGrayBox">
			 		<li>
			 			<em>0</em>
			 			<span>주문접수</span>
			 		</li>
			 
			 		<li>
			 			<em>0</em>
			 			<span>결제완료</span>
			 		</li>
			 
			 		<li>
			 			<em>0</em>
			 			<span>배송준비중</span>
			 		</li>
			 
			 		<li>
			 			<em>0</em>
			 			<span>배송중</span>
			 		</li>
			 
			 		<li>
			 			<em>0</em>
			 			<span>배송완료</span>
			 		</li>
			 	</ul>
			    
			 </div>
		</div><!--allCont  -->
		<!-- allCont 끝  -->
		
		<div class="allCont2">
			<aside class="sideIcon">
				<h2></h2>
				<nav id="navIcon">
					<a href="myList" class="icon-link"><img src="../assets/img/login/userME.png" alt="나의 게시글">
						<p>나의 게시글<br>전체 보기</p>
					</a>
			
					<a href="myParty" class="icon-link"><img src="../assets/img/login/party.png" alt="마이 파티">
						<p>마이 파티<br>전체 보기</p>
					</a>
					<a href="myRental" class="icon-link"><img src="../assets/img/login/myRent.png" alt="나의 게시글">
						<p>용품 대여<br>전체 보기</p>
					</a>
				</nav>
			</aside>
			<div class="containMP">
				<div class="contMP"><strong>나의 게시글</strong>
				<hr>
					<p>
					<a href="../used/usedcontent">[중고거래] ★거의 새 상품! 저렴하게 팝니다★ 씨투써밋 서모라이트 리액터 컴팩트 플러스 침낭 라이너</a><br>
					<a href="../review/review_site">[캠핑장리뷰] 경기용인카라반캠핑장 다녀왔어요 :)
					캠핑장이 호수랑 가까운데 간격은 아이들이 충분히 뛰어놀만큼 넉넉해요. 무엇보다 조용해서 좋더라구요.
					철수할 때 비가 와서 힘들었지만 가족과 함께 잘 놀고 잘 쉬다 왔습니다 ㅎㅎ</a>
					</p>
				</div>
				<div class="contMP"><strong>마이 파티</strong><br>
				<hr>
					<p>
					<a href="../community/pView">[파티 참여] 3월 둘째주 주말 불멍Night 함께하실 분들 모집합니다~~</a><br>
					<a href="../community/pView">[파티 완료] 계곡 주변 캠핑장에서 물놀이 하고 백슉묵자했짜나!!!</a><br>
					<a href="../community/pView">[파티 완료] 황금연휴에 멀리 떠나는 것도 일인데 서울 근교에서 바베큐나 먹자구요</a><br>
					</p>
				</div>
				<div class="contMP"><strong>용품 대여</strong><br>
				<hr>
					<p>
					<a href="../review/equipReview">[캠핑용품리뷰] 캠브릿지 2인 패키지 대여 후기</a><br>
					<a href="../review/equipReview">[캠핑용품리뷰] 1-2인 비박텐트 괜찮네요</a><br>
					</p>
				</div>
				
				
			</div>
		</div>
		<!-- allCont2 끝  -->
		</div><!--MF_all  -->
		</section>
		  <!-- ======= Footer ======= -->
		  <%@include file="../include/footer.jsp" %>
		  <!-- End Footer -->
		
	</body>
</html>