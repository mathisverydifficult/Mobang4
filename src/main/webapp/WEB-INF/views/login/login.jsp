<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>

<!-- bootstrap 
<meta name="viewport" content="width=device-width, initial-scale=1">-->

<meta name="google-signin-client_id" content="325091248005-pf5uu2ks9ra86akriht5nugkkb3e3kfk.apps.googleusercontent.com">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/login/css/login.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="//developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>

<script type="text/javascript" src="resources/login/js/login.js"></script>

</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-xs-6 col-md-4"></div>
			<div class="col-xs-6 col-md-4" id="main">
				<h2><a class="mobang" href="#">모방</a>｜ 로그인</h2>
				<hr class="hr"/>
				<form name="loginfrm" action="<c:url value='/home.user'/>" method="post">
					 <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
					 <input name="name" type="hidden" value="">
					<div class="form-group">
						<label>이메일</label> <input type="email" class="form-control" name="email" placeholder="이메일을 입력하세요.">
					</div>
					<div class="form-group">
						<label>비밀번호</label> <input type="password" class="form-control" name="pwd" placeholder="비밀번호를 입력하세요.">
						<div class="pwfind">
							<span id="pwfind_span"><a class="none_blue" data-toggle="modal" href="#pwfind_modal">비밀번호 찾기</a></span>
						</div>
					</div>
					<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
					    <font color="red">
					        <p>${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
					        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
					    </font>
					</c:if>

					<div class="button_group">
						<input class="login_btn" type="submit" name="loginbtn" value="로그인">
						
						<div class="sns" id="sns_google">
							<div class="g-signin2" data-width="312px" data-height="43px" id="google" data-onsuccess="onSignIn"></div>
						</div>
						<div class="sns" >
							<!-- <img src="resources/login/img/kakao.JPG" class="img-rounded">
							<input class="sns_btn" id="kakao" type="button" value="카카오톡 로그인"> -->
							<a id="kakao-login-btn"></a>
							<a href="http://developers.kakao.com/logout"></a>
						</div>
					</div >
					<div class="signup">
						<span>회원이 아니세요?</span><br/>
						<span>공인중개사라면?</span>
					</div>
					<div class="signup_click">
						<a href='<c:url value="/usersignupform.all"/>'>이메일로 회원가입</a><br/>
						<a href="<c:url value="/agentsignupform.all"/>">공인중개사 회원가입</a>
					</div>
				</form>				
			</div>
			<div class="col-xs-6 col-md-4"></div>
		</div>
	</div>
	
	<!-- kakao button 아래에 js가 있어야 한다 -->
	<script type="text/javascript">
		Kakao.init('3f25e036bbefcfbf095df1ef5f01914d');
		
		 Kakao.Auth.createLoginButton({
			    container: '#kakao-login-btn',
			    success: function(authObj) {
			    	Kakao.API.request({
                        url: '/v2/user/me',
                        success: function(res) {
	                        console.log(res);
	                         
	                        var email = res.kakao_account.email;   //유저의 이메일
	                        console.log(email);
	                         
	               		  	location.href="/mobang/usersignupform.all?email="+email;
                        },
                        fail: function(error) {
                         alert(JSON.stringify(error));
                        }
                       });
			    },
			    fail: function(err) {
			      alert(JSON.stringify(err))
			    },
		 })
	</script>

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