<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/login/css/user_update.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/login/js/user_update.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div id="header">
			<div id="mobang_header">
				<a id="mobang" class="mobang" href="home.all">모방</a> <span class="mobang">｜ 회원정보 수정	</span>
			</div>
			<div id="delete_header">
				<small><a class="delete" href="userdelete.user">회원탈퇴</a></small>
			</div>
		</div>

		<form:form class="form-horizontal" id="update" enctype="multipart/form-data" modelAttribute="loginDto" action="userupdate.user" method="post">
			<form:input path="email" type="hidden" id="email"/>
			<form:input path="lifestyle" type="hidden" id="lifestyle"/>
			<form:input path="shower" type="hidden"  id="shower" />
			<form:input path="favoriteage"  type="hidden" id="favoriteage" />
			<form:input path="gender"  type="hidden" id="gender"/>
			<form:input path="animal"  type="hidden" id="animal" />
			<form:input path="roommate"  type="hidden"  id="roommate" />
			<div class="form-group">
				<input type="hidden" path="random" id="random" value="77777" />
				<label>이름</label>
			    <div class="col-sm-13">   
			    	<form:input path="name" cssClass="form-control" name="name" id="name" value="${name }"/>
			    </div>
				<form:errors path="name" cssClass="errormsg" />
			</div>
			<div class="form-group">
			    <div class="col-sm-13">
			    	<label for="inputPassword">비밀번호</label>
					<form:password path="pwd" cssClass="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요."/>
					<form:errors path="pwd" cssClass="errormsg" />
			    </div>
			</div>
			<div class="form-group">
				<label for="inputPassword">비밀번호 확인</label>
			    <div class="col-sm-13">
			    	<div class="input-group">
						<form:password path="" cssClass="form-control" name="pwd_confirm" id="pwd_confirm" placeholder="비밀번호를 입력하세요."/>
						<span class="input-group-btn">
								<button class="btn btn-default" id="pwd_button" type="button">확인</button>
						</span>
					</div>
			    </div>
			</div>
			<div class="form-group">
				<label>휴대폰 번호</label>
			    <div class="col-sm-9">
					<form:input path="phone" cssClass="form-control" name="phone" value="${phone }"/>
					<form:errors path="phone" cssClass="errormsg" />
			    </div>
			    <div class="custom-control custom-checkbox col-sm-5" id="request_roommate">
						<input type="checkbox" id="roommate_btn" name="roommate" value="roommate" class="custom-control-input">
						<label class="custom-control-label" for="roommate_btn">룸메이트 신청하기😊</label>
				</div>
			</div>
			<div id="roommate_div">
				<div class="form-group">
					<label class="room_label">청결도</label>
				   	<div class="d-flex justify-content-center my-4">	
					    <form:input path="clean" id="clean" cssClass="custom-range" name="clean" type="range" min="0" max="10" step="1"  value="${clean }" />
					  <span class="font-weight-bold ml-2 mt-1 valueSpan" id="number_span"></span>
					</div>
					<div class="row">
						  <div class="col-md-10"><label id="derty">더러움</label></div>
						  <div class="col-md-2"><label id="clean">깔끔함</label></div>
					</div>
				</div>
				<label class="room_label">생활패턴</label>
				<div class="row">
					<!-- Group of default radios - option 1 -->
					<div class="custom-control custom-radio col-sm-6">
					  	<input type="radio" class="custom-control-input" id="morning_radio"  name="lifestyle" value="아침형" checked>
					  	<label class="custom-control-label" for="morning_radio">아침형</label>
					</div>
					
					<!-- Group of default radios - option 2 -->
					<div class="custom-control custom-radio col-sm-6">
						  <input type="radio" class="custom-control-input" id="night_radio"  name="lifestyle" value="올빼미형">
						  <label class="custom-control-label" for="night_radio">올빼미형</label>
					</div>
				</div>
				<label class="room_label">샤워습관</label>
				<div class="row">
					<!-- Group of default radios - option 1 -->
					<div class="custom-control custom-radio col-sm-4">
					  	<input type="radio" class="custom-control-input" id="morningshower_radio" name="shower" value="아침형" checked>
					  	<label class="custom-control-label" for="morningshower_radio">아침형</label>
					</div>
					
					<!-- Group of default radios - option 2 -->
					<div class="custom-control custom-radio col-sm-4">
						  <input type="radio" class="custom-control-input" id="nightshower_radio" name="shower" value="저녁형" >
						  <label class="custom-control-label" for="nightshower_radio">저녁형</label>
					</div>
					
					<div class="custom-control custom-radio col-sm-4">
						  <input type="radio" class="custom-control-input" id="allshower_radio"  name="shower" value="둘다" >
						  <label class="custom-control-label" for="allshower_radio">둘다</label>
					</div>
				</div>
				<label class="room_label">선호연령</label>
				<div class="row">
					<!-- Group of default radios - option 1 -->
					<div class="custom-control custom-radio col-sm-4">
					  	<input type="radio" class="custom-control-input" id="age_10" name="favoriteage" value="19-24" checked>
					  	<label class="custom-control-label" for="age_10">19-24</label>
					</div>
					
					<!-- Group of default radios - option 2 -->
					<div class="custom-control custom-radio col-sm-4">
						  <input type="radio" class="custom-control-input" id="age_20" name="favoriteage" value="25-29" >
						  <label class="custom-control-label" for="age_20">25-29</label>
					</div>
					
					<div class="custom-control custom-radio col-sm-4">
						  <input type="radio" class="custom-control-input" id="age_all" name="favoriteage" value="상관없음">
						  <label class="custom-control-label" for="age_all">상관없음</label>
					</div>
				</div>
				<label class="room_label">성별</label>
				<div class="row">
					<!-- Group of default radios - option 1 -->
					<div class="custom-control custom-radio col-sm-6">
					  	<input type="radio" class="custom-control-input" id="man" name="gender" value="남" checked>
					  	<label class="custom-control-label" for="man">남</label>
					</div>
					
					<!-- Group of default radios - option 2 -->
					<div class="custom-control custom-radio col-sm-6">
						  <input type="radio" class="custom-control-input" id="woman" name="gender" value="여" >
						  <label class="custom-control-label" for="woman">여</label>
					</div>
				</div>
				<label class="room_label">애완동물</label>
				<div class="row">
					<!-- Group of default radios - option 1 -->
					<div class="custom-control custom-radio col-sm-6">
					  	<input type="radio" class="custom-control-input" id="yes" value="가능" name="animal" checked>
					  	<label class="custom-control-label" for="yes">가능</label>
					</div>
					
					<!-- Group of default radios - option 2 -->
					<div class="custom-control custom-radio col-sm-6">
						  <input type="radio" class="custom-control-input" id="no" name="animal" value="불가능">
						  <label class="custom-control-label" for="no">불가능</label>
					</div>
				</div>
				<div>
					
				</div>
				<div class="form-group">
					<label class="room_label">지켜줬음 해</label>
				    <div class="col-sm-13">
						<form:textarea path="needs" class="form-control" name="needs" rows="3" value="${needs }"></form:textarea>
				    </div>
				</div>
			</div>
			<div class="button_group">
				<input class="btn btn-default" type="button" id="update_btn" value="수정">
			</div>
		</form:form>				
	</div>
</body>
</html>