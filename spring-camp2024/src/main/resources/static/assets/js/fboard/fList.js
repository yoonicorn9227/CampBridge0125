/**
 * fList.jsp파일
 */
$(function() {
	$("#searchBtn").click(function() {
		if ($("#searchWord").val().length < 1) {
			alert("※검색어를 입력해주세요.");
			$("#searchWord").focus();
			return false;
		}//if
		alert("입력하신 검색어로 검색합니다.");
		fSearchFrm.submit();

	});//#searchBtn
});//제이쿼리 최신



