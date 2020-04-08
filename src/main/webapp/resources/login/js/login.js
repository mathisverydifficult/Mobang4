/**
 * 
 */

$(function () {
	/*$(document).ready(function () {
		var token = $("meta[name='csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
		});
	});*/
	
	/*console.log("11"+$("#fail").val());
	
	$(document).ready(function (event) {
		if($("#fail").val() != null || $("#fail").val().trim() != ''){
			alert("비밀번호 변경을 실패하였습니다.");
			
		   event.preventDefault();
		   
	      $(this).modal({
	        fadeDuration: 250
	      });
		}
	});*/
	
	$("#ok").attr("disabled",true);	
	
	//비밀번호 확인 버튼
	$(document).on("click", "#ok", function() {
		if($("#pwd").val() != null || $("#pwd").val().trim() != ''){
			if($("#pwd").val() === $("#pwd_confirm").val()){
				$("#signup_btn").attr("disabled",false);
				$("#signup_btn").css("background-color","#33558b");
			} else{
				alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요");
			}
		}
	});
	
	/*
	이메일 인증 버튼 클릭시 발생하는 이벤트
	*/
	$(document).on("click", "#emailBtn", function(){
		/* 이메일 중복 체크 후 메일 발송 비동기 처리 */
		alert($("#inputEmail").val());
		$.ajax({
			type:"get",
			url : "createEmailCheck.all",
			data : "email=" + $("#inputEmail").val() + "&random=" + $("#random").val(),
			//data: "userEmail="+encodeURIComponent($('#userEmail').val()),
			/* encodeURIComponent
			예를들어, http://a.com?name=egoing&job=programmer 에서 &job=programmer
			중 '&'는 하나의 파라미터가 끝나고 다음 파라미터가 온다는 의미이다.
			그런데 다음과 같이 job의 값에 &가 포함된다면 시스템은 job의 값을 제대로 인식할수 없게 된다. */
			success : function(data){
				alert("사용가능한 이메일입니다. 인증번호를 입력해주세요.");
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
					$("#ok").attr("disabled",false);
				}else if(data == "false"){
					alert("인증번호를 잘못 입력하셨습니다.")
				}
			},
			error:function(data){
				alert("에러가 발생했습니다.");
			}
		});
	});
	

	
});

function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	  
	  if(profile.getId() != null){			
		  var email = profile.getEmail();
		  var name = profile.getName();
	      
		  location.href="/mobang/usersignupform.all?email="+email+"&name="+name;
	  }
}



	



