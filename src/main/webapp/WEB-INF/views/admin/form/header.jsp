<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/user/css/header.css">
<body>
	<div class="container">
	<header class="headerbox">
		<div class="left">
			<a href="home.user" class="myhome">모방 관리자</a>
			<a href="agent_home.agent" class="aa">모방중개사 사이트></a>
		</div>
		<div>
			<div class="right">
				<div class="right1">
					<a href="admin_account.admin" class="aa">계정관리</a>
					<a href="notice_list.admin" class="aa">공지사항 관리</a>
					<a href="admin_qna.admin" class="aa">qna 게시판</a>
					<a href="admin_report.admin" class="aa">문의글</a>
				</div>
				<div class="right2">
					<a href="<c:url value='/logout.all'/>" class="aa">로그아웃</a>
				</div>
			</div>
			<a></a>
		</div>
	</header>
	</div>