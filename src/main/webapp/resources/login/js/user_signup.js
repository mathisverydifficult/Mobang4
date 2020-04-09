/**
 * 
 */


$(function(){

	$("#emailBtn").attr("disabled",true)
	$("#email_confirm").attr("disabled",true)
	$("#pwd_button").attr("disabled",true);	
	$("#signup_btn").attr("disabled",true);	
	
	$(document).on("click", "#check", function(){
		var emailchk = 0;
		var email = $('#email').val()
		console.log(email);
		
		$.ajax({
			url:"check.all",
			type:"get",
			data:{
				"email": email
			},
			contentType: "application/json; charset=UTF-8",
			success: function(data) {
				if(data > 0){
					$('#email').css('color','red');
					alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
				} else{
					$("#emailBtn").attr("disabled",false);
					$("#emailBtn").css("background-color","#33558b");
					alert("사용가능한 아이디입니다.");
					
					emailchk = 1;
				}
			},
			error : function(error) {
				alert("???" + error);
			}
		});
	});
	
	$(document).on("click", "#email", function(){
		$('#email').css('color','black');
	});
	
	/*
	이메일 인증 버튼 클릭시 발생하는 이벤트
	*/
		$(document).on("click", "#emailBtn", function(){
		/* 이메일 중복 체크 후 메일 발송 비동기 처리 */
		
		$.ajax({
			type:"get",
			url : "createEmailCheck.all",
			data : "email=" + $("#email").val() + "&random=" + $("#random").val(),
			//data: "userEmail="+encodeURIComponent($('#userEmail').val()),
			/* encodeURIComponent
			예를들어, http://a.com?name=egoing&job=programmer 에서 &job=programmer
			중 '&'는 하나의 파라미터가 끝나고 다음 파라미터가 온다는 의미이다.
			그런데 다음과 같이 job의 값에 &가 포함된다면 시스템은 job의 값을 제대로 인식할수 없게 된다. */
			success : function(data){
				alert("사용가능한 이메일입니다. 인증번호를 입력해주세요.");
				$("#email_confirm").attr("disabled",false);
				$("#email_confirm").css("background-color","#33558b");
			},
			error: function(data){
				alert("에러가 발생했습니다.");
				return false;
			}
		})
	})

/*
이메일 인증번호 입력 후 인증 버튼 클릭 이벤트
*/
	$(document).on("click", "#email_confirm", function(){
		$.ajax({
			type:"get",
			url:"emailAuth.all",
			data:"authCode=" + $('#code').val() + "&random=" + $("#random").val(),
			success:function(data){
				if(data=="complete"){
					alert("인증이 완료되었습니다.");
					$("#pwd_button").attr("disabled",false);
					$("#pwd_button").css("background-color","#33558b");
				}else if(data == "false"){
					alert("인증번호를 잘못 입력하셨습니다.")
				}
			},
			error:function(data){
				alert("에러가 발생했습니다.");
			}
		});
	});
	

	//비밀번호 확인 버튼
		$(document).on("click", "#pwd_button", function() {
			if($("#pwd").val() != null || $("#pwd").val().trim() != ''){
				if($("#pwd").val() === $("#pwd_confirm").val()){
					$("#signup_btn").attr("disabled",false);
					$("#signup_btn").css("background-color","#33558b");
				} else{
					alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요");
				}
			}
		});
		
	//룸메이트 신청 클릭시 
	$(document).on("click", "#roommate", function(){
		if($("#roommate_div").css("display") == "none"){
			$("#roommate_div").show();
		}else{
			$("#roommate_div").hide();
		}
	});
	

});


