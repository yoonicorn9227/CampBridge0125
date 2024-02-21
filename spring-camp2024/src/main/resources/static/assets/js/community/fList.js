/**
 * fList.jsp파일
 */
$(function() {
	$("#searchBtn").click(function() {
		if ($("#searchWord").val().length < 1) {
			alert("※ 검색어를 입력해주세요.");
			$("#searchWord").focus();
			return false;
		}//if(검색어 미입력시)
		alert("입력하신 검색어로 검색합니다.");
		fSearchFrm.submit();
	});//#searchBtn(자유게시판 검색어)
});//제이쿼리 최신



