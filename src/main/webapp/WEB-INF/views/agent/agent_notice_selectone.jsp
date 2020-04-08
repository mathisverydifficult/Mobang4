<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/agent/css/reset.css">
<link rel="stylesheet" type="text/css" href="resources/agent/css/agent_notice.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<%@ include file="form/agent_header.jsp" %>
	<div class="noticewrap">
		<div class="servicehead">공지사항</div>
		<div class="noticeselectwrap">
			<h2>${dto.title_nt }</h2>
				<div class="sysinfo">
					<p class="last">
						<fmt:formatDate value="${dto.date_nt }" pattern="yyyy년 MM월 dd일"/>
					</p>
				</div>
			<input type="hidden" id="board_no" value="">
			<div class="text">
				<p>${dto.content_nt }</p>
				<button onclick="location.href='noticelist.all?page=${cri.page}&perPageNum=${cri.perPageNum }'">목록</button>
			</div>
		</div>

	</div><!-- noticewrap -->



	<%@ include file="form/agent_footer.jsp" %>
</body>
</html>