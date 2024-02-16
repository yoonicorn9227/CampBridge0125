/**
 * pView.jsp파일
 */
$(function() {
	$("#pDeleteBtn").click(function() {
		if (confirm("게시글을 삭제하시겠습니까?")) {
			$("#partyViewFrm").attr("action", "pDelete").submit();
		}//if(confirm)
	});//#pDeleteBtn(파티원 게시글 삭제)

	$("#pUpdateBtn").click(function() {
		if (confirm("게시글을 수정하시겠습니까?")) {
			$("#partyViewFrm").attr("action", "pUpdate").submit();
		}//if(confirm)
	});//#pUpdateBtn(파티원 게시글 수정)

	$("#pJoinBtn").click(function() {
		console.log(id)
		if (id == null) {
			alert("※ 로그인시 파티에 참여 할 수 있습니다.");
			return false;
		}//if(로그인이 되어 있지 않을 경우)


		if (confirm("★파티에 참여 하시겠습니까?")) {
			if (join == 1) {
				alert("※ 파티에 이미 참여하셨습니다.");
				return false;
			}//if(파티참여 ajax)

			if (joinCount == 1) {
				alert("※ 파티에 이미 참여하셨습니다.");
				return false;
			}//if(파티참여)

			if (p_bnum <= joinSize) {
				alert("※ 파티원 인원이 만석입니다.");
				return false;
			}//if(모집인원 만석시)

			//alert($(this).parent().prev().prev().find("tr").find("#p_bno").text())
			//alert(Number($("#partyJoinNum").text()));
			let p_bno = $(this).parent().prev().prev().find("tr").find("#p_bno").text()
			let p_jCount = Number($("#partyJoinNum").text());
			//♠ajax(파티참가)
			$.ajax({
				url: "/community/partyJoin",
				type: "post",
				data: { "id": id, "p_bno": p_bno },
				dataType: "json",
				success: function(data) {
					//console.log(data)
					let jdata = "";
					jdata += '<div class="participant_no" id="' + data.p_jcno + '">';
					jdata += '<div class="participant_img" style="background-image: url(\'../upload/' + data.m_img + '\'); background-repeat: no-repeat; background-size: cover;"></div>';
					jdata += '<div class="participant_in">';
					jdata += '<tr>';
					jdata += '<td><strong>파티원(ID)</strong></td>';
					jdata += '<td>' + data.id + '</td>';
					jdata += '</br>';
					jdata += '<td><strong>닉네임</strong></td>';
					jdata += '<td>' + data.nickname + '</td>&nbsp;&nbsp;';
					jdata += '</tr>';
					if (id == data.id) {
						jdata += '<span id="pJoinDelBtn"><i class="fa fa-sign-out" id="pJoinDelBtnTxt" aria-hidden="true">탈퇴</i></span>';
					}
					jdata += '</div>';
					jdata += '</div>';

					$(".participant").append(jdata);
					$("#partyJoinNum").text(p_jCount + 1);

					if ($("#partyJoinNum").text() == p_bnum) {
						$("#ing_join").css("color", "red").text("모집완료");
					}//if

					join = 1; //파티참여


				},//success
				error() {
					alert("실패");
				}//error
			});//ajax(파티참가)

		}//if(confirm)

	});//#pJoinBtn(파티에 참여)

	//2. 파티원 탈퇴
	$(document).on("click", "#pJoinDelBtn", function() {
		//alert($(this).parent().parent().attr("id"))
		//alert(Number($("#partyJoinNum").text()));
		let p_jcno = $(this).parent().parent().attr("id");
		let p_jCount = Number($("#partyJoinNum").text());
		let p_bno = $(this).parent().parent().parent().prev().find("#p_bno").text();
		//alert(p_bno);
		if (confirm("※ 파티원을 탈퇴하시겠습니까?")) {
			//♠ajax(파티원 탈퇴)
			$.ajax({
				url: "/community/pJoinDelete",
				type: "post",
				data: { "p_jcno": p_jcno, "p_bno": p_bno },
				dataType: "text",
				success: function(data) {
					$("#" + p_jcno).remove();// 파티원 탈퇴 삭제
					$("#partyJoinNum").text(p_jCount - 1);
				},//success
				error() { alert("실패") }//error
			});//ajax(파티원 탈퇴) */
			alert("※ 파티원에서 탈퇴했습니다.");

			if ($("#partyJoinNum").text() <= p_bnum) {
				$("#ing_join").css("color", "blue").text("모집중");
			}//if

			join = 0; //파티 미참여
		}//if(confirm)
	});//파티원 탈퇴


	//1. 하단댓글 1개 저장
	$("#replybtn").click(function() {
		let p_cpw = $("#replyIPw").val();
		let p_ccontent = $("#replyCont").val();
		let p_count = Number($(".p_count").text());
		if (id == null) {
			alert("※ 로그인 상태에서만 댓글이 등록됩니다.");
			return false;
		}//로그인 미실시

		if ($("#replyCont").val().length < 1) {
			alert("※ 댓글 미입력시 댓글등록 되지 않습니다.");
			$('#replyCont').focus();
			return false;
		}//if(댓글 미입력시)

		//♠파티원 하단댓글 저장 ajax
		$.ajax({
			url: "/community/pCommentInsert",
			type: "post",
			data: { "p_bno": p_bno, "id": id, "p_cpw": p_cpw, "p_ccontent": p_ccontent },
			dataType: "json",
			success: function(data) {
				alert("댓글이 등록 되었습니다.");

				let pdata = "";
				pdata += '<tr id="' + data.p_cno + '">';
				pdata += '<input type="hidden" value="' + data.p_cpw + '" class="p_cpw">';
				pdata += '<td><strong style="color: navy">댓글 작성자</strong> | <strong style="color: #009223;" class="p_cid">' + data.id + '</strong>&nbsp;&nbsp;<span class="p_cdate">' + moment(data.p_cdate).format("YYYY-MM-DD HH:mm:ss") + '</span>';
				pdata += '<li id="replyTxt">&nbsp;&nbsp;' + data.p_ccontent + '</li>';
				pdata += '<li id="replyBtn">';
				pdata += '<button class="rDelBtn">삭제</button>&nbsp;';
				pdata += '<button class="rUBtn">수정</button>';
				pdata += '</li>';
				pdata += '</td>';
				pdata += '</tr>';
				$("#replyBox").prepend(pdata);
				$(".p_count").text(p_count + 1);
				$("#replyCont").val("");
				$("#replyIPw").val("");
			},//success
			error() { alert("실패"); }//error
		});//ajax(댓글저장)

	});//#replyBtn(댓글저장)

	//2. 하단댓글 1개 삭제
	$(document).on("click", ".rDelBtn", function() {
		let p_cno = $(this).closest("tr").attr("id");
		let p_count = Number($(".p_count").text());

		if (confirm("※ 댓글을 삭제하시겠습니까?")) {
			//♠ajax(파티원 댓글 삭제)
			$.ajax({
				url: "/community/pCommentDelete",
				type: "post",
				data: { "p_cno": p_cno },
				dataType: "text",
				success: function(data) {
					$("#" + p_cno).remove();// 하단댓글 삭제
					$(".p_count").text(p_count - 1);
				},//success
				error() { alert("실패") }//error
			});//ajax(댓글삭제)
			alert("댓글이 삭제되었습니다.")
		}//if(confirm)
	});//하단댓글 삭제

	//3. 하단댓글 1개 수정창 활성화
	$(document).on("click", ".rUBtn", function() {
		if (temp != 0) {
			alert("다른 댓글 수정창이 열려있습니다.");
			return false;
		}//if(다중수정 입력창 방지) 
		let p_cno = $(this).closest("tr").attr("id");
		let id = $(this).parent().parent().find(".p_cid").text();
		let p_cdate = $(this).parent().parent().find("span").text();
		let p_ccontent = $(this).parent().prev().text();
		let p_cpw = $(this).parent().parent().prev().val();

		let pdata = '';
		pdata += '<td><strong style="color: navy;">댓글 작성자</strong> | <strong style="color: #009223;" class="p_cid">' + id + '</strong>&nbsp;&nbsp;[<span class="p_cdate">' + p_cdate + '</span>]';
		pdata += '<li style="list-style: none; float: right; line-height: 27px;"><strong>비밀번호 |<strong><input type="text" value="' + p_cpw + '" placeholder=" ※입력시 비밀글로 저장" class="p_cpw"></li>';
		pdata += '<li id="replyTxt"><textarea cols="145%">' + p_ccontent + '</textarea></li>';
		pdata += '<li id="replyBtn">';
		pdata += '<button class="rCanBtn">취소</button>&nbsp;';
		pdata += '<button class="rSaveBtn">저장</button>';
		pdata += '</li>';
		pdata += '</td>';

		$("#" + p_cno).html(pdata); //기존 HTML 삭제후 추가
		temp = 1; //수정창 활성화
	});//하단댓글 1개 수정창 활성화

	//4. 하단댓글 1개 수정저장
	$(document).on("click", ".rSaveBtn", function() {
		let p_cpw = $(this).parent().parent().parent().prev().prev().find(".p_cpw").val();
		let p_ccontent = $(this).parent().parent().parent().prev().find("textarea").val();
		let p_cno = $(this).closest("tr").attr("id");

		//♠ajax(파티원 댓글 수정저장)
		$.ajax({
			url: "/community/pCommentUpdate",
			type: "post",
			data: { "p_cno": p_cno, "p_cpw": p_cpw, "p_ccontent": p_ccontent },
			dataType: "json",
			success: function(data) {

				let pdata = "";
				pdata += '<input type="hidden" value="' + data.p_cpw + '" class="p_cpw">';
				pdata += '<td><strong style="color: navy">댓글 작성자</strong> | <strong style="color: #009223;" class="p_cid">' + data.id + '</strong>&nbsp;&nbsp;<span class="p_cdate">' + moment(data.p_cdate).format("YYYY-MM-DD HH:mm:ss") + '</span>';
				pdata += '<li id="replyTxt">' + data.p_ccontent + '</li>';
				pdata += '<li id="replyBtn">';
				pdata += '<button class="rDelBtn">삭제</button>&nbsp;';
				pdata += '<button class="rUBtn">수정</button>';
				pdata += '</li>';
				pdata += '</td>';
				pdata += '</tr>';

				$("#" + p_cno).html(pdata); //기존 HTML 삭제후 추가
			},//success
			error() { alert("실패") }//error
		});//ajax(댓글수정저장)
		alert("댓글을 수정하였습니다.");
		temp = 0;
	});////하단댓글 1개 수정저장

	//5. 하단댓글 1개 수정취소
	$(document).on("click", ".rCanBtn", function() {
		let p_cno = $(this).closest("tr").attr("id");
		let id = $(this).parent().parent().parent().parent().find(".p_cid").text();
		let p_cdate = $(this).parent().parent().parent().parent().find("span").text();
		let p_ccontent = $(this).parent().parent().parent().prev().find("textarea").val();
		let p_cpw = $(this).parent().parent().parent().parent().find("strong").find("input").val();

		let pdata = "";
		pdata += '<input type="hidden" value="' + p_cpw + '" class="p_cpw">';
		pdata += '<td><strong style="color: navy;">댓글 작성자</strong> | <strong style="color: #009223;" class="p_cid">' + id + '</strong>&nbsp;&nbsp;[<span class="p_cdate">' + p_cdate + '</span>]';
		pdata += '<li id="replyTxt">' + p_ccontent + '</li>';
		pdata += '<li id="replyBtn">';
		pdata += '<button class="rDelBtn">삭제</button>&nbsp';
		pdata += '<button class="rUBtn">수정</button>';
		pdata += '</li>';
		pdata += '</td>';
		pdata += '</tr>';
		$("#" + p_cno).html(pdata); //기존 HTML 삭제후 추가
		temp = 0;//댓글 수정창 비활성화
	});//댓글 수정취소


});//제이쿼리 최신


