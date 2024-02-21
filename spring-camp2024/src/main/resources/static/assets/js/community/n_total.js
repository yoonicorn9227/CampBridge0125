/**
 nList & nWrite* nUpdate
 */

/*nUpdate b_type 가져오기*/
document.addEventListener("DOMContentLoaded", function() {
	var selectElement = $("#bType");
	var options = selectElement.find("option");
	
	options.each(function() {
	      if ($(this).val() == sel_Value) {
	        $(this).prop("selected", true);
	      }
	});//options
});	

 //파일첨부시 이미지 바로 보이기
	$(function(){
		
		$("#saveBtn").click(function(){
			nWriteFrm.submit();
		});
		
		        $('#n_bfile').change(function() {
	                var fileInput = $(this)[0];
	                var filePreviewContainer = $('#filePreviewContainer');
	                filePreviewContainer.empty(); // 기존에 표시된 미리보기 초기화

	                // 선택한 모든 파일에 대해 미리보기 생성
	                for (var i = 0; i < fileInput.files.length; i++) {
	                    var file = fileInput.files[i];
	                    var reader = new FileReader();

	                    reader.onloadend = (function (file) {
	                        return function () {
	                            // 파일 미리보기 표시
	                            var previewItem = $('<div class="file-preview-item"></div>');
	                            previewItem.append('<img src="' + reader.result + '" alt="File Preview" class="file-preview-img">');
	                            filePreviewContainer.append(previewItem);
	                        };
	                    })(file);

	                    if (file) {
	                        reader.readAsDataURL(file);
	                    }
	                }
	            });//change
	            
	            	 $("#searchBtn").click(function(){
		 nListSearchFrm.submit();
	 });
	 
	 /* 글쓰기 관리자 외에 페이지 이동 막기 */
	  $("#n_write").click(function(event){
			   
			   event.preventDefault();
		   		$.ajax({
		   			url:"/community/session_check",
		   			type:"get",
		   			dataType:"text",
		   			success:function(data){
		   			console.log(data);
		   			if(data =='imposs'){
		   				alert("관리자 외에 글쓰기가 불가합니다.");
		   			}else{
		   				window.location.href = $("#n_write").attr("href");
		   			}
		   			},
		   			error:function(){
		   			alert("실패");
		   			}
		   			});
	 
				 });//click
				 
	/*수정버튼*/
	$("#nUpdateBtn").click(function(){
		notice_Frm.submit();
	});
	
	
	/* 업로드할 사진 보여주기*/
    $('#n_bfile_write').change(function() {
    var fileInput = $(this)[0];
    var filePreviewContainer = $('#filePreviewContainer');
    filePreviewContainer.empty(); // 기존에 표시된 미리보기 초기화

    // 선택한 모든 파일에 대해 미리보기 생성
    for (var i = 0; i < fileInput.files.length; i++) {
        var file = fileInput.files[i];
        var reader = new FileReader();

        reader.onloadend = (function (file) {
            return function () {
                // 파일 미리보기 표시
                var previewItem = $('<div class="file-preview-item"></div>');
                previewItem.append('<img src="' + reader.result + '" alt="File Preview" class="file-preview-img">');
                filePreviewContainer.append(previewItem);
            };
        })(file);

        if (file) {
            reader.readAsDataURL(file);
        }
    }
});	//change		 
	
	            
			});//jquery