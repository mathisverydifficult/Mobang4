/**
 * 
 */


$(function(){

	$("#update_btn").attr("disabled",true);	
		
	//비밀번호 확인 버튼
	$(document).on("click", "#pwd_button", function() {
		if($("#pwd").val() != null && $("#pwd").val() != ''){
			if($("#pwd").val() === $("#pwd_confirm").val()){
				$("#update_btn").attr("disabled",false);
				$("#update_btn").css("background-color","#33558b");
			} else{
				alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요");
			}
		}
	});
	
});


/**
 * 
 *//**
 * 
 */