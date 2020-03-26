<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/login/css/agent_signup.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>

<body>
	<div class="container">
		<h2><a class="mobang" href="#">모방</a>｜ 회원가입</h2>
		<hr class="hr"/>
		<form class="form-horizontal">
			<div class="form-group">
				<label for="inputPassword3">이름</label>
			    <div class="col-sm-13">
					<input type="text" class="form-control" name="name" placeholder="이름을 입력하세요.">
			    </div>
			</div>
			<div class="form-group">
				<label for="inputEmail3">이메일</label>
				<div class="col-sm-13">
					<input type="email" class="form-control" name="email" id="inputEmail3" placeholder="이메일을 입력하세요.">
					<input class="send" type="button" value="전송">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3">인증번호</label>
			    <div class="col-sm-13">
					<input type="text" class="form-control" name="code" placeholder="인증번호를 입력하세요.">
					<input class="email_confirm" type="button" value="확인">
			    </div>
			</div>
			<div class="form-group">
			    <div class="col-sm-13">
			    	<label for="inputPassword3">비밀번호</label>
					<input type="password" class="form-control" name="pwd" placeholder="비밀번호를 입력하세요.">
			    </div>
			</div>
			<div class="form-group">
				<label for="inputPassword3">비밀번호 확인</label>
			    <div class="col-sm-13">
					<input type="password" class="form-control" name="pwd_confirm"  placeholder="비밀번호를 입력하세요.">
			    </div>
			</div>
			<div class="form-group">
				<label for="inputPassword3">휴대폰 번호</label>
			    <div class="col-sm-13">
					<input type="tel" class="form-control" name="phone" placeholder="핸드폰 번호를  입력하세요.">
			    </div>
			</div>
			<div class="form-group">
				<label for="inputPassword3">사업자 등록증, 공인중개사 자격증</label>
			    <div class="col-sm-13">
					<input type="text" class="form-control" placeholder="파일 업로드 넣어야함!">
			    </div>
			</div>
			<div class="button_group">
				<input class="signup_btn" type="submit" value="회원가입">
			</div>
		</form>				
	</div>
</body>
</html>