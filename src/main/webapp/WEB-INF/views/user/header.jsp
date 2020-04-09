<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/user/css/header.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script type="text/javascript">

function favodelete(id){		//찜한 방 취소
	$.ajax({
		type: "GET", 
		url:"dibs_delete.user",
		dataType:"json", 
		data: {
			dibsFv : id			// dibsFv - 방번호 보냄
		},
		success : function(result){
			
		},
		error : function(a, b, c){
			alert("삭제에러 : "+a + b + c);
		}
	});
}

</script>	
	
<body>
<sec:authorize access="isAuthenticated()">
                    <sec:authentication property="principal.username" var="user_id" />
</sec:authorize>

	<div class="container">
		<header class="headerbox">
			<div class="left">
				<a href="home.all" class="myhome">모방</a> <a href="agent_home.all"
					class="aa">모방중개사 사이트></a>
			</div>
			<div>
				<div class="right">
					<div class="right1">
						<c:if test="${empty user_id}">
						</c:if>
						<c:if test="${not empty user_id}">
							<a href="review_list.user" class="aa">리뷰</a> 
						</c:if>
						<a href="homesearch.all" class="aa">방찾기</a> 
						<a href="favorite_recent.user" class="aa">관심목록</a> 
					</div>
					<div class="right2">
						<c:if test="${empty user_id}">
							<a href="usersignupform.all" class="aa">회원가입</a> <span class="aa">·</span> 
							<a href="<c:url value='/login.all'/>" class="aa">로그인</a>
						</c:if>
						<c:if test="${not empty user_id}">
							<a id="user" href="<c:url value='userupdateform.user'/>"><i class="fas fa-user"></i>회원정보</a>
							<a href="<c:url value='/logout.all'/>" class="aa">로그아웃</a>
						</c:if>
					</div>
				</div>
				<a></a>
			</div>
		</header>
	</div>
</body>
</html>