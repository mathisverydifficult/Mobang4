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
		<h2><a class="mobang" href="home.all">모방</a>｜ 회원가입</h2>
		<hr class="hr"/>
		<form:form class="form-horizontal"  enctype="multipart/form-data" modelAttribute="loginDto" action="agentsignup.all" method="post">
			<div class="form-group">
				<input type="hidden" path="random" id="random" value="77777" />
				<label>이름</label>
			    <div class="col-sm-13">
			    		<input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력하세요.">
			    		<form:errors path="name" cssClass="errormsg" />
			    </div>
			</div>
			<div class="form-group">
				<label>이메일</label>
				<div class="col-sm-13">
					<div class="input-group">
						<form:input path="email" cssClass="form-control" name="email" id="email" placeholder="이메일을 입력하세요."/>
						<span class="input-group-btn">
							<button class="btn btn-default" id="check" type="button">중복확인</button>
							<button class="btn btn-default" id="emailBtn" type="button">전송</button>
					    </span>
				    </div><!-- /input-group -->
					<form:errors path="email" cssClass="errormsg" />
				</div>
			</div>
			<div class="form-group">
				<label>인증번호</label>
			    <div class="col-sm-13">
			    	<div class="input-group">
						<input type="text" class="form-control" id="code" name="code" placeholder="인증번호를 입력하세요.">
						<span class="input-group-btn">
								<button class="btn btn-default" id="email_confirm" type="button">확인</button>
						</span>
					</div>
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
					<form:input path="phone" cssClass="form-control" name="phone" placeholder="핸드폰 번호를  입력하세요."/>
					<form:errors path="phone" cssClass="errormsg" />
			    </div>				
				<div class="form-group" id="file">
					<label>공인중개사 자격증, 사업자 등록증</label>
				    <div class = "col-sm-13">
			    		<input multiple="multiple" id ="userfile" type="file" name="multiuserfile" placeholder="파일선택 "/><br/>
			    	</div>
				</div>
			</div>
			<div class="button_group">
				<input class="btn btn-default" type="submit" id="signup_btn" value="회원가입">
			</div>
		</form:form>				
	</div>
</body>
</html>