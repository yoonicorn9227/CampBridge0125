<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>doFBoard.jsp</title>
	</head>
	<body>
		<c:choose>
			<c:when test="${result=='fWrite-Save'}">
				<script>
				 alert("게시글이 저장되었습니다.");
				 location.href="fList";
				</script>			
			</c:when>
			<c:when test="${result=='fView-Delete'}">
				<script>
				 alert("게시글이 삭제 되었습니다.");
				 location.href="fList";
				</script>			
			</c:when>
			<c:when test="${result=='fUpdate-Save'}">
				<script>
				 alert("게시글이 수정 되었습니다.");
				 location.href="fList";
				</script>			
			</c:when>
			<c:when test="${result=='fReply-Save'}">
				<script>
				 alert("답글이 등록 되었습니다.");
				 location.href="fList";
				</script>			
			</c:when>
			<c:when test="${result=='pView-Delete'}">
				<script>
				 alert("게시글이 삭제 되었습니다.");
				 location.href="pList";
				</script>			
			</c:when>
			<c:when test="${result=='pUpdate-Save'}">
				<script>
				 alert("게시글이 수정 되었습니다.");
				 location.href="pList";
				</script>			
			</c:when>
			<c:when test="${result=='pWrite-Save'}">
				<script>
				 alert("게시글이 저장 되었습니다.");
				 location.href="pList";
				</script>			
			</c:when>
		</c:choose>
	</body>
</html>