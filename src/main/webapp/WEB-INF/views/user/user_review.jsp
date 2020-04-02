<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/user/css/user_review.css">

</head>
<jsp:include page="/WEB-INF/views/user/header.jsp"/>

<body>

			<table>
					<colgroup>
						<col width="15%">
						<col width="*">
						<col width="5%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th>중개사</th>
							<th>리뷰 내용</th>
							<th>별점</th>
							<th>날짜</th>
						</tr>
					</thead>
					<tbody><!-- 나중에 db값 불러오기 -->
					<c:choose>
						<c:when test="${empty list }">
							<tr>
								<th colspan="4">===작성된 글이 존재하지 않습니다===</th>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list }" var="dto">
								<tr>
									<td>${dto.agemail }</td>
									<td>${dto.rcontent }</td>
									<td>${dto.star }</td>
									<td>${dto.rdate }</td>
								<!-- 	<td><fmt:formatDate value="${dto.rdate }" pattern="yyyy.MM.dd"/></td>  -->
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					</tbody>
			</table>

			<div class="pagination">
					<ul>
					<c:if test="${pageMaker.prev }">
				    	<li class="arrow"><a href="review_list.user${pageMaker.makeQuery(pageMaker.startPage-1) }">&laquo;</a></li>
				    </c:if>
				    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				    	<li><a href="review_list.user${pageMaker.makeQuery(idx) }">${idx }</a></li>
				    </c:forEach>
				    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				    <li class="arrow">
				      <a href="review_list.user${pageMaker.makeQuery(pageMaker.endPage+1) }">
				        &raquo;
				      </a>
				    </li>
				     </c:if> 
				  </ul>
			</div>

</body>
</html>