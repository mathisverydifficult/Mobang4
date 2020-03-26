<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/user/css/user_review.css">

</head>
<jsp:include page="/WEB-INF/views/user/header.jsp"/>

<body>

<div class="container" style="margin-bottom : 50px">
	<div class="title">
		<p class="word">My 리뷰</p>
	</div>

	<div class="secondpara">
		<table class="table table-hover" border="1">
		<col width="50"/>
		<col width="800"/>
		<col width="100"/>
		<tr class="tabletitle">
			<th>번호</th>
			<th>내용</th>
			<th>평가</th>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<tr><td colspan="3">----------------작성된 글이 존재하지 않습니다--------------------</td></tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.myno }</td>
						<td>${dto.mycontent }</td>
						<td>${dto.mydate }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
	</table>
		<div style="text-align:center">
			<ul class="pagination">
				<li>
					<a href="#" aria-label="Previous"> 
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#" aria-label="Next"> 
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</ul>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/user/footer.jsp" />
</body>
</html>