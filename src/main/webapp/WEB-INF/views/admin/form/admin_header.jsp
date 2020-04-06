<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/admin/css/admin_header.css">
<script type="text/javascript" src="resources/admin/js/admin_header.js"></script>
</head>
<body>
	
	<div class="agenthead">
		<div class="headleft">
			<h1>모방 | 관리자</h1>
			
		</div>
		<div class="headright">
			<ul>
				<li class="first"><a href="admin_account.admin">계정관리</a>
				</li>
				<li class="first"><a href="notice_list.admin">공지사항 관리</a>
				</li>
				<li class="first"><a href="admin_qna.admin">qna 게시판</a>
				</li>
				<li class="first"><a href="admin_report.admin">문의 게시글</a>
				</li>
				
				<li class="second" style="margin-left: 25px;">
					<a href="logout.all">로그아웃</a>
				</li>
				
			</ul>
		</div>
	</div>
	
	
	

</body>
</html>