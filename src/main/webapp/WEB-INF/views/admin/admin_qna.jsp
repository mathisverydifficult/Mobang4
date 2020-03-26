<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="resources/css/bootstrap.min.css"> 
<link rel="stylesheet" href="resources/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.css" >
<link rel="stylesheet" type="text/css" href="resources/admin/css/reset.css">

  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.js"></script>

<title></title>
</head>
<body>
<%@ include file="form/admin_header.jsp" %>


<br/><br/><br/>
<br/><br/><br/>
<br/><br/><br/>
<br/><br/><br/>
<br/><br/>
<br/>


<div class="container">

	
	
	<form action="qna_multidelete.admin" method="get" id="muldelform">
		<table class="table table-hover">
			
			<tr>
				<th><input type="checkbox" name="all" onclick="allChk(this.checked)" /></th>
				<th>글번호</th>
				<th>작성자</th>
				<th>글구분</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
			<c:choose>
				<c:when test="${empty list }">
					<tr><td colspan="6">"작성된 글이 존재하지 않습니다."</td></tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<tr>
							<td><input type="checkbox" name="chk" value="${dto.seqQ }"/></td>
							<td>${dto.seqQ }</td>
							<td>${dto.email }</td>
							<td>${dto.titletQ }</td>
							<td><a href ="qna_selectone.admin?seqQ=${dto.seqQ }">${dto.titleQ }</a></td>
							<td>${dto.dateQ }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="5" align="right">
					<input type="button" value="글작성" onclick="location.href='qna_insertform.admin'">
				</td>
				<td>
					<input type="submit" value="글삭제"/>
				</td>
			</tr>
		</table>
	</form>
	
	<div class="text-center">
		<ul class="pagination">
		  <li class="page-item"><a class="page-link" href="#">Previous</a></li>
		  <li class="page-item"><a class="page-link" href="#">1</a></li>
		  <li class="page-item active"><a class="page-link" href="#">2</a></li>
		  <li class="page-item"><a class="page-link" href="#">3</a></li>
		  <li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
		
	
	</div>
	
	
	<br/><br/><br/><br/><br/><br/>
	
	<br/><br/><br/><br/><br/><br/>
	<br/><br/><br/><br/><br/><br/>
	<br/><br/><br/><br/><br/><br/>
	
	<br/><br/><br/><br/><br/><br/>
	<br/><br/><br/><br/><br/><br/>
	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	
	
	
	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	
	<br/><br/><br/><br/><br/><br/>
	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	
	
	
	<form method="post">
	  <textarea id="summernote" name="editordata"></textarea>
	</form>
	
	
</div>
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




<%@ include file="form/admin_footer.jsp" %>
</body>
</html>