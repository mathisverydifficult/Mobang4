/**
 * 
 */


$(function(){

	$("#signup_btn").attr("disabled",true);	
	
	console.log($("#email").val());
	console.log($("#lifestyle").val());
	console.log($("#favoriteage").val());
	console.log($("#clean").val());
	console.log($("#gender").val());
	console.log($("#animal").val());
	console.log($("#needs").val());
	console.log($("#roommate").val());
	console.log($("#shower").val() +" "+ $("#nightshower_radio").val());
	console.log($("#shower").val() == $("#nightshower_radio").val());
	
	
	if($("#lifestyle").val() == $("#night_radio").val()){
		$("#night_radio").prop('checked','true');
		
	}	
	
	if($("#shower").val() == $("#nightshower_radio").val()){
		$("#nightshower_radio").prop('checked','true');
		
	}	
	
	if($("#favoriteage").val() == $("#age_20").val()){
		$("#age_20").prop('checked','true');
		
	} else if($("#favoriteage").val() == $("#age_all").val()){
		$("#age_all").prop('checked','true');
	}
	
	if($("#gender").val() == $("#woman").val()){
		$("#woman").prop('checked','true');
		
	}	
	
	if($("#animal").val() == $("#no").val()){
		$("#no").prop('checked','true');
		
	}	
	
	if($("#roommate").val() == "roommate"){
		$("#roommate_bnt").prop('checked','true');
		$("#roommate_div").show();
	}	
		
	console.log($("#pwd").val());
	//비밀번호 확인 버튼
	$(document).on("click", "#pwd_button", function() {
		if($("#pwd").val() != null || $("#pwd").val().trim() != ''){
			if($("#pwd").val() === $("#pwd_confirm").val()){
				$("#update_btn").attr("disabled",false);
				$("#update_btn").css("background-color","#33558b");
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
	
	//값 보내기
	$(document).on("click", "#update_btn", function(){
		var email = $("#email").val();
		var name = $("#name").val();
		var pwd = $("#pwd").val();
		var phone = $("#phone").val();
		var roommate = $("#roommate").val(); 
		var clean = $("#clean").val();
		var lifestyle = $("#lifestyle").val();
		var shower = $("#shower").val();
		var favoriteage = $("#favoriteage").val();
		var gender = $("#gender").val();
		var animal = $("#animal").val();
		var needs = $("#needs").val();
		
		$.ajax({
			url:"userupdate.all",
			type:"post",
			data:{
				email: email,
				name : name,
				pwd : pwd,
				phone : phone,
				roommate : roommate,
				clean : clean,
				lifestyle : lifestyle,
				shower : shower,
				favoriteage : favoriteage,
				gender : gender,
				animal : animal,
				needs : needs
			} 
		});
	});
	
	
	
});


