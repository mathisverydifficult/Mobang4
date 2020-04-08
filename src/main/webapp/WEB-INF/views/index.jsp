<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="home.all">홈</a><br/>
	<a href="roommate_recommand.user">추천받은 룸메이트</a><br/>
	<a href="favorite_recent.user">최근 본 방</a><br/>
	<a href="favorite_dibs.user">찜한 방</a><br/>
	<a href="room_detail.all">방 상세보기</a><br/>
	<br/><br/><br/>
	
	<a href="admin_account.admin">관리자 유저관리</a><br/>
	<a href="admin_qna.admin">관리자 qna</a><br/>
	<a href="admin_report.admin">관리자 신고,승인</a><br/>
	
	
	<br/>
	<a href="agent_home.all">중개사 홈</a><br/>
	<a href="agent_mypage.agent">마이페이지</a><br/>
	<a href="agent_roommanage.agent">매물관리바로가기</a><br/>
	
	<a href="file.all">파일 업로드 기능</a><br/>
	
	<a href="notice_list.admin">관리자 공지 페이지 들어가기</a>
	
	<br/>
	
	<br/>
	
	<a href="/mobang/userupdateform.user">회원정보수정</a> <br/>
 	<a href="/mobang/agentupdateform.agent">공인중개사 회원정보수정</a>
	
	<br/>
	
	<a href="#" onclick="document.getElementById('logout-form').submit();">Sign out</a>
	<form id="logout-form" action="<c:url value='/logout.all'/>" method="post">
	   <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
	</form>
	
	



	
	
	
	

           


</body>
</html>