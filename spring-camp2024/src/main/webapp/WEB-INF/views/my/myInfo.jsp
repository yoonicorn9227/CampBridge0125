<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
 	    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	
	    <!-- Template Main CSS File -->
	    <link href="../assets/css/main2.css" rel="stylesheet">
	    <link href="../assets/css/header.css" rel="stylesheet">
	    <link href="../assets/css/my/myInfo.css" rel="stylesheet">
		<title>내 정보 수정</title>
	</head>
	<body>
	<!-- ======= Header ======= -->
	<%@include file="../include/header.jsp"  %>
	<!-- End Header -->
	<section>
		<form name="myInfoUpdateFrm" method="post" action="doUpdate" enctype="multipart/form-data">
			<div id="subBanner"></div>
			<div id="sub_top_area">
				<h3>내 정보 수정</h3>
			</div>
			
			<!-- 항목별 정보 수정 스크립트 시작 -->
			<script> 
			$(function(){
				//비밀번호
				$("#nPw").keyup(function(){
					if($("#nPw").val()==""){
						$("#pwCheckTxt").text("비밀번호를 확인해주세요.");
						$("#pwCheckTxt").css("color","green");
						return false;
					}
					if($("#pw").val()!=$("#nPw").val()){
						$("#pwCheckTxt").text("변경 및 사용 가능한 비밀번호입니다.");
						$("#pwCheckTxt").css("color","blue");
					} else {
						$("#pwCheckTxt").text("기존 비밀번호와 동일한 비밀번호로는 변경이 불가합니다.");
						$("#pwCheckTxt").css("color","red");
					}//if-else(비밀번호 변경 확인)
				});//#nPw.keyup
				
				
				
				//이메일
				$("#emailList").change(function(){
					if($("#emailList").val()==""){
						$("#mail_tail").val();
						$("#mail_tail").prop("readonly",false);
					}else{
						$("#mail_tail").val($("#emailList").val());
						$("#mail_tail").prop("readonly",true);
					}
				});//emailList
				
				
				
				//주소
				$(".addressBtn").click(function(){
					new daum.Postcode({
						oncomplete: function(data) {
							            
						$("#zonecode").val(data.zonecode);
						$("#address").val(data.address);
					}
					}).open();
							
				});	
				
				
				
				
			   //수정버튼 클릭	
			   $("#updateBtn").click(function(){
			   		alert("회원정보를 수정합니다.");
			   		//alert("이메일 : "+$("#mail_id").val()+"@"+$("#main_tail").val());
			   		//이메일 합치기
			   		$("#email").val($("#mail_id").val()+"@"+$("#main_tail").val());
			   		//전화번호 합치기
			   		//alert("전화번호 : "+$("#f_tell").val()+"-"+$("#m_tell").val()+"-"+$("#l_tell").val());
			   		$("#phone").val($("#f_tell").val()+"-"+$("#m_tell").val()+"-"+$("#l_tell").val());
			   		myInfoUpdateFrm.submit();
			  	});//UpdateBtn
			});//JQuery
			</script>
			<!-- 항목별 정보 수정 스크립트 끝 -->
			
			
			
			<fieldset class="fieldset_class">
			  <dl id="join_picture_dl">
					<dt>
						<div></div>
						<label for="name">프로필 사진</label>
					</dt>
					<dd class="photoBoxMI">
						<div class="photoMI"><img src="../upload/${udto.m_img}"></div>
			          	<div class="inputMI"><input type="file" name="myfile" id="files"></div>
					</dd>
				</dl>
				
				<dl id="join_name_dl">
					<dt>
						<div></div>
						<label for="name" readonly>이름</label>
					</dt>
					<dd>
						${udto.name}
					</dd>
				</dl>
				<dl id="join_id_dl_MI">
					<dt>
						<div></div>
						<label for="id" readonly>아이디</label>
					</dt>
					<dd>
						${udto.id}
						<input type="hidden" name="id" value="${udto.id}">
					</dd>
				</dl>
				<dl id="join_pw1_dl">
					<dt>
						<div></div>
						<label for="pw">기존 비밀번호</label>
					</dt>
					<dd>
						<input type="password" id="pw" name="pw1" value="${udto.pw}" minlength="8" required />
					</dd>
				</dl>
				<dl id="join_pw2_dl">
					<dt>
						<div></div>
						<label for="nPw">신규 비밀번호</label>
					</dt>
					<dd>
						<input type="password" id="nPw" name="pw" minlength="8" required />
						<span id="pwCheckTxt">※비밀번호를 확인해주세요.</span><br>
						<span>영문, 숫자, 특수문자 중 2종류 조합 시 10자리 이상 입력 | 영문, 숫자, 특수문자 모두 조합 시 8자리 이상 입력</span><br>
						
					</dd>
				</dl>
				
				<dl id="join_name_dl">
					<dt>
						<div></div>
						<label for="nickname">닉네임</label>
						
					</dt>
					<dd>
						<input type="text" id="nickname" name="nickname" value="${udto.nickname}" required/>
						<span>최대 다섯 글자까지 입력해주세요.</span>
					</dd>
				</dl>
				<dl id="join_mail_dl">
					<dt>
						<div></div>
						<label for="mail_id">이메일</label>
					</dt>
					
					<dd>
					<c:set var="email" value="${fn:split(udto.email,'@')}"></c:set>
						<input type="hidden" id="email" name="email" value="" />
						<input type="text" id="mail_id" name="mail_id" value="${email[0]}" required />
						<span>@</span>
						<input type="text" id="main_tail" name="mail_tail" value="${email[1]}" required />
						<select id="emailList">
							<option value="" selected>직접 입력</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="nate.com">nate.com</option>    
							<option value="gmail.com">gmail.com</option>
						</select>
					</dd>
				</dl>
				
				<dl id="join_address_dl">
					<dt> 
						<div></div>
						<label for="">주소</label>
					</dt>
					
					<dd>
					<c:set var="address" value="${fn:split(udto.address,',')}"></c:set>
						<input type="button" class="addressBtn" value="우편번호 검색"/>
						<br>
						<input type="text" id="zonecode" name="zonecode" value="${address[0]}" required />
						<input type="text" id="address" name="address" value="${address[1]}" required />
					</dd>
					
				</dl>
				
				<dl id="join_tell_dl">
					<dt>
						<div></div>
						<label for="f_tell">휴대전화</label>
					</dt>
					<dd>
					<c:set var="mobNum" value="${fn:split(udto.phone,'-')}"></c:set>
						<input type="hidden" id="phone" name="phone" value="" />
						<input type="text" id="f_tell" name="f_tell" maxlength="3" value="${mobNum[0]}" required />
						<span> - </span>
						<input type="text" id="m_tell" name="m_tell" maxlength="4" value="${mobNum[1]}" required />
						<span> - </span>
						<input type="text" id="l_tell" name="l_tell" maxlength="4" value="${mobNum[2]}" required />
					</dd>
				</dl>
			
			</fieldset>

			
			
			<fieldset class="fieldset_class">
				
				<dl id="join_interests_dl">
					<dt>
						<label id="localName">지역</label>
					</dt>
					<dd>
						<ul>
							<li>
								<input type="checkbox" name="local" id="local01" class="check01" value="서울시" title="1" <c:if test="${fn:contains(udto.local, '서울시')}">checked</c:if>/>
								<label for="local01">서울시</label>
							</li>
							<li>
								<input type="checkbox" name="local" id="local02" class="check02" value="부산시" title="2" <c:if test="${fn:contains(udto.local, '부산시')}">checked</c:if>/>
								<label for="local02">부산시</label>
							</li>
							<li>
								<input type="checkbox" name="local" id="local03" class="check03" value="대구시" title="3" <c:if test="${fn:contains(udto.local, '대구시')}">checked</c:if>/>
								<label for="local03">대구시</label>
							</li>
							<li>
								<input type="checkbox" name="local" id="local04" class="check04" value="인천시" title="4" <c:if test="${fn:contains(udto.local, '인천시')}">checked</c:if>/>
								<label for="local04">인천시</label>
							</li>
							<li>
								<input type="checkbox" name="local" id="local05" class="check05" value="광주시" title="5" <c:if test="${fn:contains(udto.local, '광주시')}">checked</c:if>/>
								<label for="local05">광주시</label>
							</li>
							<li>
								<input type="checkbox" name="local" id="local06" class="check06" value="대전시" title="6" <c:if test="${fn:contains(udto.local, '대전시')}">checked</c:if>/>
								<label for="local06">대전시</label>
							</li>
							<li>
								<input type="checkbox" name="local" id="local07" class="check07" value="울산시" title="7" <c:if test="${fn:contains(udto.local, '울산시')}">checked</c:if>/>
								<label for="local07">울산시</label>
							</li>
							<li>
								<input type="checkbox" name="local" id="local08" class="check08" value="세종시" title="8" <c:if test="${fn:contains(udto.local, '세종시')}">checked</c:if>>
								<label for="local08">세종시</label>
							</li>
							<li>
								<input type="checkbox" name="local" id="local09" class="check09" value="경기도" title="9" <c:if test="${fn:contains(udto.local, '경기도')}">checked</c:if>/>
								<label for="local09">경기도</label>
							</li>
							<li>
								<input type="checkbox" name="local" id="local10" class="check10" value="강원도" title="10" <c:if test="${fn:contains(udto.local, '강원도')}">checked</c:if>/>
								<label for="local10">강원도</label>
							</li>
							<li>
								<input type="checkbox" name="local" id="local11" class="check11" value="충청북도" title="11" <c:if test="${fn:contains(udto.local, '충청북도')}">checked</c:if>/>
								<label for="local11">충청북도</label>
							</li>
							<li>
								<input type="checkbox" name="local" id="local12" class="check12" value="충청남도" title="12" <c:if test="${fn:contains(udto.local, '충청남도')}">checked</c:if>/>
								<label for="local12">충청남도</label>
							</li>
							<li>
								<input type="checkbox" name="local" id="local13" class="check13" value="전라북도" title="13" <c:if test="${fn:contains(udto.local, '전라북도')}">checked</c:if>/>
								<label for="local13">전라북도</label>
							</li>
							<li>
								<input type="checkbox" name="local" id="local14" class="check14" value="전라남도" title="14" <c:if test="${fn:contains(udto.local, '전라남도')}">checked</c:if>/>
								<label for="local14">전라남도</label>
							</li>
							<li>
								<input type="checkbox" name="local" id="local015" class="check15" value="경상북도" title="15" <c:if test="${fn:contains(udto.local, '경상북도')}">checked</c:if>/>
								<label for="local15">경상북도</label>
							</li>
							<li>
								<input type="checkbox" name="local" id="local16" class="check16" value="경상남도" title="16" <c:if test="${fn:contains(udto.local, '경상남도')}">checked</c:if>/>
								<label for="local16">경상남도</label>
							</li>
							<li>
								<input type="checkbox" name="local" id="local17" class="check17" value="제주도" title="17" <c:if test="${fn:contains(udto.local, '제주도')}">checked</c:if>/>
								<label for="local17">제주도</label>
							</li>
						</ul>
					</dd>
				</dl>
			</fieldset>
			
			<div id="info_input_button">
				<input type="reset" id="cancelBtn" name="cancelBtn" value="취소하기" />
				<input type="submit" id="updateBtn" name="updateBtn" value="수정하기" />
			</div>
		</form>
		

		
	</section>
   <!-- ======= Footer ======= -->
   <%@include file="../include/footer.jsp" %>
   <!-- End Footer -->
		
	</body>
</html>