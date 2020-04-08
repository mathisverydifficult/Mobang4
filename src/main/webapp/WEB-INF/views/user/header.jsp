<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<div class="container">
		<header class="headerbox">
			<div class="left">
				<a href="home.all" class="myhome">모방</a> <a href="agent_home.agent" 
					class="aa">모방중개사 사이트></a>
			</div>
			<div>
				<div class="right">
					<div class="right1">
						<a href="review_list.user">로그인되면 리뷰로 갈 것</a> 
						<a href="homesearch.all" class="aa">방찾기</a> 
						<a href="favorite_recent.user" class="aa">관심목록</a> 
							<a href="" class="aa">알림</a>
					</div>
					<div class="right2">
						<c:if test="${empty user}">
							<a href="" class="aa">회원가입</a> <span class="aa">·</span> 
							<a href="<c:url value='/login.all'/>" class="aa">로그인</a>
						</c:if>
						<c:if test="${not empty user}">
							<a href="<c:url value='/login.all'/>" class="aa">id</a>
						</c:if>
					</div>
				</div>
				<a></a>
			</div>
		</header>
	</div>
</body>
</html>