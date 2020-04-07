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
<link rel="stylesheet" href="resources/login/css/agent_signup.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/login/js/agent_signup.js"></script>
</head>
<body>
	<div class="container">
		<h2><a class="mobang" href="#">모방</a>｜ 회원정보수정</h2>
		<hr class="hr"/>
		<form:form class="form-horizontal"  enctype="multipart/form-data" modelAttribute="loginDto" action="agentupdate.all" method="post">
			<div class="form-group">
				<input type="hidden" path="random" id="random" value="77777" />
				<label>이름</label>
			    <div class="col-sm-13">
			    		<form:input path="name" cssClass="form-control" name="name" id="name" value="${name }"/>
			    		<form:errors path="name" cssClass="errormsg" />
			    </div>
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
						<form:password path="pwd" cssClass="form-control" name="pwd_confirm" id="pwd_confirm" placeholder="비밀번호를 입력하세요."/>
						<span class="input-group-btn">
								<button class="btn btn-default" id="pwd_button" type="button">확인</button>
						</span>
					</div>
			    </div>
			</div>
			<div class="form-group">
				<label>휴대폰 번호</label>
			    <div class="col-sm-13">
					<form:input path="phone" cssClass="form-control" name="phone" value="${phone }"/>
					<form:errors path="phone" cssClass="errormsg" />
			    </div>				
				<div class="form-group">
					<label class="room_label">공인중개사 자격증</label>
				    <div class="col-sm-13">
						<input type="text" class="form-control" placeholder="파일 업로드 넣어야함!">
				    </div>
				</div>
			</div>
			<div class="button_group">
				<input class="btn btn-default" type="submit" id="signup_btn" value="수정">
			</div>
		</form:form>				
	</div>
</body>
</html>