<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>    
 <% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/agent/css/reset.css">
<link rel="stylesheet" type="text/css" href="resources/agent/css/agent_header.css">
<script type="text/javascript" src="resources/agent/js/agent_header.js"></script>
</head>
<body>
<sec:authorize access="isAuthenticated()">
   <sec:authentication property="principal.username" var="user_id" />
</sec:authorize>	
	<div class="agenthead">
		<div class="headleft">
			<a style="" href="agent_home.all"><h1>모방 | 공인중개사</h1></a>
			<a href="home.all"><div class="h2">모방 사이트></div></a>
		</div>
		<div class="headright">
			<ul>
				<li class="first"><a href="#">광고상품 소개</a>
					<article class="adsubmenu">
						<a href="agent_sales.all"><div class="submenu">일반 상품</div></a>
						<a href="agent_premium_sales.all"><div class="submenu">역/동 상품</div></a>
						<a href="agent_premium_sales.all"><div class="submenu">대학교 상품</div></a>
						<a href="agent_sales.all"><div class="submenu">플러스 상품</div></a>
					</article>
				</li>
				<li class="first"><a href="#">고객센터</a>
					<article class="scsubmenu">
						<a href="noticelist.all"><div class="submenu">공지사항</div></a>
						<a href="fnq.all"><div class="submenu">문의사항</div></a>
					</article>
				</li>
				<li class="second" style="margin-left: 25px;">
					
					<c:if test="${empty user_id}">
						<a href="<c:url value='/login.all'/>">로그인</a>
						<a href="usersignupform.all">회원가입</a>
					</c:if>
					<c:if test="${not empty user_id}">
						<a href="<c:url value='/logout.all'/>">로그아웃</a>
					</c:if>
					
				</li>
				<li>
					<a href="roommanage.agent"><div class="button">매물관리 바로가기</div></a>
				</li>
			</ul>
		</div>
	</div>
	
	
	

</body>
</html>