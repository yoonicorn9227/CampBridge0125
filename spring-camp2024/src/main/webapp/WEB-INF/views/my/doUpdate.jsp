<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	</head>
	<body>
		<script>
		 	if(${result==1}){
		 		alert("정보가 수정 되었습니다.");
		 		location.href="/my/myPage";
		 	}
		 </script>
	
	</body>
</html>