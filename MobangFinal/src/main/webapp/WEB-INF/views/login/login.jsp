<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootstrap -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/login/css/login.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-xs-6 col-md-4"></div>
			<div class="col-xs-6 col-md-4" id="main">
				<h2><a class="mobang" href="#">모방</a>｜ 로그인</h2>
				<hr class="hr"/>
				<form role="form" action="">
					<div class="form-group">
						<label>이메일</label> <input type="email" class="form-control" name="email" placeholder="이메일을 입력하세요.">
					</div>
					<div class="form-group">
						<label>비밀번호</label> <input type="password" class="form-control" name="pwd" placeholder="비밀번호를 입력하세요.">
						<div class="pwfind">
							<span id="pwfind_span"><a class="none_blue" data-toggle="modal" href="#pwfind_modal">비밀번호 찾기</a></span>
						</div>
					</div>
					<div class="button_group">
						<input class="login_btn" type="submit" value="로그인">
						<div class="sns" id="sns_naver">
							<img src="resources/images/naver.png" class="img-rounded">
							<input class="sns_btn" id="naver" type="button" value="네이버 로그인">
						</div>
						<div class="sns" id="sns_kakao">
							<img src="resources/images/kakao.JPG" class="img-rounded">
							<input class="sns_btn" id="kakao" type="button" value="카카오톡 로그인">
						</div>
					</div >
					<div class="signup">
						<span>회원이 아니세요?</span><br/>
						<span>공인중개사라면?</span>
					</div>
					<div class="signup_click">
						<a href="">이메일로 회원가입</a><br/>
						<a href="">공인중개사 회원가입</a>
					</div>
				</form>				
			</div>
			<div class="col-xs-6 col-md-4"></div>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="pwfind_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
      			<div class="modal-header">
        			<h4 class="modal-title" id="myModalLabel">비밀번호 찾기</h4>
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
     			 </div>
     			 <div class="modal-body">
       				 <div class="form-group" id="modal_email">
						<label>이메일</label> 
						<input type="email" class="form-control" id="inputEmail" name="pwfindemail" placeholder="이메일을 입력하세요.">
						<input type="button" class="email_confirm" value="전송">
						<label>인증번호</label> 
						<input type="text" class="form-control" name="code" placeholder="인증번호를 입력하세요.">
					</div>
					<div class="form-group" id="modal_pwd">
						<label for="exampleInputEmail1">비밀번호</label> 
						<input type="email" class="form-control" id="pwd_find" name="pwfindpwd" placeholder="비밀번호를 입력하세요.">
						<label>비밀번호 확인</label> 
						<input type="text" class="form-control" name="pwfindpwdconfirm" placeholder="비밀번호를 입력하세요.">
					</div>
     			 </div>
      			<div class="modal-footer">
        			<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        			<button type="button" class="btn btn-default" id="ok" data-dismiss="modal">확인</button>
      			</div>
    		</div>
 		 </div>
	</div>
</body>
</html>