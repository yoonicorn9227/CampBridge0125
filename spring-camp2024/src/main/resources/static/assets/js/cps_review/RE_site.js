/**
 * review_site.jsp파일
 */


//삭제, 수정 버튼 권한, 수정,삭제페이지 이동
$(function(){
	 // 작성자 확인 (예: 작성자 ID가 '작성자ID'로 가정)
    //var authorId = "${map.c_redto.id}";

    // 현재 사용자 확인 
    //var currentUserId = "${session_id}";

    // 작성자와 현재 사용자가 일치할 경우 삭제 및 수정 버튼 표시
    if (authorId === currentUserId) {
        $(".site_Delete").show();
        $(".site_Update").show();
    } else {
        $(".site_Delete").hide();
        $(".site_Update").hide();
    }
	//수정 페이지 이동
	$(".site_Update").click(function(){
		alert("수정페이지로 이동합니다.");
		$("#siteUpdateFrm").attr("action","siteUpdate").submit();  //.attr("action","bUpdate") : 속성값 action을 bUpdate 바꾸겠다?
	})
	//삭제 페이지 이동
	$(".site_Delete").click(function(){
		if(confirm("게시글을 삭제하시겠습니까?")){
			$("#siteUpdateFrm").attr("action","siteDelete").submit();     //bDelete page로 넘어감
		}
	})
})

//댓글 관련
$(function(){
	//let temp = 0;
	//let cps_bno = "${map.c_redto.cps_bno}";
	
	//댓글 1개 저장하기 ------------------------------------------------------------
	$("#replybtn").click(function(){
		//alert("댓글을 저장합니다.");
		console.log("댓글 수 : "+$(".cps_count").text());
		let cps_ccontent = $(".review_replyTxt").val();
		let cps_cpw = $(".replynum").val();
		let cps_count = Number($(".cps_count").text());
		console.log("내용 : "+cps_ccontent);
		
		$.ajax({ //ajax 시작.
			url:"/review/Cps_commentInsert",
			type:"post",
			data:{"cps_cpw":cps_cpw, "cps_ccontent":cps_ccontent, "cps_bno":cps_bno},
			dataType:"json",
			success:function(data){
				//alert("댓글이 저장되었습니다.");
                console.log(data);
                
                let re_cpsdata = '';
                re_cpsdata += '<tr id="'+data.cps_cno+'">';
                re_cpsdata += '<td style="border-bottom: 2px solid #eee; padding: 10px;">';
                re_cpsdata += '<strong>댓글 작성자</strong> | <strong style="color: blue;"class="cps_id">'+data.id+'</strong>&nbsp;&nbsp;[<span>'+moment(data.cps_cdate).format("YYYY-MM-DD HH:mm:ss")+'</span>]';
                re_cpsdata += '<li class="review_replyTxt">'+data.cps_ccontent+'</li>';
                re_cpsdata += '<li id="replyBtn">';
                re_cpsdata += '<button class="rDelBtn">삭제</button>&nbsp;';
                re_cpsdata += '<button class="rUBtn">수정</button>';
                re_cpsdata += '</li>';
                re_cpsdata += '</td>';
                re_cpsdata += '</tr>';
                $(".replyBox").prepend(re_cpsdata);
				$(".cps_count").text(cps_count+1);
				
				//댓글 쓴 내용 지우기
				$(".review_replyTxt").val("");
				$(".replynum").val("");
			},
			error:function(){
				alert("실패");
			}
		});//ajax 끝.
	})
	
	//댓글 1개 삭제하기 ------------------------------------------------------------
	$(document).on("click",".rDelBtn",function(){
		//alert("삭제버튼");
		//alert("부모의 보모 id : "+$(this).parent().parent().parent().attr("id"));
		let cps_cno = $(this).parent().parent().parent().attr("id");
		let cps_count = Number($(".cps_count").text());
		
		if(confirm("댓글을 삭제하시겠습니까?")){
			$.ajax({
				url:"/review/Cps_commentDelete",
				type:"post",
				data:{"cps_cno":cps_cno},
				dataType:"text",
				success:function(data){
					alert("성공");
	                console.log(data);
	                $("#"+cps_cno).remove();
	                $(".cps_count").text(cps_count-1);
				},
				error:function(){
					alert("실패");
				}
			});//ajax 끝.
			//alert("댓글이 삭제 되었습니다.");
		}//if
	});//rDelBtn
	
	//댓글 1개 수정창열기 ----------------------------------------------------------	
	$(document).on("click",".rUBtn",function(){
		if(temp != 0){
			alert("다른창이 열려있습니다.")
			return false;
		}
		//alert("댓글 수정을 합니다.");
		//alert("부모의 prev() cps_cno : "+$(this).parent().parent().parent().attr("id"))
		//alert("부모의 prev() cps_ccontent : "+$(this).parent().prev().text())
		//alert("부모의 span() cps_cdate : "+$(this).parent().parent().find("span").text())
		
		let cps_cno = $(this).parent().parent().parent().attr("id");
		let cps_ccontent = $(this).parent().prev().text();
		let cps_cdate =  $(this).parent().parent().find("span").text();
		let id = $(this).parent().parent().find(".cps_id").text();
		
		let re_cpsdata = '';
		
		re_cpsdata += '<input type="hidden" id="hiddenTxt" value="'+cps_ccontent+'">';
		re_cpsdata += '<td style="border-bottom: 2px solid #eee; padding: 10px;">';
        re_cpsdata += '<strong>댓글 작성자</strong> | <strong style="color: blue;" class="cps_id">'+id+'</strong>&nbsp;&nbsp;<span>['+cps_cdate+']</span>';
        re_cpsdata += '<li class="review_replyTxt"><textarea cols="145%">'+cps_ccontent+'</textarea></li>';
        re_cpsdata += '<li id="replyBtn">';
        re_cpsdata += '<button type="button" class="cps_cancel">취소</button>&nbsp;';
        re_cpsdata += '<button type="button" class="cps_save">저장</button>';
        re_cpsdata += '</li>';
        re_cpsdata += '</td>';
        
        $("#"+cps_cno).html(re_cpsdata);
        temp = 1;
	})
	
	//댓글 1개 수정저장하기 ---------------------------------------------------------	
	$(document).on("click",".cps_save",function(){
		//alert("댓글 수정 시작")
		//alert("부모의 prev() cps_cno : "+$(this).parent().parent().parent().attr("id"))
		//alert("부모의 prev() cps_ccontent : "+$(this).parent().prev().find("textarea").val())
		//alert("부모의 span() cps_cdate : "+$(this).parent().parent().find("span").text())
		
		let cps_cno = $(this).parent().parent().parent().attr("id");
		let cps_ccontent = $(this).parent().prev().find("textarea").val();
		let cps_cdate =  $(this).parent().parent().find("span").text();
		let id = "${session_id}";
		
		$.ajax({
			url:"/review/Cps_commentUpdate",
			type:"post",
			data:{"cps_cno":cps_cno, "cps_ccontent":cps_ccontent},
			dataType:"json",
			success:function(data){
				alert("댓글이 수정되었습니다.");
                console.log(data);
                
                let re_cpsdata = '';
                re_cpsdata += '<td style="border-bottom: 2px solid #eee; padding: 10px;">';
                re_cpsdata += '<strong>댓글 작성자</strong> | <strong style="color: blue;"class="cps_id">'+data.id+'</strong>&nbsp;&nbsp;[<span>'+moment(data.cps_cdate).format("YYYY-MM-DD HH:mm:ss")+'</span>]';
                re_cpsdata += '<li class="review_replyTxt">'+data.cps_ccontent+'</li>';
                re_cpsdata += '<li id="replyBtn">';
                re_cpsdata += '<button class="rDelBtn">삭제</button>&nbsp;';
                re_cpsdata += '<button class="rUBtn">수정</button>';
                re_cpsdata += '</li>';
                re_cpsdata += '</td>';
                
                $("#"+cps_cno).html(re_cpsdata);
                temp = 0;
			},
			error:function(){
				alert("실패");
			}
		});//ajax 끝.
	})

	//댓글 1개 수정취소하기 ---------------------------------------------------------	
	$(document).on("click",".cps_cancel",function(){
		//alert("댓글 수정 취소 시작")
		let cps_cno = $(this).parent().parent().parent().attr("id");
		let id = $(this).parent().parent().find(".cps_id").text();
		let cps_cdate =  $(this).parent().parent().find("span").text();
		let cps_ccontent = $(this).closest("tr").find("input[type='hidden']").val();
	
		let re_cpsdata = '';
		re_cpsdata += '<td style="border-bottom: 2px solid #eee; padding: 10px;">';
		re_cpsdata += '<strong>댓글 작성자</strong> | <strong style="color: blue;"class="cps_id">'+id+'</strong>&nbsp;&nbsp;<span>'+cps_cdate+'</span>';
		re_cpsdata += '<li class="review_replyTxt">'+cps_ccontent+'</li>';
		re_cpsdata += '<li id="replyBtn">';
		re_cpsdata += '<button class="rDelBtn">삭제</button>&nbsp;';
		re_cpsdata += '<button class="rUBtn">수정</button>';
		re_cpsdata += '</li>';
		re_cpsdata += '</td>';
		
		$("#"+cps_cno).html(re_cpsdata);
        temp = 0;
	})
	
});//function 시작