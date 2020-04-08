<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/agent/css/reset.css">
<link rel="stylesheet" type="text/css" href="resources/agent/css/agent_notice.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
/*$(document).ready(function() {
	
});*/
	
	function selectone(seq_nt,page,perPageNum){
		location.href="selectone.agent?seq_nt="+seq_nt+"&page="+page+"&perPageNum="+perPageNum;
	}
	

</script>
</head>
<body>
<%@ include file="form/agent_header.jsp" %>
	<div class="noticewrap">
		<div class="servicehead">
		공지사항
		</div>
		<div class="noticetable">
			<table>
					<colgroup>
						<col width="10%">
						<col width="*">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>날짜</th>
						</tr>
					</thead>
					<tbody><!-- 나중에 db값 불러오기 -->
					<c:choose>
						<c:when test="${empty list }">
							<tr>
								<th colspan="3">===작성된 글이 존재하지 않습니다===</th>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list }" var="dto">
								<tr>
									<td>${dto.seq_nt }</td>
									<td onclick="selectone(${dto.seq_nt},${cri.page},${cri.perPageNum})">
										<a href="selectone.agent?seq_nt=${dto.seq_nt }&page=${cri.page}&perPageNum=${cri.perPageNum}">${dto.title_nt }</a>
									</td>
									<td><fmt:formatDate value="${dto.date_nt }" pattern="yyyy.MM.dd"/></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					</tbody>
			</table>
			<!-- 숫자페이징 -->
			<div class="pagination">
					<ul>
					<c:if test="${pageMaker.prev }">
				    	<li class="arrow"><a href="noticelist.all${pageMaker.makeQuery(pageMaker.startPage-1) }">&laquo;</a></li>
				    </c:if>
				    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				    	<li><a href="noticelist.all${pageMaker.makeQuery(idx) }">${idx }</a></li>
				    </c:forEach>
				    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				    <li class="arrow">
				      <a href="noticelist.all${pageMaker.makeQuery(pageMaker.endPage+1) }">
				        &raquo;
				      </a>
				    </li>
				     </c:if> 
				  </ul>
			</div>
		</div>
	<!-- 관리자페이지에서 글 쓸 수있게??? 관리자만 -->
	</div>

<%@ include file="form/agent_footer.jsp" %>

</body>
</html>