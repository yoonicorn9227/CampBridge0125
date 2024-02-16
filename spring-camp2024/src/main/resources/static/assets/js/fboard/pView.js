/**
 * pView.jsp파일
 */
$(function() {
	$("#fDelBtn").click(function() {
		if (confirm("게시글을 삭제 하시겠습니까?")) {
			$("#freeViewFrm").attr("action", "fDelete").submit();
		}//if-confirm(게시글 삭제 확인창)
	});//#fDelBtn(게시글 삭제)

	$("#fUpdateBtn").click(function() {
		if (confirm("게시글을 수정 하시겠습니까?")) {
			$("#freeViewFrm").attr("action", "fUpdate").submit();
		}//if-confirm(게시글 수정 확인창)
	});//#fUpdateBtn(게시글 수정)

	$("#fReplyBtn").click(function() {
		if (confirm("게시글을 답글을 작성하시겠습니까?")) {
			$("#freeViewFrm").attr("action", "fReply").submit();
		}//if-confirm(게시글 답글 확인창)
	});//#fUpReplyBtn(게시글 답글)

	//1.댓글저장
	$("#replybtn").click(function() {
		let f_cpw = $("#replyIPw").val();
		let f_ccontent = $("#replyCont").val();
		let f_count = Number($(".f_count").text());

		if (id == null) {
			alert("※ 로그인 상태에서만 댓글이 등록됩니다.");
			return false;
		}//if(로그인 미실시)		    			

		if ($("#replyCont").val().length < 1) {
			alert("※ 댓글 미입력시 댓글등록 되지 않습니다.");
			$('#replyCont').focus();
			return false;
		}//if(댓글 미입력시)

		//♠ajax
		$.ajax({
			url: "/community/fCommentInsert",
			type: "post",
			data: { "f_bno": f_bno, "id": id, "f_cpw": f_cpw, "f_ccontent": f_ccontent },
			dataType: "json", //data를 받는 타입
			success: function(data) {
				alert("댓글이 등록되었습니다.");
				console.log(data);
				let hdata = "";
				hdata += '<tr id="' + data.f_cno + '">';
				hdata += '<input type="hidden" value="' + data.f_cpw + '" class="f_cpw">';
				hdata += '<td><strong style="color: navy;">댓글 작성자</strong> | <strong style="color: #009223;" class="f_cid">' + data.id + '</strong>&nbsp;&nbsp;[<span class="f_cdate">' + moment(data.f_cdate).format("YYYY-MM-DD HH:mm:ss") + '</span>]';
				hdata += '<li id="replyTxt">' + data.f_ccontent + '</li>';
				hdata += '<li id="replyBtn">';
				hdata += '<button class="rDelBtn">삭제</button>&nbsp';
				hdata += '<button class="rUBtn">수정</button>';
				hdata += '</li>';
				hdata += '</td>';
				hdata += '</tr>';
				$("#replyBox").prepend(hdata);
				$(".f_count").text(f_count+1);
				$("#replyCont").val("");
				$("#replyIPw").val("");
			}, //success
			error() {
				alert("실패");
			}//error
		});//ajax(댓글)
	});//replybtn(댓글저장)

	//2. 댓글 삭제
	$(document).on("click", ".rDelBtn", function() {
		//alert("부모의 부모의 부모 id(f_cno) : "+$(this).closest("tr").attr("id")); //=//alert("부모의 부모의 부모 id(f_cno) : "+$(this).parent().parent().parent().attr("id"));
		let f_cno = $(this).closest("tr").attr("id");
		//let id=$(this).parent().parent().find(".f_cid").text();

		if (confirm("댓글을 삭제 하시겠습니까?")) {
			//♠ajax(댓글삭제)
			$.ajax({
				url: "/community/fCommentDelete",
				type: "post",
				data: { "f_cno": f_cno },
				dataType: "text", //data를 받는 타입
				success: function(data) {
					$("#" + f_cno).remove();//삭제
				}, //success
				error() {
					alert("실패");
				}//error
			});//ajax(댓글삭제)
			alert("댓글을 삭제되었습니다.");
		}//if(댓글 삭제)
	});//(댓글삭제)

	//3. 댓글 수정
	$(document).on("click", ".rUBtn", function() {
		if (temp != 0) {
			alert("다른 댓글 수정창이 열려있습니다.");
			return false;
		}//if(다중수정 입력창 방지) 
		//alert("댓글 내용 : "+$(this).parent().prev().text()); //내용
		//alert("댓글 작성자 : "+$(this).parent().prev().prev().prev().text()); //작성자
		//alert("댓글 작성일 : "+$(this).parent().parent().find("span").text()); // 작성일

		let f_cno = $(this).closest("tr").attr("id");
		let id = $(this).parent().parent().find(".f_cid").text();
		let f_cdate = $(this).parent().parent().find("span").text();
		let f_ccontent = $(this).parent().prev().text();
		let f_cpw = $(this).parent().parent().prev().val();
		//alert("비번 : "+$(this).parent().parent().prev().val());

		let hdata = '';
		hdata += '<td><strong style="color: navy;">댓글 작성자</strong> | <strong style="color: #009223;" class="f_cid">' + id + '</strong>&nbsp;&nbsp;[<span class="f_cdate">' + f_cdate + '</span>]';
		hdata += '<li style="list-style: none; float: right; line-height: 27px;"><strong>비밀번호 |<strong><input type="text" value="' + f_cpw + '" placeholder=" ※입력시 비밀글로 저장" class="f_cpw"></li>';
		hdata += '<li id="replyTxt"><textarea cols="145%">' + f_ccontent + '</textarea></li>';
		hdata += '<li id="replyBtn">';
		hdata += '<button class="rCanBtn">취소</button>&nbsp&nbsp';
		hdata += '<button class="rSaveBtn">저장</button>';
		hdata += '</li>';
		hdata += '</td>';

		$("#" + f_cno).html(hdata); //기존 HTML 삭제후 추가
		temp = 1; //수정창 활성화
	});//댓글수정 

	//4. 댓글 수정저장
	$(document).on("click", ".rSaveBtn", function() {
		alert("댓글수정 완료");
		//alert("아이디 : "+$(this).parent().parent().parent().parent().find(".f_cid").text());
		//alert("날짜 : "+$(this).parent().parent().parent().parent().find(".f_cdate").text());
		//alert("비번 : "+$(this).parent().parent().parent().prev().prev().find(".f_cpw").val());
		//alert("내용 : "+$(this).parent().parent().parent().prev().find("textarea").val());

		//let id = $(this).parent().parent().parent().parent().find(".f_cid").text();
		let f_cpw = $(this).parent().parent().parent().prev().prev().find(".f_cpw").val();
		let f_ccontent = $(this).parent().parent().parent().prev().find("textarea").val();
		let f_cno = $(this).closest("tr").attr("id");

		//♠ajax(댓글 수정저장)
		$.ajax({
			url: "/community/fCommentUpdate",
			type: "post",
			data: { "f_cno": f_cno, "f_cpw": f_cpw, "f_ccontent": f_ccontent },
			dataType: "json",
			success: function(data) {
				alert("성공")
				let hdata = "";
				hdata += '<input type="hidden" value="' + data.f_cpw + '" class="f_cpw">';
				hdata += '<td><strong style="color: navy;">댓글 작성자</strong> | <strong style="color: #009223;" class="f_cid">' + data.id + '</strong>&nbsp;&nbsp;[<span class="f_cdate">' + moment(data.f_cdate).format("YYYY-MM-DD HH:mm:ss") + '</span>]';
				hdata += '<li id="replyTxt">' + data.f_ccontent + '</li>';
				hdata += '<li id="replyBtn">';
				hdata += '<button class="rDelBtn">삭제</button>&nbsp';
				hdata += '<button class="rUBtn">수정</button>';
				hdata += '</li>';
				hdata += '</td>';
				hdata += '</tr>';
				$("#" + f_cno).html(hdata); //기존 HTML 삭제후 추가
			},//success
			error() {
				alert("실패");
			}//error
		});//ajax(댓글 수정저장)
		temp = 0;
	});// 댓글수정 저장

	//5.댓글 수정취소
	$(document).on("click", ".rCanBtn", function() {
		//alert("댓글 수정을 취소합니다.");
		//alert("댓글 수정을 취소 f_cno : "+$(this).closest("tr").attr("id"));
		//alert("댓글 수정을 취소 f_cdate : "+$(this).parent().parent().find("span").text());
		//alert("댓글 수정을 취소 f_ccontent : "+$(this).parent().prev().text());
		let f_cno = $(this).closest("tr").attr("id");
		let id = $(this).parent().parent().parent().parent().find(".f_cid").text(); //${session_id} 변경예정
		let f_cdate = $(this).parent().parent().parent().parent().find("span").text();
		let f_ccontent = $(this).parent().parent().parent().prev().find("textarea").val();
		let f_cpw = $(this).parent().parent().parent().parent().find("strong").find("input").val();
		//alert("비번 : "+$(this).parent().parent().parent().prev().prev().find(".f_cpw").val());
		//alert("내용 : "+$(this).parent().parent().parent().prev().find("textarea").val());
		//alert("날짜 : "+$(this).parent().parent().parent().parent().find("span").text());
		//console.log("내용"+$(this).parent().parent().parent().prev().find("textarea").val());

		let hdata = "";
		hdata += '<input type="hidden" value="' + f_cpw + '" class="f_cpw">';
		hdata += '<td><strong style="color: navy;">댓글 작성자</strong> | <strong style="color: #009223;" class="f_cid">' + id + '</strong>&nbsp;&nbsp;[<span class="f_cdate">' + f_cdate + '</span>]';
		hdata += '<li id="replyTxt">' + f_ccontent + '</li>';
		hdata += '<li id="replyBtn">';
		hdata += '<button class="rDelBtn">삭제</button>&nbsp';
		hdata += '<button class="rUBtn">수정</button>';
		hdata += '</li>';
		hdata += '</td>';
		hdata += '</tr>';
		$("#" + f_cno).html(hdata); //기존 HTML 삭제후 추가
		temp = 0;//댓글 수정창 비활성화
	});//댓글 수정취소

});//제이쿼리 최신


