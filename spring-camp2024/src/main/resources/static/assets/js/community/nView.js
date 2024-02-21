/**
 공지사항 View* 
 */
let temp =0;

/* 수정&삭제 버튼  hide & show*/
$(function(){
	function handleButtons(){
	
	$('.n_deleteBtn').each(function(){
		var userId = $(this).data('userid');
		if(userId !== id){
			$(this).hide();
		}
		
	});	
	
	$('.n_updateBtn').each(function(){
		var userId = $(this).data('userid');
		if(userId !== id){
			$(this).hide();
		}
		
	});	
	
	}//function
	handleButtons();
	
	if(id != authorID){
		$('#n_deleteBtn').hide();
		$('#n_updateBtn').hide();
	}else{
		$('#n_deleteBtn').show();
		$('#n_updateBtn').show();
	}
	 
	/* 댓글 저장하기 */
	 $("#replybtn").click(function(){
		let n_cpw = $("#replyIPw").val();
		let n_ccontent = $("#reply_ncontent").val();
		let n_Count = Number($(".n_Count").text());
		
		if(n_ccontent.trim()===''){
			   alert("댓글 내용을 작성하셔야 합니다.");
			   return false;
		   }
		alert("댓글을 저장합니다.");
		$.ajax({
			url:"/community/NCommnetInsert",
			type:"post",
			data:{"n_cpw":n_cpw,"n_ccontent":n_ccontent,"n_bno":n_bno},
			dataType:"json", //받는파일형태 : text,json,xml
			success:function(data){
			console.log(data);
			let hdata ='';
			hdata += '<tr id="'+data.n_cno+'">';
			hdata += '<td><strong>댓글 작성자</strong> | <strong style="color: blue;">'+data.id+'</strong>&nbsp;&nbsp;[<span>'+moment(data.n_cdate).format("YYYY-MM-DD HH:mm:ss")+'</span>]';
			hdata += '<li id="replyTxt">&nbsp;&nbsp;'+data.n_ccontent+'</li>';
			hdata += '<li id="replyBtn">';
			hdata += '<button class="rDelBtn">삭제</button>&nbsp';
			hdata += '<button class="rUBtn">수정</button>';
			hdata += '</li>';
			hdata += '</td>';
			hdata += '</tr>';

			$(".replyBox").prepend(hdata);
			$(".n_Count").text(n_Count+1); 
			
			$("#reply_ncontent").val(""); 
			$("#replyIPw").val("");
			
			},
			error:function(){
			alert("실패");
			}
			})//ajax끝
			
	 });//click
	 /* 댓글 삭제하기  */
	 $(document).on("click",".rDelBtn",function(){
		let n_cno = $(this).parent().parent().parent().attr("id");
		let n_Count = Number($(".n_Count").text());
		
		if(confirm("댓글을 삭제하시겠습니까?")){
			$.ajax({
   				url:"/community/NCommnetDelete",
   				type:"post",
   				data:{"n_cno":n_cno},
   				dataType:"text", 
   				success:function(data){
   				console.log(data);
				$("#"+n_cno).remove();
				$(".n_Count").text(n_Count-1);
   				
   				},
   				error:function(){
   				alert("실패");
   				}
   				})//ajax끝
   				alert("댓글이 삭제되었습니다.")
		}//if
	 });//click
	 
	 /* 댓글 수정하기*/
	 $(document).on("click",".rUBtn",function(){
		 if(temp!=0){
			 alert("다른 입력창이 열려 있습니다.");
			 return false;
		 }
		 
		 let n_cno = $(this).parent().parent().parent().attr("id");
		 let n_ccontent = $(this).parent().prev().text(); 
		 let n_cdate = $(this).parent().parent().find("span").text();
		 let f_cpw =$(this).parent().parent().prev().val();
		 let hdata = '';
		 
		 hdata += '<input type="hidden" id="hiddenTxt" value="'+n_ccontent+'">';
		 hdata += '<td><strong style="color: navy;">댓글 작성자</strong> | <strong style="color: #009223;" class="f_cid">'+id+'</strong>&nbsp;&nbsp;<span class="f_cdate">['+n_cdate+']</span>';
		 hdata += '<li style="list-style: none; float: right; line-height: 27px;"><strong>비밀번호 |<strong><input type="text" placeholder=" ※입력시 비밀글로 저장" class="f_cpw"></li>';
		 hdata += '<li id="replyTxt"><textarea cols="145%">'+n_ccontent+'</textarea></li>';
		 hdata += '<li id="replyBtn">';
		 hdata += '<button class="rCanBtn">취소</button>&nbsp';
		 hdata += '<button class="rSaveBtn">저장</button>';
		 hdata += '</li>';
		 hdata += '</td>';
		 
		 $("#"+n_cno).html(hdata);
		 temp =1;

	/* 댓글 저장하기 */
	 $("#replybtn").click(function(){
		let n_cpw = $("#replyIPw").val();
		let n_ccontent = $("#reply_ncontent").val();
		let n_Count = Number($(".n_Count").text());
		var n_bno = $(this).data('userid');
		if(n_ccontent.trim()===''){
			   alert("댓글 내용을 작성하셔야 합니다.");
			   return false;
		   }
		alert("댓글을 저장합니다.");
		$.ajax({
			url:"/community/NCommnetInsert",
			type:"post",
			data:{"n_cpw":n_cpw,"n_ccontent":n_ccontent,"n_bno":n_bno},
			dataType:"json", //받는파일형태 : text,json,xml
			success:function(data){
			console.log(data);
			let hdata ='';
			hdata += '<tr id="'+data.n_cno+'">';
			hdata += '<td><strong>댓글 작성자</strong> | <strong style="color: blue;">'+data.id+'</strong>&nbsp;&nbsp;[<span>'+moment(data.n_cdate).format("YYYY-MM-DD HH:mm:ss")+'</span>]';
			hdata += '<li id="replyTxt">&nbsp;&nbsp;'+data.n_ccontent+'</li>';
			hdata += '<li id="replyBtn">';
			hdata += '<button class="rDelBtn">삭제</button>&nbsp';
			hdata += '<button class="rUBtn">수정</button>';
			hdata += '</li>';
			hdata += '</td>';
			hdata += '</tr>';
		 
	 });//click
	 
	/*댓글 수정 저장하기*/
	  $(document).on("click",".rSaveBtn",function(){	
		  
		 let n_cno = $(this).closest("tr").attr("id")
		 let n_ccontent = $(this).parent().parent().parent().prev().find("textarea").val();
		 let n_cpw = $(this).parent().parent().parent().prev().prev().find(".f_cpw").val();

			$(".replyBox").prepend(hdata);
			$(".n_Count").text(n_Count+1); 
			
			$("#reply_ncontent").val(""); 
			$("#replyIPw").val("");
			
			},
			error:function(){
			alert("실패");
			}
			})//ajax끝
			
	 });//click
	 
	 /* 댓글 삭제하기  */
	 $(document).on("click",".rDelBtn",function(){
		let n_cno = $(this).parent().parent().parent().attr("id");
		let n_Count = Number($(".n_Count").text());

		if(confirm("댓글을 삭제하시겠습니까?")){
			$.ajax({
   				url:"/community/NCommnetDelete",
   				type:"post",
   				data:{"n_cno":n_cno},
   				dataType:"text", 
   				success:function(data){
   				console.log(data);
				$("#"+n_cno).remove();
				$(".n_Count").text(n_Count-1);
   				
   				},
   				error:function(){
   				alert("실패");
   				}
   				})//ajax끝
   				alert("댓글이 삭제되었습니다.")
		}//if
	 });//click
	 
	 /* 댓글 수정하기*/
	 $(document).on("click",".rUBtn",function(){
		 if(temp!=0){
			 alert("다른 입력창이 열려 있습니다.");
			 return false;
		 }
		 
		 let n_cno = $(this).parent().parent().parent().attr("id");
		 let n_ccontent = $(this).parent().prev().text(); 
		 let n_cdate = $(this).parent().parent().find("span").text();
		 let f_cpw =$(this).parent().parent().prev().val();
		 let hdata = '';
		 
		 hdata += '<input type="hidden" id="hiddenTxt" value="'+n_ccontent+'">';
		 hdata += '<td><strong style="color: navy;">댓글 작성자</strong> | <strong style="color: #009223;" class="f_cid">'+id+'</strong>&nbsp;&nbsp;<span class="f_cdate">['+n_cdate+']</span>';
		 hdata += '<li style="list-style: none; float: right; line-height: 27px;"><strong>비밀번호 |<strong><input type="text" placeholder=" ※입력시 비밀글로 저장" class="f_cpw"></li>';
		 hdata += '<li id="replyTxt"><textarea cols="145%">'+n_ccontent+'</textarea></li>';
		 hdata += '<li id="replyBtn">';
		 hdata += '<button class="rCanBtn">취소</button>&nbsp';
		 hdata += '<button class="rSaveBtn">저장</button>';
		 hdata += '</li>';
		 hdata += '</td>';
		 
		 $("#"+n_cno).html(hdata);
		 temp =1;

		 
	 });//click
	 
	/*댓글 수정 저장하기*/
	  $(document).on("click",".rSaveBtn",function(){	
		  
		 let n_cno = $(this).closest("tr").attr("id")
		 let n_ccontent = $(this).parent().parent().parent().prev().find("textarea").val();
		 let n_cpw = $(this).parent().parent().parent().prev().prev().find(".f_cpw").val();

			//ajax - 댓글수정 저장
			$.ajax({
				url:"/community/NCommentUpdate", 
				type:"post",
				data:{"n_cno":n_cno,"n_ccontent":n_ccontent,"n_cpw":n_cpw},
				dataType:"json",
				success:function(data){
				alert("댓글이 수정되었습니다.");
                console.log(data);
               
					//태그 입력 시작
					let hdata ='';
	   				
	   				hdata += '<td><strong>댓글 작성자</strong> | <strong style="color: blue;">'+data.id+'</strong>&nbsp;&nbsp;[<span>'+moment(data.n_cdate).format("YYYY-MM-DD HH:mm:ss")+'</span>]';
	   				hdata += '<li id="replyTxt">&nbsp;&nbsp;'+data.n_ccontent+'</li>';
	   				hdata += '<li id="replyBtn">';
	   				hdata += '<button class="rDelBtn">삭제</button>&nbsp';
	   				hdata += '<button class="rUBtn">수정</button>';
	   				hdata += '</li>';
	   				hdata += '</td>'; 
	   	
					$("#"+n_cno).html(hdata);  //html삭제 후 추가
					temp=0;
	   				
				},
				error:function(){
					alert("실패");
				}
			});//ajax
		 
	 });//click
	 
	 /* 수정 취소하기 */
	  $(document).on("click",".rCanBtn",function(){	
		 
		  if(confirm("댓글 수정을 취소하시겠습니까?")){
		  
		 let n_cno = $(this).closest("tr").attr("id")
		 let n_ccontent = $(this).closest("tr").find("input[type='hidden']").val();
		 let n_cpw = $(this).parent().parent().parent().prev().prev().find(".f_cpw").val();
		 let n_cdate = $(this).parent().parent().parent().parent().find("span").text();
		 
		 	let hdata ='';
			hdata += '<td><strong>댓글 작성자</strong> | <strong style="color: blue;">'+id+'</strong>&nbsp;&nbsp;[<span>'+moment(n_cdate).format("YYYY-MM-DD HH:mm:ss")+'</span>]';
			hdata += '<li id="replyTxt">&nbsp;&nbsp;'+n_ccontent+'</li>';
			hdata += '<li id="replyBtn">';
			hdata += '<button class="rDelBtn">삭제</button>&nbsp';
			hdata += '<button class="rUBtn">수정</button>';
			hdata += '</li>';
			hdata += '</td>';
		 
		 	$("#"+n_cno).html(hdata);
		 	temp=0;
		  }
		 	
	 });//click
	
});//jquery