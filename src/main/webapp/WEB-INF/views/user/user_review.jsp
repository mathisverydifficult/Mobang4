<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/user/css/user_review.css">
<style type="text/css">

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</head>
<jsp:include page="/WEB-INF/views/user/header.jsp"/>
<body>

<div class="jumbotron text-center" id="headblock" style="background-color:#33558B;">
  <div>
  	<h1 style="color: white;">My 리뷰</h1>
  </div>
  
</div>

<div class="container">

	<table class="table table-bordered ">
			<colgroup>
				<col width="15%">
				<col width="65%">
				<col width="5%">
				<col width="15%">
			</colgroup>
			<thead class="thead-light">
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
					<tr class="table-danger">
						<th colspan="4">===작성된 글이 존재하지 않습니다===</th>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<tr class="table-secondary">
							<td>${dto.agemail }</td>
							<td>${dto.rcontent }</td>
							<td>${dto.star }</td>
							<td><fmt:formatDate value="${dto.rdate }" pattern="yyyy.MM.dd"/></td>
						<!-- 	<td><fmt:formatDate value="${dto.rdate }" pattern="yyyy.MM.dd"/></td>  -->
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			</tbody>
	</table>

	<ul class="pagination pagination-lg justify-content-center" id="paging">
		<c:if test="${pageMaker.prev }">
	    	<li class="page-item"><a class="page-link" href="review_list.user${pageMaker.makeQuery(pageMaker.startPage-1) }">&laquo;</a></li>
	    </c:if>
	    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
	    	<li class="page-item"><a class="page-link" href="review_list.user${pageMaker.makeQuery(idx) }">${idx }</a></li>
	    </c:forEach>
	    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	    	<li class="page-item"><a class="page-link" href="review_list.user${pageMaker.makeQuery(pageMaker.endPage+1) }">&raquo;</a></li>
	    </c:if> 
	</ul>
	
	
	
	
	

</div>	
<div class="container">

	
	<c:forEach items="${list }" var="dto" varStatus="status"> <!-- forEach 객체마다 id 다르게 주는 방법 -->
		
		${dto.agemail } , ${dto.rcontent }, ${dto.star }, <fmt:formatDate value="${dto.rdate }" pattern="yyyy.MM.dd"/>,${status.index} <br/>
		<button type="button" class="btn" data-toggle="collapse" data-target="${status.index}">글 자세히 보기</button>
		<div id="${status.count}" class="collapse">
		  	<div class="form-group">
			  <label for="comment">Comment:</label>
			  <textarea class="form-control" rows="5" id="comment">${dto.rcontent }</textarea>
			</div>	  	
		</div>
		<br/>
	</c:forEach>	


</div>		


<br/><br/><br/>
<br/><br/>
<br/><br/>
<br/><br/>
<br/><br/>
<br/><br/>
<br/><br/>
<br/><br/>
<br/><br/>
<jsp:include page="/WEB-INF/views/user/footer.jsp" />	
</body>
</html>