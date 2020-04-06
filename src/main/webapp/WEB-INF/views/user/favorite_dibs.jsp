 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="resources/css/bootstrap.min.css"> 
<link rel="stylesheet" href="resources/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="resources/user/css/favorite_recent.css">
<style type="text/css">
.card{
	margin: 20px 1%;
	float:left;
}
#menutitle {
	font-size: 24px;
}
#menucontent {
	margin: 5px;
}
</style>
  
<style type="text/css">


</style>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<jsp:include page="/WEB-INF/views/user/header.jsp" />
<body>
<!-- rgb(51, 85, 139) 모방 메인색깔 -->
<div class="jumbotron text-center" id="headblock" style="background-color:#33558B;">
  <div>
  	<h1 style="color: white;">관심목록</h1>
  </div>
  <div class="row">
  	<div><a class="styleroomattention" href="favorite_recent.user" style="font-size: 30px;">최근 본 방</a></div>
  	<div><a class="styleroomattention" href="favorite_dibs.user" style="font-size: 30px;">찜한 방</a></div>
  </div>
</div>

<div class="container">

	<div class="page-header">
	    <div class="row">
	    	<div class="col-sm-6 text-left"><span id="menutitle">찜한 방</span></div>
	    	<div class="col-sm-6 text-right"><span id="menucontent">총 ${count }개의 찜한 방이 있습니다.</span></div>
	    </div>	
    </div>
    
	<div>
	<c:choose>
		<c:when test="${empty list}">
			<div class="p-2 border">찜한 방이 없습니다</div>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list }" var="dto" varStatus="status">
				<div class="card" style="width:23%">
				    <img class="card-img-top" src="resources/user/img/cat4.png" alt="Card image" style="width:100%">
				    <div class="card-body">
					    <h4 class="card-title">${dto.email }</h4>
					    <p class="card-text">${dto.divFv }, ${status.count}</p>
				    </div>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</div>
	
	
</div>

<div class="container">
	<div class="page-header">
    	<h3 class="text-center">관심있는 방이 같은 룸메이트</h3>
    </div>
    <div>
    	<div class="card" style="width:23%">
		    <img class="card-img-top" src="resources/user/img/noroom.png" alt="Card image" style="width:100%">
		    <div class="card-body">
			    <h4 class="card-title">${dto.email }</h4>
			    <p class="card-text">${dto.recentFv }, ${status.count}</p>
		    </div>
		</div>
    </div>  
</div>



<div class="container">
	<div class="page-header">
    	<h3 class="text-center">신규로 등록한 룸메이트</h3>
    </div>
    <div>
    	<div class="card" style="width:23%">
		    <img class="card-img-top" src="resources/user/img/noroom.png" alt="Card image" style="width:100%">
		    <div class="card-body">
			    <h4 class="card-title">${dto.email }</h4>
			    <p class="card-text">${dto.recentFv }, ${status.count}</p>
		    </div>
		</div>
    </div>  
</div>



<%@ include file="form/user_footer.jsp" %>
</body>
</html>