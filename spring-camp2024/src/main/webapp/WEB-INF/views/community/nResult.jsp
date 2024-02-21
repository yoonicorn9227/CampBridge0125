<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>nResult</title>
	</head>
	<body>
		<c:choose>
				<c:when test="${result == 'nView-D'}">
					<script>
					 alert("게시글이 삭제되었습니다.");
					 location.href="nList";
					</script>			
				</c:when>
				
				<c:when test="${result == 'Update-S'}">
					<script>
						alert("게시글이 저장되었습니다.");
						location.href="nList";
					</script>			
				</c:when>
				
				<c:when test="${result == 'Update-W'}">
					<script>
						alert("게시글이 수정되었습니다.");
						location.href="nList";
					</script>			
				</c:when>
		</c:choose>
		
	</body>
</html>