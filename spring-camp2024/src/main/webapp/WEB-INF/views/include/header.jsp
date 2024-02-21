<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Header</title>
	
	</head>
	<script>
    // JavaScript로 로그아웃 버튼 클릭 이벤트 처리
    document.querySelectorAll('a[href="/logout"]').forEach(function(logoutLink) {
        logoutLink.addEventListener('click', function(event) {
            event.preventDefault(); // 기본 동작(링크 이동) 방지

            // 여기에 로그아웃 처리 코드 추가
            alert('로그아웃되었습니다.');

            // 로그아웃 후 로그인 버튼으로 변경
            var loginLink = document.createElement('a');
            loginLink.href = '/my/login';
            loginLink.innerHTML = '로그인';

            var liElement = document.createElement('li');
            liElement.appendChild(loginLink);

            // 로그아웃 버튼을 로그인 버튼으로 교체
            var logoutLi = event.target.parentElement;
            logoutLi.parentElement.replaceChild(liElement, logoutLi);
            
            // 로그아웃 후 /index 페이지로 이동
            window.location.href = '/index';
        });
    });

		/*      if(${result}==1){
		 	   alert("로그인이 되었습니다.");
		 	   location.href="/";
		    }else{
		 	   alert("아이디 또는 패스워드가 일치하지 않습니다.");
		 	   location.href="/my/login";
		    }  */
		    
</script>

<!-- 로그인 시 css추가 -->
<style>
  .login li {
    display: inline-block;
    margin-right: 10px; /* 필요에 따라 마진 조정 */
    white-space: nowrap; /* 텍스트 줄 바꿈 방지 */
  }
  
   .btn-book-a-table {
    display: inline-block;
    white-space: nowrap; /* 텍스트 줄 바꿈 방지 */
  }
</style>
	
	<body>
	 <!-- ======= Header ======= -->
	  <header id="header" class="header fixed-top align-items-center">
	    <div id="nav" class="container align-items-center justify-content-between">
	    <div id="nav_top" class="nav_top d-flex">
	      <a href="/" class="logo align-items-center me-auto me-lg-0">
	        <!-- Uncomment the line below if you also wish to use an image logo -->
	        <!-- <img src="assets/img/logo.png" alt=""> -->
	       <!--  <h1>CampBridge<span>.</span></h1> -->
	       	<div class="logo_image"><img style="position: relative; top: 30px;" src="../assets/img/logo/cplogo.png"></div>
	      </a>
	      <div class="login d-flex">
	     			<c:if test="${session_id==null}">
						<li><a href="/my/login">로그인</a></li>
					</c:if>
					<c:if test="${session_id!=null}">
						<a href="/my/myPage"><li class="nim-name"><strong style="font-size: 16px; position: relative; top: 10px;">${session_name}님</strong></li></a>
						<a href="/my/logout"><li class="out-name"><strong style="font-size: 16px; position: relative; top: 10px; left:5px;">로그아웃</strong></li></a>
					</c:if>
	      <li><a href="/my/signUp">회원가입</a></li>
	      <li><a href="/community/nList">공지사항</a></li>
	      <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
	      <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>
	      <a class="btn-book-a-table" href="/rent/cpRent">용품대여</a>
	      </div>
	    </div>
		  	
		<div id="nav_bottom" class="nav_bottom d-flex">
	      <nav id="navbar" class="navbar">
	        <ul>
	          <li class="dropdown"><a href="/aboutCB">CampBridge 소개<i class="bi bi-chevron-down dropdown-indicator"></i></a>
		          <ul>
		              <li><a href="/aboutCB">CampBridge 소개</a></li>
		              <li><a href="/developers">손발을 do it! 소개</a></li>
		              <li><a href="/admin/adminPage">CampBridge 관리자</a></li>
		          </ul>
	          </li>
	          <li class="dropdown"><a href="/search/campsearch">캠핑장 검색</a>
	          	<ul>
		            <li><a href="/search/campsearch">캠핑장 검색</a></li>
		            <li><a href="/search/mapsearch">지도 검색</a></li>
		            <li><a href="/search/recommendsearch">campbridge 추천</a></li>
		        </ul>
	          </li>
	          <li><a href="/search/tSearch">테마검색</a></li>
	          <li class="dropdown"><a href="/community/pList"><span>커뮤니티</span></a>
	            <ul>
	              <li><a href="/community/pList">파티원모집</a></li>
		          <li><a href="/community/tList">캠핑꿀팁(Tip)</a></li>
	              <li><a href="/used/used">중고거래&캠핑장 양도</a></li>
	              <li><a href="/community/fList">자유게시판</a></li>
	            </ul>
	          </li>
	          <li class="dropdown"><a href="/review/siteReview">리뷰</a>
		          <ul>
		              <li><a href="/review/siteReview">캠핑장 리뷰</a></li>
		              <li><a href="/review/equipReview">캠핑용품 리뷰</i></a></li>
		          </ul>
	          </li>
	          <li><a href="/#contact">픽업장소</a></li>
	        </ul>
	      </nav>
	      <!-- .navbar -->
			<!-- <div id="search">
			<input name="input_search" type="text" class="input_search" placeholder="검색어를 입력하세요.">
			<input type="button" value="검색" class="button_search">
		  	</div> -->
		  	
		  		<!-- 헤더 상단 검색파트 부분 추가  -->
			<script>
				$(function(){
				    $(".button_search").click(function(){
				      if($("#input_search").val().length < 1){
				        alert("검색어를 입력하셔야 검색이 가능합니다.");
				        $("#input_search").focus();	  
				        return false; 
				      }
				      alert("입력하신 검색어로 검색합니다.")
				      searchInputFrm.submit();
				    });
				  }); 

				</script>
				<!-- 검색 시 /search/searchList로 폼형태로 보냄 -->
			  	   <div id="search">
				  	   <form action="/search/searchList" method="get" name="searchInputFrm">
					    	<input name="input_search" id="input_search" type="text" class="input_search" placeholder="검색어를 입력하세요">
							    <select name="category" id="category" style="position: relative; right: 20px; 
							      width: 20px; height: 30px;border: white; border-radius: 10px;">
						           <option value="all">전체</option>
							       <option value="btitle">제목</option>
							       <option value="bcontent">내용</option>
							       <option value="id">작성자</option>
						        </select>
					    	<input type="button" value="검색" class="button_search">
						</form>
					</div>
	   		 </div>
	    </div>
	  </header><!-- End Header -->
	</body>
</html>