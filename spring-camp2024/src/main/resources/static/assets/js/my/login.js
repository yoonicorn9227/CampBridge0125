/**
 * 로그인
 */

 
 $(function(){
				
				
				
				$("#signUpBtn").click(function(){
					alert("회원가입 페이지로 이동합니다.")
					location.href="signUp";
				});//#회원가입
		    //----------------아이디 저장하기--------------------
				var savedId = localStorage.getItem("rememberedId");
				if(savedId){
					$("#id").val(savedId);
					$("#remember-check").prop("checked",true);
				}//if
				
				$("#loginBtn").click(function(){
					var enteredId = $("#id").val();
			        var enteredPw = $("#pw").val();
					if(enteredId.length<1){
					alert("아이디를 입력하세요.")
					$("#id").focus();
					return false
					}//if-로그인 유효성
					
					if(enteredPw.length<4){
					alert("비밀번호를 다시 입력하세요.")
					$("#pw").focus();
					return false
					}//if-비밀번호 유효성
					
					if($("#remember-check").is(":checked")){
						localStorage.setItem("rememberedId", enteredId);
					}else{localStorage.removeItem("rememberedId");}//if-else
					
					loginFrm.submit();
				});//로그인버튼
				
				
				
				
				//아이디 찾기-----------------------
				$("#idSBtn").click(()=>{
					alert("아이디찾기시작");
					
					var enteredName = $("#idName").val();
			        var enteredEmail = $("#idEmail").val();
					if(enteredName.length<1){
					alert("이름을 입력하세요.")
					$("#idName").focus();
					return false
					}//if-이름 유효성
					
					if(enteredEmail.length<1){
					alert("이메일을 입력하세요.")
					$("#idEmail").focus();
					return false
					}//if-이메일 유효성
				
					let name = $("#idName").val();
					let email = $("#idEmail").val();
					
					
					//ajax
					$.ajax({
						url:"/my/idSearch",
						data:{"name":name,"email":email},
						type:"post",
						dataType:"text",
						success:function(data){
							console.log(data);
							if(data=="fail"){
								alert("아이디가 존재하지 않습니다. 회원가입을 해주세요.");
							}else{
								alert("아이디를 찾았습니다.");
								location.href="/my/idsearch?id="+data;
							}
						},
						error:function(){
							alert("실패");
						}
					});//ajax
				});//idBtn
				
				
				
				
				//비밀번호 찾기-----------------------
				$("#pwSBtn").click(function(){
					alert("비밀번호 찾기를 시작");
					
					
					
					var id = $("#pwId").val();
			        var email = $("#pwNEmail").val();
			        
			        //alert("id:"+id);
			        //alert("email:"+email);
			        
					if(id.length<1){
					alert("아이디를 입력하세요.")
					$("#pwId").focus();
					return false
					}//유효성
			        
					
					//ajax
					$.ajax({
						url:"/my/pwsearch",
						data:{"id":id,"email":email},
						type:"post",
						dataType:"text",
						success:function(data){
							if(data=="success"){
								alert("이메일이 발송되었습니다."); 
								location.href="/my/pwsearch";
							} 
							else alert("아이디 또는 이메일주소가 틀립니다. 다시 입력하세요.");
							console.log(data);
						},
						error:function(){
							alert("실패");
						}
					});//ajax
				});//pwSBtn
				
				
				
				
				
				
				
				
				
				//----아이디 저장하기 체크박스 시작-------	
			});//제이쿼리 구문
			  function onSuccess(googleUser) {
			      console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
			    }
			    function onFailure(error) {
			      console.log(error);
			    }
			    function renderButton() {
			      gapi.signin2.render('my-signin2', {
			        'scope': 'profile email',
			        'width': 350,
			        'height': 53,
			        'longtitle': true,
			        'theme': 'dark',
			        'onsuccess': onSuccess,
			        'onfailure': onFailure,
			      });
			    }
			    
			    
			    