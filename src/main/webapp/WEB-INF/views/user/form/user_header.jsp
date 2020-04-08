<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/agent/css/reset.css">
<link rel="stylesheet" type="text/css" href="resources/user/css/user_header.css">

<script type="text/javascript" src="resources/user/js/user_header.js"></script>
</head>
<body>
	
	<div class="agenthead">
		<div class="headleft">
			<a style="" href="home.user"><h1>모방 | 메인</h1></a>
			<a href="agent_home.all"><div class="h2">모방 중개사></div></a>
		</div>
		<div class="headright">
			<ul>
				<li class="first"><a href="room_search.user">방찾기</a>
					
				</li>
				<li class="first"><a href="#">관심목록</a>
					<article class="scsubmenu">
						<a href="favorite_recent.user"><div class="submenu">최근 본 방</div></a>
						<a href="favorite_dibs.user"><div class="submenu">찜한 방</div></a>
					</article>
				</li>
				<li class="first"><a href="#">알림</a>
					<article class="scsubmenu">
						<a href="#"><div class="submenu">공지사항</div></a>
						<a href="#"><div class="submenu">문의사항</div></a>
					</article>
				</li>
				<li class="second" style="margin-left: 25px;">
					<a href="#">로그인</a>
					<a href="#">회원가입</a>
				</li>
				
				<li class="second" style="margin-left: 25px;"><a>곽현준님</a>
					<article class="adsubmenu">
						<a href="#"><div class="submenu">정보수정</div></a>
						<a href="#"><div class="submenu">작성한 리뷰</div></a>
						<a href="#"><div class="submenu">로그아웃</div></a>
					</article>
				</li>				
			</ul>
		</div>
	</div>
	
	
	

</body>
</html>