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
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="resources/css/bootstrap.min.css"> 
<link rel="stylesheet" href="resources/css/bootstrap-theme.min.css">
<style type="text/css">


</style>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	
	$('table tbody tr td').hover(function(){
		$(this).parent().css({'background-color': 'rgba(51, 85, 139,0.6)','color': 'rgb(255,255,255)'});
		$(this).find('a').css('color','rgb(255,255,255)');
	},function(){
		$(this).parent().css({'background-color':'' ,'color': 'black'});
		$(this).find('a').css('color','black');
	});
	
	
});

</script>
</head>
<jsp:include page="/WEB-INF/views/admin/form/header.jsp" />
<body>

<div class="jumbotron text-center" id="headblock" style="background-color:#33558B;">
  <div>
  	<h1 style="color: white;">공지사항</h1>
  </div>
</div>
	
<div class="container">
	
		<form action="notice_multidelete.admin" method="get" id="muldelform">
	
			<table class="table table-hover">
				<tr>
					<th><input type="checkbox" name="all" onclick="allChk(this.checked)" /></th>
					<th>번호</th>
					<th>제목</th>
					<th>날짜</th>
				</tr>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<th colspan="4">===작성된 글이 존재하지 않습니다===</th>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<tr onclick="">
							<td><input type="checkbox" name="chk" value="${dto.seq_nt }"/></td>
							<td>${dto.seq_nt }</td>
							<td><a href="notice_selectone.admin?seq_nt=${dto.seq_nt }">${dto.title_nt }</a></td>
							<td><fmt:formatDate value="${dto.date_nt }" pattern="yyyy.MM.dd"/></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
				<tr>
					<td colspan="4" align="right">
						<input type="button" value="글작성" onclick="location.href='notice_insertform.admin'">
						<input type="submit" value="글삭제"/>
					</td>
					
				</tr>
		</table>
		<!-- 숫자페이징 -->
		<div class="pagination">
				<ul class="pagination">
				<c:if test="${pageMaker.prev }">
			    	<li class="arrow"><a href="notice_list.admin${pageMaker.makeQuery(pageMaker.startPage-1) }">&laquo;</a></li>
			    </c:if>
			    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			    	<li><a href="notice_list.admin${pageMaker.makeQuery(idx) }">${idx }</a></li>
			    </c:forEach>
			    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			    <li class="arrow">
			      <a href="notice_list.admin${pageMaker.makeQuery(pageMaker.endPage+1) }">
			        &raquo;
			      </a>
			    </li>
			     </c:if> 
			  </ul>
		</div>
		
		
	</form>	
</div>
		
		
	<!-- 관리자페이지에서 글 쓸 수있게??? 관리자만 -->
	
<script type="text/javascript">

// 맨위 체크하면 전체 체크됨
function allChk(bool) {
	var doc = $("input[name=chk]").each(function () {
		$(this).prop("checked", bool);
	})
};

// 유효성 검사 (체크 하나도 안하면 submit 이벤트 취소)
$(function () {
	$("#muldelform").submit(function () {
		if($("#muldelform input:checked").length == 0){
			alert("하나 이상 체크해주세요");
			return false;

		}
		
	});

});

</script>
	
</body>
</html>